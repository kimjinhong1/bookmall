package bookmall.book;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookController {

	@Autowired
	BookService bookService;
	
	// 국내도서 페이지
	@GetMapping("/book/korean.do")
	public String korean(Model model, HttpServletRequest req, BookVo vo) {
		List<BookVo> list = bookService.selectList(vo);
		model.addAttribute("list", list);
		return "book/koreanbooklist";
	}
	
	// 국외도서 페이지
	@GetMapping("/book/abroad.do")
	public String abroad() {
		return "book/abroadbooklist";
	}
	
	// 도서목록 페이지
	@GetMapping("/book/booklist.do")
	public String booklist(Model model, HttpServletRequest req, BookVo vo) {
		List<BookVo> list = bookService.selectList(vo);
		model.addAttribute("list", list);
		return "book/booklist";
	}
	
	// 도서 상세 페이지
	@GetMapping("/book/detail.do")
	public String detail(Model model, @RequestParam int bookno) {
		model.addAttribute("data", bookService.selectOne(bookno));
		return "book/book_detail";
	}
	
}
