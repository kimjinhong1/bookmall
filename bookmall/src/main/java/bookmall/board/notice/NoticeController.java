package bookmall.board.notice;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import bookmall.util.CommonUtil;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeservice;
	
	// Notice 관리 페이지 
	@GetMapping("/admin/board/notice/index.do") 
	public String index(Model model, HttpServletRequest req , NoticeVo vo) {
		int totCount = noticeservice.count(vo); 
		int totPage = totCount/10;  
		if (totCount % 10 > 0) totPage++; 
		
		int statIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(statIdx);
		
		List <NoticeVo> list = noticeservice.selectAll(vo); 
		model.addAttribute("list", list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getPageAreaAdmin("index.do", vo.getPage(), totPage, 10));		
		return "/admin/board/notice/index";  
	}
	
	// Notice 관리 페이지 
	@GetMapping("/center/notice/index.do") 
	public String indexUser(Model model, HttpServletRequest req , NoticeVo vo) {
		vo.setMode(1);
		int totCount = noticeservice.count(vo); 
		int totPage = totCount/10;  
		if (totCount % 10 > 0) totPage++; 
		
		int statIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(statIdx);
		
		List <NoticeVo> list = noticeservice.selectAll(vo); 
		model.addAttribute("list", list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));		
		return "/center/notice/index";  
	}
	
	@RequestMapping("/admin/board/notice/write.do")
	public String write() {
		return "/admin/board/notice/write";
	}
	
	@PostMapping("/admin/board/notice/insert.do")
	public String insert(NoticeVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		System.out.println("title:"+vo.getTitle());
		System.out.println("content:"+vo.getContent());
		//파일저장 
		if (file != null && !file.isEmpty()) { // 사용자가 파일을 첨부했다면 
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename(); // 사용자가 업로드한 원본 파일
				String ext = filename.substring(filename.lastIndexOf(".")); // 확장자 (.jpg)
				String filename_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+filename_real)); // 경로에 파일을 저장 
				vo.setFilename_org(filename);
				vo.setFilename_real(filename_real);
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = noticeservice.insert(vo);
		System.out.println("r : "+r);
		
		// 정상적으로 등록되었습니다. alert 띄우고 
		// index.do 로 이동 
		if(r > 0) {
		req.setAttribute("msg", "정상적으로 등록되었습니다");
		req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "등록 오류 ");
			req.setAttribute("url", "write.do");
		}
		
		return "include/return";
		}

	@GetMapping("/admin/board/notice/view.do") //상세 
	public String view(Model model, @RequestParam int noticeno, HttpServletRequest request) {
		model.addAttribute("data", noticeservice.view(noticeno));
		return "/admin/board/notice/view";
	}
	
	@GetMapping("/center/notice/view.do") 
	public String viewUser(Model model, @RequestParam int noticeno, HttpServletRequest request) {
		model.addAttribute("data", noticeservice.view(noticeno));
		return "/center/notice/view";
	}
	
	@GetMapping("/admin/board/notice/delete.do")
	public String delete(Model model, NoticeVo vo) {
		int r = noticeservice.delete(vo); 
		if(r > 0) {
			model.addAttribute("msg","정상적으로 삭제되었습니다.");
			model.addAttribute("url","index.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","삭제 오류");
			model.addAttribute("url","view.do?noticeno="+vo.getNo()); //실패했을때 상세페이지 이동 
		}
		return "include/return";
	}
	
	@PostMapping("/admin/board/notice/deleteAll.do")
	public String deleteAll(Model model, HttpServletRequest req) {
		String[] check = req.getParameterValues("check");
		
		for (int i=0; i<check.length; i++) {
			NoticeVo vo = new NoticeVo();
			vo.setNo(Integer.parseInt(check[i]));
			noticeservice.delete(vo);
		}
		model.addAttribute("msg","정상적으로 삭제되었습니다.");
		model.addAttribute("url","index.do");
		return "include/return";
	}	
	
	@GetMapping("/admin/board/notice/edit.do")
	public String edit(Model model, @RequestParam int noticeno) {
		model.addAttribute("data", noticeservice.edit(noticeno));
		return "/admin/board/notice/edit";
	}
	
	@PostMapping("/admin/board/notice/update.do")
	public String update(Model model, NoticeVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		// 사용자가 체크박스를 체크했는지 여부 
		//if (req.getParameter("delCheck")!= null) {
		if ("1".equals(req.getParameter("delCheck"))) {	
			NoticeVo nv = noticeservice.edit(vo.getNo());
			File f = new File(req.getRealPath("/upload/")+nv.getFilename_real());
			f.delete();
			vo.setFilename_org("");
			vo.setFilename_real("");
		}
		if (file !=null && !file.isEmpty()) { // 사용자가 파일을 첨부했다면 
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename(); // 사용자가 업로드한 원본 파일
				String ext = filename.substring(filename.lastIndexOf(".")); // 확장자 (.jpg)
				String filename_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+filename_real)); // 경로에 파일을 저장 
				vo.setFilename_org(filename);
				vo.setFilename_real(filename_real);
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = noticeservice.update(vo);
		if(r > 0) {
			model.addAttribute("msg","정상적으로 수정되었습니다.");
			model.addAttribute("url","view.do?noticeno="+vo.getNo()); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","수정오류");
			model.addAttribute("url","edit.do?noticeno="+vo.getNo()); //실패했을때 수정페이지 이동 
		}
		return "include/return";
	}

}
