package bookmall.board.suda;

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

import bookmall.user.UserVo;
import bookmall.util.CommonUtil;


@Controller
public class SudaController {
	
	@Autowired
	SudaService sudaservice;
	
	@GetMapping("/admin/board/suda/index.do") // 매핑된경로 
	public String index(Model model, SudaVo vo) {
		int totCount = sudaservice.count(vo); 
		int totPage = totCount/10;  
		if (totCount % 10 > 0) totPage++; 
		
		int statIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(statIdx);
		
		List <SudaVo> list = sudaservice.selectAll(vo); 
		model.addAttribute("list", list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getPageAreaAdmin("index.do", vo.getPage(), totPage, 10));
		return "/admin/board/suda/index"; // 리턴되는 jsp경로 
	}  
	
	@GetMapping("/center/suda/index.do") // 매핑된경로 
	public String indexUser(Model model, SudaVo vo) {
		vo.setMode(1);
		int totCount = sudaservice.count(vo); 
		int totPage = totCount/10;  
		if (totCount % 10 > 0) totPage++; 
		
		int statIdx = (vo.getPage()-1)*vo.getNumchoose();
		vo.setStartIdx(statIdx);
		
		List <SudaVo> list = sudaservice.selectAll(vo); 
		model.addAttribute("list", list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));
		return "/center/suda/index"; // 리턴되는 jsp경로   
	}  
	
	@GetMapping("/admin/board/suda/view.do") //상세 
	public String view(Model model, @RequestParam int sudano, HttpServletRequest request) {
		model.addAttribute("data", sudaservice.view(sudano));
		return "/admin/board/suda/view";
	}
	
	@GetMapping("/center/suda/view.do") //상세 
	public String viewUser(Model model, @RequestParam int sudano, HttpServletRequest request) {
		model.addAttribute("data", sudaservice.view(sudano));
		return "/center/suda/view";
	}
	
	@RequestMapping("/admin/board/suda/write.do")
	public String write() {
		return "/admin/board/suda/write";
	}
	
	@RequestMapping("/center/suda/write.do")
	public String writeUser() {
		return "/center/suda/write";
	}
	
	@PostMapping("/admin/board/suda/insert.do")
	public String insert(SudaVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
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
		int r = sudaservice.insert(vo);
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
	
	// login only
	@PostMapping("/center/suda/insert.do")
	public String insertUser(SudaVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		int userno = ((UserVo)sess.getAttribute("userInfo")).getUserno(); // session -> userno
		// vo set
		vo.setUserno(userno);
		
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
		int r = sudaservice.insert(vo);
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
	
	@GetMapping("/admin/board/suda/delete.do")
	public String delete(Model model, SudaVo vo) {
		int r = sudaservice.delete(vo); 
		if(r > 0) {
			model.addAttribute("msg","정상적으로 삭제되었습니다.");
			model.addAttribute("url","index.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","삭제 오류");
			model.addAttribute("url","view.do?sudano="+vo.getNo()); //실패했을때 상세페이지 이동 
		}
		return "include/return";
	}
	
	@GetMapping("/center/suda/delete.do")
	public String deleteUser(Model model, SudaVo vo) {
		int r = sudaservice.delete(vo); 
		if(r > 0) {
			model.addAttribute("msg","정상적으로 삭제되었습니다.");
			model.addAttribute("url","index.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","삭제 오류");
			model.addAttribute("url","view.do?sudano="+vo.getNo()); //실패했을때 상세페이지 이동 
		}
		return "include/return";
	}
	
	@PostMapping("/admin/board/suda/deleteAll.do")
	public String deleteAll(Model model, HttpServletRequest req) {
		String[] check = req.getParameterValues("check");
		
		for (int i=0; i<check.length; i++) {
			SudaVo vo = new SudaVo();
			vo.setNo(Integer.parseInt(check[i]));
			sudaservice.delete(vo);
		}
		model.addAttribute("msg","정상적으로 삭제되었습니다.");
		model.addAttribute("url","index.do");
		return "include/return";
	}	
	
	@GetMapping("/admin/board/suda/edit.do")
	public String edit(Model model, @RequestParam int sudano) {
		model.addAttribute("data", sudaservice.edit(sudano));
		return "/admin/board/suda/edit";
	}
	
	@GetMapping("/center/suda/edit.do")
	public String editUser(Model model, @RequestParam int sudano) {
		model.addAttribute("data", sudaservice.edit(sudano));
		return "/center/suda/edit";
	}
	
	@PostMapping("/admin/board/suda/update.do")
	public String update(Model model, SudaVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		// 사용자가 체크박스를 체크했는지 여부 
		//if (req.getParameter("delCheck")!= null) {
		if ("1".equals(req.getParameter("delCheck"))) {	
			SudaVo nv = sudaservice.edit(vo.getNo());
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
		int r = sudaservice.update(vo);
		if(r > 0) {
			model.addAttribute("msg","정상적으로 수정되었습니다.");
			model.addAttribute("url","view.do?sudano="+vo.getNo()); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","수정오류");
			model.addAttribute("url","edit.do?sudano="+vo.getNo()); //실패했을때 수정페이지 이동 
		}
		return "include/return";
	}
	
	@PostMapping("/center/suda/update.do")
	public String updateUser(Model model, SudaVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		// 사용자가 체크박스를 체크했는지 여부 
		//if (req.getParameter("delCheck")!= null) {
		if ("1".equals(req.getParameter("delCheck"))) {	
			SudaVo nv = sudaservice.edit(vo.getNo());
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
		int r = sudaservice.update(vo);
		if(r > 0) {
			model.addAttribute("msg","정상적으로 수정되었습니다.");
			model.addAttribute("url","view.do?sudano="+vo.getNo()); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","수정오류");
			model.addAttribute("url","edit.do?sudano="+vo.getNo()); //실패했을때 수정페이지 이동 
		}
		return "include/return";
	}
	
	@GetMapping("/center/suda/reply.do")
	public String reply(Model model, @RequestParam int sudano) {
		model.addAttribute("data", sudaservice.edit(sudano));
		return "center/suda/reply";
	}
	
	@PostMapping("/center/suda/insertReply.do")
	public String insertReply(SudaVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		int userno = ((UserVo)sess.getAttribute("userInfo")).getUserno(); // session -> userno
		// vo set
		vo.setUserno(userno);
		int r = sudaservice.reply(vo);
		System.out.println("r : "+r);
		
		// 정상적으로 등록되었습니다. alert 띄우고 
		// index.do 로 이동 
		if(r > 0) {
		req.setAttribute("msg", "정상적으로 답변이 등록되었습니다");
		req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "답변 오류 ");
			req.setAttribute("url", "reply.do?sudano="+vo.getNo());
		}
		
		return "include/return";
		}
}
