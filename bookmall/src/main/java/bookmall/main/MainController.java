package bookmall.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/main.do")
	public String main() {
		return "main"; 
	}
	
}
