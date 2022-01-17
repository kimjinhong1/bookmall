package bookmall.ask;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bookmall.cart.CartDto;
import bookmall.user.UserVo;
import bookmall.util.CommonUtil;

@Controller
public class AskController {
	
	@Autowired
	AskService askService;
	
	@PostMapping("/ask/insert")
	@ResponseBody //메소드에서 리턴되는 값은 View 를 통해서 출력되지 않고 HTTP Response Body 에 직접 쓰여지게 됨
	public String insertPOST(AskVo askvo, HttpServletRequest req) { //등록할 데이터를 전달받아야 하기 때문에 CartDto 타입의 파라미터 변수를 선언, 추가로 로그인 여부를 확인하기 위해 session 객체가 필요로 하기 때문에 HttpservletRequest 타입의 파라미터 변수선언
		//로그인체크
		HttpSession session = req.getSession();
		UserVo uvo = (UserVo)session.getAttribute("askInfo");
		if (uvo == null) {
			return "0";
		}
		
		//문의등록
		askvo.setUserno(uvo.getUserno());
		int result = askService.insert(askvo);
		return result + "";
	}

	@GetMapping("/ask/askindex.do")
	public String index() {
		return "ask/askindex";
	}
	
	@RequestMapping("/ask/askwrite.do")
	public String write() {
		return "ask/askwrite";
	}
	
	@PostMapping("/ask/askinsert.do")
	public String insert(AskVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("askInfo")).getUserno());
		//파일저장 
		if (!file.isEmpty()) { // 사용자가 파일을 첨부했다면 
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename(); // 사용자가 업로드한 원본 파일
				String ext = filename.substring(filename.lastIndexOf(".")); // 확장자 (.jpg)
				String filename_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+filename_real)); // 경로에 파일을 저장 
				vo.setFilename_org(filename);
				vo.setFilename_real(filename_real);
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = askService.insert(vo);
		
		// 정상적으로 등록되었습니다. alert 띄우고 
		// index.do 로 이동 
		if(r > 0) {
		req.setAttribute("msg", "정상적으로 등록되었습니다");
		req.setAttribute("url", "askindex.do");
		} else {
			req.setAttribute("msg", "등록 오류 ");
			req.setAttribute("url", "askwrite.do");
		}
		
		return "include/return";
		}

	@GetMapping("/ask/askview.do") //상세 
	public String viewUser(Model model, @RequestParam int askno, HttpServletRequest request) {
		model.addAttribute("data", askService.view(askno));
		return "/ask/askview";
	}
	
	@GetMapping("/ask/askedit.do")
	public String edit(Model model, @RequestParam int askno) {
		model.addAttribute("data", askService.edit(askno));
		return "ask/askedit";
	}
	
	@GetMapping("/ask/askdelete.do")
	public String delete(Model model, AskVo vo) {
		int r = askService.delete(vo); 
		if(r > 0) {
			model.addAttribute("msg","정상적으로 삭제되었습니다.");
			model.addAttribute("url","index.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","삭제 오류");
			model.addAttribute("url","view.do?askno="+vo.getAskno()); //실패했을때 상세페이지 이동 
		}
		return "include/return";
	}
	@GetMapping("/ask/deleteAjax.do")
	public String deleteAjax(Model model, AskVo vo) {
		model.addAttribute("result",askService.delete(vo));
		return "include/result";
	}
}
