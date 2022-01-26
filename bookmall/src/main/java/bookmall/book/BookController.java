package bookmall.book;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 국내도서목록 페이지
	@GetMapping("/book/koreanbooklist.do")
	public String koreanbooklist(Model model, HttpServletRequest req, BookVo vo) {
		List<BookVo> list = bookService.selectList(vo);
		model.addAttribute("list", list);
		return "book/booklist";
	}
	
	// 국외도서목록 페이지
	@GetMapping("/book/abroadbooklist.do")
	public String abroadbooklist(Model model, HttpServletRequest req, BookVo vo) {
		List<BookVo> list = bookService.selectList(vo);
		model.addAttribute("list", list);
		return "book/booklist";
	}
	
	// 도서 상세 페이지
	@GetMapping("/book/detail.do")
	public String detail(Model model, @RequestParam int bookno) {
		model.addAttribute("data", bookService.selectOne(bookno));
		model.addAttribute("list", bookService.selectCate(bookno));
		return "book/book_detail";
	}
	
	// 국내도서 목록 - 카테고리
	@GetMapping("/book/selectCateList.do")
	@ResponseBody // 데이터를 반환해주는 어노테이션
	public List<HashMap<String, Object>> selectCateList(HttpServletRequest req) {
		
		int bclassify = Integer.parseInt(req.getParameter("bclassify"));
		int blevel = 0;
		int bcategoryno = 0;
		
		if(!StringUtils.isEmpty(req.getParameter("blevel"))) {
			blevel = Integer.parseInt(req.getParameter("blevel"));
		}
		
		if(!StringUtils.isEmpty(req.getParameter("bcategoryno"))) {
			bcategoryno = Integer.parseInt(req.getParameter("bcategoryno"));
		}
		
		List<HashMap<String, Object>> list = bookService.selectCateList(bclassify, blevel, bcategoryno);

		return list;
		
	}
}
