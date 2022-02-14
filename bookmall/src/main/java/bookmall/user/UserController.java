package bookmall.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bookmall.ask.AskService;
import bookmall.ask.AskVo;
import bookmall.mylist.MylistService;
import bookmall.mylist.MylistVo;
import bookmall.orders.OrderVo;
import bookmall.recentOrder.RecentOrderService;
import bookmall.recentOrder.RecentOrderVo;
import bookmall.util.SendMail;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	
	@Autowired
	AskService askService;
	
	@Autowired
	MylistService mylistService;
	
	@Autowired
	RecentOrderService recentOrderService;
	
	//로그인 페이지 이동
	@GetMapping("/user/login.do")
	public String login() {		
		return "user/login";
	}
	
	// 회원가입 페이지 이동
	@GetMapping("/user/join.do")
	public String join() {
		return "user/join";
	}
	
	// EmailId 중복체크
	@GetMapping("/user/emailCheck.do")
	public String emailCheck(Model model, @RequestParam String email) {
		model.addAttribute("result", service.emailCheck(email));  
		return "include/result";
	}
	
	// Email 인증
	@GetMapping("/user/emailAuth.do")
	public String emailAuth(Model model, HttpSession sess, @RequestParam String email) {
		String auth = SendMail.random(); //인증 코드 생성
		sess.setAttribute("emailAuth", auth); // 세션에 추가
		int success = SendMail.sendMail(email, "인증번호 입니다.", auth); // 인증번호 이메일 전송
		model.addAttribute("result", success);
		return "include/result";
	}
	
	// 인증번호 확인
	@GetMapping("/user/authCheck.do")
	public String authCheck(Model model, HttpSession sess, @RequestParam String email_auth) {
		// 인증번호 일치 여부 확인
		int val = 0; // 인증여부 
		if (!(sess.getAttribute("emailAuth") == null)) {
			if (sess.getAttribute("emailAuth").equals(email_auth) ) {
				val = 1;
				sess.removeAttribute("emailAuth"); //세션에 저장된 이메일 인증코드 삭제
			}
		}
		model.addAttribute("result", val);		
		return "include/result";
	}
	
	// nickname 중복체크
	@GetMapping("/user/nickCheck.do")
	public String nickCheck(Model model, @RequestParam String nickname) {
		model.addAttribute("result", service.nickCheck(nickname));  //0 or 1 이 request에 저장
		return "include/result";
	}
	
	
	// 회원수정 페이지 이동
	@GetMapping("/user/edit.do")
	public String edit(Model model, UserVo vo, HttpSession sess) {
		UserVo uv = (UserVo)sess.getAttribute("userInfo");
		UserVo suv = service.userSelect(uv);
		model.addAttribute("user", suv);
		return "user/edit";
	}
	// 비밀번호 변경 페이지 이동
	@GetMapping("/user/pwdedit.do")
	public String pwdEdit(HttpSession sess) {
		return "user/pwdedit";
	}
	
	// 비밀번호 확인 [수정]
	@GetMapping("/user/pwdCheck.do")
	public String pwdCheck(Model model, UserVo vo) {
		int r = service.pwdCheck(vo);
		model.addAttribute("result", r);
		return "include/result";
	}
	
	// 비밀번호 업데이트
	@PostMapping("/user/pwdupdate.do")
	public String pwdUpdate(UserVo vo, Model model, HttpSession sess) {
		model.addAttribute("result", service.pwdUpdate(vo));  //0 or 1 이 request에 저장
		return "include/result";
	}
	
	
	// 닉네임 변경 페이지 이동
	@PostMapping("/user/nickedit.do")
	public String nickEdit(HttpSession sess) {
		return "user/nickedit";
	}
	
	// 닉네임 업데이트
	@PostMapping("/user/nickupdate.do")
	public String nickUpdate(UserVo vo, Model model, HttpSession sess) {
		model.addAttribute("result", service.nickUpdate(vo));  //0 or 1 이 request에 저장
		return "include/result";
	}
	
	// 회원가입 정보 삽입
	@PostMapping("/user/insert.do")
	public String insert(UserVo vo, HttpServletRequest req, HttpSession sess) {
		if (service.insert(vo) > 0) {
			req.setAttribute("msg", "정상적으로 가입되었습니다.");
			req.setAttribute("url", "/bookmall/main.do");
		} else {
			req.setAttribute("msg", "가입오류");			
		}
		return "include/return";
	}
	
	
	// 회원정보 수정 삽입
	@PostMapping("/user/update.do")
	public String update(UserVo vo, HttpServletRequest req, HttpSession sess) {
		int r = service.userUpdate(vo);
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 입력되었습니다.");
			req.setAttribute("url", "/bookmall/main.do");
		} else {
			req.setAttribute("msg", "수정 오류");
		}
		return "include/return";
	}
	
	// 로그인
	@PostMapping("/user/login.do")
	public String loginProcess(Model model, UserVo vo, HttpSession sess) {
		if (service.login(vo, sess)) {
			return "redirect:/main.do";
		} else {
			model.addAttribute("msg", "이메일, 비밀번호를 확인해 주세요");
			return "include/return";
		}		
	}
	
	// 소셜 중복체크
	@GetMapping("/user/socialCheck.do")
	public String socialCheck(Model model, @RequestParam String identifier) {
		model.addAttribute("result", service.socialCheck(identifier));  //0 or 1 이 request에 저장
		return "include/result";
	}
	
	// social 로그인
	@RequestMapping(value="/user/snsLogin/{userId}", method=RequestMethod.GET)
	public String snsLogin( @PathVariable String userId, HttpSession sess, UserVo vo, Model model ) throws Exception{
	    vo.setIdentifier(userId); 
	    if (service.socialLogin(vo, sess)) {
	    	// 추가정보 입력 ( 정보없으면 추가정보 입력으로 보냄)
	    	if( (((UserVo)sess.getAttribute("userInfo")).getAddr1() == null) ||
	    			(((UserVo)sess.getAttribute("userInfo")).getAddr2() == null) ||
	    			(((UserVo)sess.getAttribute("userInfo")).getZipcode() == null) ||
	    			(((UserVo)sess.getAttribute("userInfo")).getNickname() == null) ||
	    			(((UserVo)sess.getAttribute("userInfo")).getName() == null) ||
	    			(((UserVo)sess.getAttribute("userInfo")).getGender() == 0) ||
	    			(((UserVo)sess.getAttribute("userInfo")).getTel() == null))    {
	    		return "redirect:/user/socialEdit.do";
	    	}
			return "redirect:/main.do";
		} else {
			model.addAttribute("msg", "소셜 로그인 오류");
			return "include/return";
		}	
	}
	
	// social 추가정보 입력페이지
	@GetMapping("/user/socialEdit.do")
	public String socialEdit(Model model, UserVo vo, HttpSession sess) {
		UserVo uv = (UserVo)sess.getAttribute("userInfo");
		UserVo suv = service.userSelect(uv);
		model.addAttribute("user", suv);
		return "user/socialEdit";
	}
	
	// 네이버 callback
	@GetMapping("/user/naverCallback.do")
	public String naverCallback() {
		return "user/naverCallback";
	}
	
	// 네이버 callback 취소
	@RequestMapping(value="/user/naverCallback.do?error={msg}", method=RequestMethod.POST)
	public String naverCallbackCancel() {
		
		return "user/naverCallback";
	}
	
	// 로그아웃
	@GetMapping("/user/logout.do")
	public String logout(Model model, HttpSession sess) {
		sess.invalidate();
		model. addAttribute("msg", "로그아웃이 되었습니다.");
		model.addAttribute("url", "/bookmall/main.do");
		return "include/return";
	}
	// 이메일 찾기 페이지 이동
	@RequestMapping(value="/user/searchId.do", method=RequestMethod.GET)
	public String searchId() {
		return "user/searchId";
	}
	// 이메일 찾기 실행
	@RequestMapping(value="/user/searchId.do", method=RequestMethod.POST)
	public String searchId(Model model, UserVo vo) {
		UserVo uv = service.searchId(vo);
		model.addAttribute("result", uv == null ? "" : uv.getEmail());
		return "include/result";
	}
	// 비밀번호 찾기 페이지 이동
	@RequestMapping(value="/user/searchPwd.do", method=RequestMethod.GET)
	public String searchPwd() {
		return "user/searchPwd";
	}
	// 비밀번호 찾기 페이지 실행
	@RequestMapping(value="/user/searchPwd.do", method=RequestMethod.POST)
	public String searchPwd(Model model, UserVo vo) {
		UserVo uv = service.searchPwd(vo);
		model.addAttribute("result", uv == null ? "" : uv.getEmail());
		return "include/result";
	}

	
	// 회원탈퇴 페이지 이동
	@GetMapping("/user/remove.do")
	public String remove(HttpSession sess) {
		return "user/remove";
	}
	
	// 회원 탈퇴 
	@PostMapping("user/delete.do")
	public String delete(UserVo vo, Model model,HttpSession sess) {
		model.addAttribute("result", service.userDelete(vo));
		sess.removeAttribute("userInfo");
		return "include/result";
	}
	
	//마이페이지 화면에 문의내역, 마이리스트 목록 띄우기
	@GetMapping("/user/mypage.do")
	public String mypage(Model model, AskVo vo, MylistVo listvo, RecentOrderVo ordervo, HttpSession session) {
		UserVo uvo = (UserVo)session.getAttribute("userInfo");
		vo.setPageRow(5);
		ordervo.setPageRow(3);

		vo.setUserno(uvo.getUserno());
		listvo.setUserno(uvo.getUserno());  
		ordervo.setUserno(uvo.getUserno());  
		model.addAttribute("askList", askService.askList(vo));
		model.addAttribute("dibsList", mylistService.listMypage(listvo));
		model.addAttribute("recentOrderInfo", recentOrderService.orderMypage(ordervo));
		return "user/mypage";
	}
	

	
}
