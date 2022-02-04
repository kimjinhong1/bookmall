package bookmall.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	// 첫 접속페이지 , 로그인 페이지
	@GetMapping("/admin/index.do")
	public String index() {
		return "admin/index"; 
	} 
	
	// 로그인 실행
	@PostMapping("/admin/login.do")
	public String adminLogin(Model model, AdminVo avo, HttpSession sess) {
		if (service.login(avo, sess)) {
			return "redirect:/admin/member/index.do";
		} else {
			model.addAttribute("msg", "이메일, 비밀번호를 확인해 주세요");
			return "include/return";
		}
	}
	
	@GetMapping("/admin/logout.do")
	public String adminLogout(Model model, HttpSession sess) {
		sess.invalidate();
		model.addAttribute("msg", "로그아웃 되었습니다.");
		model.addAttribute("url", "index.do");
		return "include/return";
	}
	
	
	@GetMapping("/admin/board/index.do")
	public String boardIndex() {
		return "admin/board/index"; 
	}
	
	@GetMapping("/admin/board/view.do")
	public String boardView() {
		return "admin/board/view"; 
	}
	
	@GetMapping("/admin/board/write.do")
	public String boardWrite() {
		return "admin/board/write"; 
	}
	
	@RequestMapping("/admin/orders/totOrders.do")
	public String totOrders() {
		return "admin/orders/totOrders"; 
	}
	
}
