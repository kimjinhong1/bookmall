package bookmall.admin.book;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import bookmall.book.BookVo;

@Controller
public class AdminBookController {

	@Autowired
	AdminBookService service;
	
	// (관리자) 도서 관리 - 목록 페이지
	@GetMapping("/admin/book/index.do")
	public String bookIndex(Model model, HttpServletRequest req, BookVo vo) {
		
		List<BookVo> list = service.selectList(vo);
		model.addAttribute("list", list);
		return "admin/book/index";
	}
	
	// (관리자) 도서 관리 - 도서 상세 페이지
	@GetMapping("/admin/book/detail.do")
	public String bookDetail(Model model, @RequestParam int bookno) {
		model.addAttribute("data", service.selectOne(bookno));
		return "admin/book/book_detail_admin";
	}
	
	// (관리자) 도서 관리 - 등록 페이지
	@GetMapping("/admin/book/write.do")
	public String bookInsert() {
		return "admin/book/regbook";
	}
	
	// (관리자) 도서 등록
	@PostMapping("/admin/book/insert.do")
	public String insertBook(BookVo vo, HttpServletRequest req, @RequestParam(value="bthumb_org_file") MultipartFile file, HttpSession sess) {
		
		//파일저장 
		if (file != null && !file.isEmpty()) { // 사용자가 파일을 첨부했다면 
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename(); // 사용자가 업로드한 원본 파일
				String ext = filename.substring(filename.lastIndexOf(".")); // 확장자 (.jpg)
				String filename_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+filename_real)); // 경로에 파일을 저장 
				vo.setBthumb_org(filename);
				vo.setBthumb_real(filename_real);
				
				System.out.println("org : " + vo.getBthumb_org());
				System.out.println("real : " + vo.getBthumb_real());
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = service.insert(vo);
		
		// 정상적으로 등록되었습니다. alert 띄우고 
		// index.do 로 이동 
		if(r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다");
			req.setAttribute("url", "/bookmall/admin/book/index.do");
		} else {
			req.setAttribute("msg", "등록 오류 ");
			req.setAttribute("url", "/bookmall/admin/book/write.do");
		}

		return "admin/include/bookResult";
	}
	
	// ISBN 중복체크
	@GetMapping("/admin/isbnCheck.do")
	public String isbnCheck(Model model, @RequestParam String isbn) {
		model.addAttribute("result", service.isbnCheck(isbn));  //0 or 1 이 request에 저장
		return "include/result";
	}
	
	// (관리자) 도서 관리 - 수정 페이지
	@GetMapping("/admin/book/update.do")
	public String bookUpdate(Model model, @RequestParam int bookno) {
		model.addAttribute("data", service.selectOne(bookno));
		return "admin/book/updatebook";
	}
	
	// (관리자) 도서 수정
	@PostMapping("/admin/book/edit.do")
	public String updateBook(BookVo vo, HttpServletRequest req, @RequestParam(value="bthumb_org_file") MultipartFile file, HttpSession sess) {
		
		//파일저장 
		if (file != null && !file.isEmpty()) { // 사용자가 파일을 첨부했다면 
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename(); // 사용자가 업로드한 원본 파일
				String ext = filename.substring(filename.lastIndexOf(".")); // 확장자 (.jpg)
				String filename_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+filename_real)); // 경로에 파일을 저장 
				vo.setBthumb_org(filename);
				vo.setBthumb_real(filename_real);
				
				System.out.println("org : " + vo.getBthumb_org());
				System.out.println("real : " + vo.getBthumb_real());
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = service.update(vo);
		
		// 정상적으로 등록되었습니다. alert 띄우고 
		// index.do 로 이동 
		if(r > 0) {
			req.setAttribute("msg", "정상적으로 수정되었습니다");
			req.setAttribute("url", "detail.do?bookno=" + vo.getBookno());
		} else {
			req.setAttribute("msg", "수정 오류 ");
			req.setAttribute("url", "update.do?bookno=" + vo.getBookno());
		}

		return "admin/include/bookResult";
	}
	
	// (관리자) 도서 관리 - 삭제
	@PostMapping("/admin/book/delete.do")
	public String deleteBook(BookVo vo, HttpServletRequest req) {
		
		int r = service.delete(vo);
		
		// 정상적으로 등록되었습니다. alert 띄우고 
		// index.do 로 이동 
		if(r > 0) {
			req.setAttribute("msg", "정상적으로 삭제되었습니다");
			req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "삭제 오류 ");
			req.setAttribute("url", "detail.do?bookno=" + vo.getBookno());
		}

		return "admin/include/bookResult";
	}

}
