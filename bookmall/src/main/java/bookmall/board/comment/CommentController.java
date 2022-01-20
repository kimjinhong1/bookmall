package bookmall.board.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommentController {

	@Autowired
	CommentService service;
	
	@RequestMapping("/center/comment/insert.do")
	public String insert(Model model, CommentVo vo) { 
		model.addAttribute("result",service.insert(vo)); 
		return "include/result";
		
	}
	
	@GetMapping("/center/comment/list.do")
	public String list(Model model, CommentVo vo) { 
		model.addAttribute("cList", service.selectList(vo)); 
		return "include/commentList"; 
	}
	
	@GetMapping("/center/comment/delete.do")
	public String delete(Model model, CommentVo vo) { 
		model.addAttribute("result", service.delete(vo.getNo())); 
		
		return "include/result";
	}
	
	@RequestMapping("/center/comment/reply.do")
	public String reply(Model model, CommentVo vo) { 
		model.addAttribute("result",service.reply(vo)); 
		return "include/result";
		
	}
}
