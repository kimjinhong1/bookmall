package bookmall.admin.book;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bookmall.book.BookVo;
import bookmall.bookcategory.BookCategoryMappingVO;
import bookmall.util.CommonUtil;

@Controller
public class AdminBookController {

	@Autowired
	AdminBookService service;
	
	// (관리자) 도서 관리 - 목록 페이지
	@GetMapping("/admin/book/index.do")
	public String bookIndex(Model model, HttpServletRequest req, BookVo vo,
							@RequestParam(required = false) Integer page,
							@RequestParam(required = false) String searchType,
							@RequestParam(required = false) String searchWord) {
		
		if(page != null) {
			vo.setPage(page);
		}
		
		if(searchType != null) {
			vo.setSearchWord(searchType);
		}
		
		if(searchWord != null) {
			vo.setSearchWord(searchWord);
		}
		
		// 총 도서 수
		int totCount = service.AdminbookCount(vo); 
		
		// 총 페이지 수
		int totPage = totCount / 10; // ex) 31개면 3페이지
		if (totCount % 10 > 0) 
			totPage++; //나눠서 나머지 있으면 1페이지 추가
		
		//시작 인덱스 값 구하기, 10개씩 나오게, 1페이지 0~9, 2페이지 10~19
		int startIdx = (vo.getPage() - 1) * 10; //초기값 1이므로 0
		vo.setStartIdx(startIdx);
		
		List<BookVo> list = new ArrayList<BookVo>();
		
		if(totCount > 0) {
			list = service.selectAdminList(vo);
		} 
		
		model.addAttribute("totPage", totPage);	
		model.addAttribute("totCount", totCount);
		model.addAttribute("list", list);
		model.addAttribute("pageArea", CommonUtil.getAdminBookListPageArea("index.do", vo.getPage(), totPage, 10, vo));
		
		return "admin/book/index";
	}
	
	// (관리자) 도서 관리 - 도서 상세 페이지
	@GetMapping("/admin/book/detail.do")
	public String bookDetail(Model model, @RequestParam int bookno) {
		model.addAttribute("data", service.selectOne(bookno));
		model.addAttribute("list", service.selectCate(bookno));
		return "admin/book/book_detail_admin";
	}
	
	// (관리자) 도서 관리 - 등록 페이지
	@GetMapping("/admin/book/write.do")
	public String bookInsert() {
		return "admin/book/regbook";
	}
	
	// (관리자) 도서 등록
	@PostMapping("/admin/book/insert.do")
	public String insertBook(BookVo vo, 
							HttpServletRequest req, 
							@RequestParam(value="bthumb_org_file") MultipartFile file, 
							HttpSession sess,
							BookCategoryMappingVO bcmvo) {
		
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

		if(r > 0) {
			
			// 도서 정보 INSERT 이후, 도서-카테-매핑 테이블에도 INSERT
			String[] bcategoryno = (req.getParameter("categoryList")).split(",");
			
			for(int i = 0; i < bcategoryno.length; i++) {
				bcmvo.setBcategoryno(Integer.parseInt(bcategoryno[i]));
				service.insertMapping(bcmvo);
			}
			
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
	
	// (관리자) 도서 관리 - 등록 시 필요한 카테고리 리스트 정보≈
	@GetMapping("/admin/book/selectCateList.do")
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
		
		List<HashMap<String, Object>> list = service.selectCateList(bclassify, blevel, bcategoryno);

		return list;
		
	}

}
