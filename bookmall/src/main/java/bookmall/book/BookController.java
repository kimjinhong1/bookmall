package bookmall.book;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.cj.util.StringUtils;

import bookmall.util.CommonUtil;

@Controller
public class BookController {

	@Autowired
	BookService bookService;
	
	// 도서메인 페이지
	@GetMapping("/book/mainbook.do")
	public String korean(Model model, HttpServletRequest req, BookVo vo,
						@RequestParam(value="bc") int classify) {
		
		vo.setClassify(classify);
		vo.setBclassify(classify);
		
		List<BookVo> list = bookService.selectNewBook(vo);
		List<BookVo> data = bookService.selectHotBook(vo);
		List<BookVo> cate = bookService.cateNameList(vo);
		
		model.addAttribute("newBook", list);
		model.addAttribute("hotBook", data);
		model.addAttribute("cate", cate);
		
		return "book/mainbook";
	}
	
	// 도서목록 페이지
	@GetMapping("/book/booklist.do")
	public String koreanbooklist(Model model, HttpServletRequest req, BookVo vo,
								@RequestParam(value="bc") int classify,
								@RequestParam(value="bc") int bclassify,
								@RequestParam(value="blev") int blevel,
								@RequestParam(value="cano") int bcategoryno,
								@RequestParam(value="listOrder", required = false) String listOrder,
								@RequestParam(required = false) Integer page,
								@RequestParam(required = false) Integer numchoose,
								@RequestParam(required = false) String searchWord) {
		
		if(page != null) {
			vo.setPage(page);
			vo.setNumchoose(numchoose);
		}
		
		vo.setClassify(classify);
		vo.setBclassify(bclassify);
		vo.setBlevel(blevel);
		vo.setBcategoryno(bcategoryno);
		
		if(searchWord != null) {
			vo.setSearchWord(searchWord);
		}
		
		// 총 갯수
		int totCount = bookService.bookCount(vo); 
		// 총 페이지 수
		int totPage = totCount / vo.getNumchoose(); // ex) 31개면 3페이지
		if (totCount % vo.getNumchoose() > 0) totPage++; //나눠서 나머지 있으면 1페이지 추가
		//시작 인덱스 값 구하기, 10개씩 나오게, 1페이지 0~9, 2페이지 10~19
		int startIdx = (vo.getPage()-1) * vo.getNumchoose(); //초기값 1이므로 0
		
		vo.setStartIdx(startIdx);
		
		
		if(!StringUtils.isNullOrEmpty(listOrder)) {
			vo.setListOrder(listOrder);
		}
		
		List<BookVo> list = new ArrayList<BookVo>();
		
		if(totCount > 0) {
			list = bookService.selectList(vo);
		} 
		
		List<BookVo> cate = bookService.cateNameList(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("cate", cate);
		model.addAttribute("param", vo);
		model.addAttribute("totPage", totPage);	
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getBookListPageArea("booklist.do", vo.getPage(), totPage, vo.getNumchoose(), vo));
		
		return "book/booklist";
	}
	

	// 도서 상세 페이지
	@GetMapping("/book/detail.do")
	public String detail(Model model, @RequestParam int bookno) {

		model.addAttribute("data", bookService.selectOne(bookno));
		model.addAttribute("list", bookService.selectCate(bookno));
		return "book/book_detail";
	}
	
	// 카테고리 바
	@GetMapping("/book/category.do")
	public String category(Model model, HttpServletRequest req, BookVo vo) {
		List<BookVo> cate = bookService.cateNameList(vo);
		model.addAttribute("cate", cate);
		return "book/category";
	}
}
