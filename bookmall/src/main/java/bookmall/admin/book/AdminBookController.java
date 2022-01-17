package bookmall.admin.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import bookmall.book.BookVo;

@Controller
public class AdminBookController {

	@Autowired
	AdminBookService service;
	
	@GetMapping("/admin/bookIndex.do")
	public String bookIndex(Model model, HttpServletRequest req, BookVo vo) {
		
		List<BookVo> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "admin/book/index";
	}
	
	
}
