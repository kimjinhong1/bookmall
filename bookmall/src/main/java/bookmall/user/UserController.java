package bookmall.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bookmall.util.SendMail;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	
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
		model.addAttribute("result", service.emailCheck(email));  //0 or 1 이 request에 저장
		return "include/result";
	}
	
	// EmailId 인증
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
	
	
	// 아이디, 비밀번호 찾기 기능 아직X
	@RequestMapping(value="/user/searchId.do", method=RequestMethod.GET)
	public String searchId() {
		return "user/searchId";
	}
	@RequestMapping(value="/user/searchId.do", method=RequestMethod.POST)
	public String searchId(Model model, UserVo vo) {
		//UserVo uv = service.searchId(vo);
		//model.addAttribute("result", uv == null ? "" : uv.getEmail());
		return "include/result";
	}
	
	@RequestMapping(value="/user/searchPwd.do", method=RequestMethod.GET)
	public String searchPwd() {
		return "user/searchPwd";
	}
	@RequestMapping(value="/user/searchPwd.do", method=RequestMethod.POST)
	public String searchPwd(Model model, UserVo vo) {
		//UserVo uv = service.searchPwd(vo);
		//model.addAttribute("result", uv == null ? "" : "ok");
		return "include/result";
	}
	@GetMapping("/user/mypage.do")
	public String mypage() {
		return "user/mypage";
	}
	
	@GetMapping("/user/ask.do")
	public String ask() {
		return "user/ask";
	}
	
	@GetMapping("/user/askwrite.do")
	public String askwrite() {
		return "user/askwrite";
	}
	
	@GetMapping("/user/recentorder.do")
	public String recentorder() {
		return "user/recentorder";
	}
	@GetMapping("/user/mylist.do")
	public String mylist() {
		return "user/mylist";
	}
	@GetMapping("/user/cart.do")
	public String cart() {
		return "user/cart";
	}
	

}
