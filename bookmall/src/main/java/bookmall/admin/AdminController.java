package bookmall.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping("/admin/index.do")
	public String index() {
		return "admin/index"; 
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
	
}
