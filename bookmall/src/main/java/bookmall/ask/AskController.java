package bookmall.ask;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bookmall.addr.AddrVo;
import bookmall.board.suda.SudaVo;
import bookmall.cart.CartDto;
import bookmall.user.UserVo;
import bookmall.util.CommonUtil;

@Controller
public class AskController {
	
	@Autowired
	AskService askService;
	
	@GetMapping("/ask/askindex.do") // 매핑된경로 
	public String indexUser(Model model, AskVo vo) {
		model.addAttribute("askList", askService.askList(vo));
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);
		return "/ask/askindex"; // 리턴되는 jsp경로   
	}
	
	@GetMapping("/admin/board/ask/index.do") // 매핑된경로 
	public String indexAdmin(Model model, AskVo vo) {
		model.addAttribute("askList", askService.askList(vo));
		return "/admin/board/ask/index"; // 리턴되는 jsp경로   
	}
	
	@RequestMapping("/ask/askwrite.do")
	public String write() {
		return "ask/askwrite";
	}
	
	@RequestMapping("/admin/board/ask/write.do")
	public String writeAdmin() {
		return "/admin/board/ask/write";
	}
	
	// 문의사항 저장
	@PostMapping("/ask/askinsert.do")
	public String insert(AskVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		//파일저장 
		if (!file.isEmpty()) { // 사용자가 파일을 첨부했다면 
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
		int r = askService.insert(vo);
		
		// 정상적으로 등록되었습니다. alert 띄우고 
		// index.do 로 이동 
		if(r > 0) {
		req.setAttribute("msg", "정상적으로 등록되었습니다");
		req.setAttribute("url", "askindex.do");
		} else {
			req.setAttribute("msg", "등록 오류 ");
			req.setAttribute("url", "askwrite.do");
		}
		
		return "include/return";
		}
	@PostMapping("/admin/board/ask/insert.do")
	public String insertAdmin(AskVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("adminInfo")).getUserno());
		if (!file.isEmpty()) { // 사용자가 파일을 첨부했다면 
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
		int r = askService.insert(vo);
		
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

	@GetMapping("/ask/askview.do") //상세 
	public String viewUser(Model model, @RequestParam int askno, HttpServletRequest request) {
		model.addAttribute("askuser", askService.view(askno));
		return "/ask/askview";
	}
	@GetMapping("/admin/board/ask/view.do") //상세 
	public String viewAdmin(Model model, @RequestParam int askno, HttpServletRequest request) {
		model.addAttribute("askdata", askService.view(askno));
		return "/admin/board/ask/view";
	}
	
	@GetMapping("/ask/askedit.do")
	public String edit(Model model, @RequestParam int askno) {
		model.addAttribute("askuser", askService.view(askno));
		return "ask/askedit";
	}
	@GetMapping("/admin/board/ask/edit.do")
	public String editAdmin(Model model, @RequestParam int askno) {
		model.addAttribute("askdata", askService.view(askno));
		return "/admin/board/ask/edit";
	}
	
	//사용자페이지 뷰에서 삭제 
	@GetMapping("/ask/askdelete.do")
	public String deleteuser(Model model, int askno) {
		int r = askService.delete(askno); 
		if(r > 0) {
			model.addAttribute("msg","정상적으로 삭제되었습니다.");
			model.addAttribute("url","askindex.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","삭제 오류");
			model.addAttribute("url","askview.do?askno="+askno); //실패했을때 상세페이지 이동 
		}
		return "include/return";
	}
	
	//관리자페이지 뷰에서 삭제 
	@GetMapping("/admin/board/ask/askdelete.do")
	public String delete(Model model, int askno) {
		int r = askService.delete(askno); 
		if(r > 0) {
			model.addAttribute("msg","정상적으로 삭제되었습니다.");
			model.addAttribute("url","index.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","삭제 오류");
			model.addAttribute("url","view.do?askno="+askno); //실패했을때 상세페이지 이동 
		}
		return "include/return";
	}
	
	//관리자, 사용자 index에서 선택 삭제 
	@PostMapping("/ask/deleteAjax.do")
	public String deleteAjax(Model model, HttpServletRequest req) {
		String[] askno = req.getParameterValues("askno"); // 배열로 전송된 askno
		
		int cnt = 0;
		for (int i=0; i<askno.length; i++) {
			cnt += askService.delete(Integer.parseInt(askno[i])); // 배열의 개수만큼 반복하면서 삭제
		}
		// 반복이 끝나면 cnt변수에는 삭제된 개수가 담김
		model.addAttribute("result", cnt);
		return "include/result";
	}
	
	@GetMapping("/ask/askreply.do")
	public String reply(Model model, @RequestParam int askno) {
		model.addAttribute("data", askService.edit(askno));
		return "ask/askreply";
	}
	
	@PostMapping("/admin/board/ask/insertReply.do")
	public String insertReply(AskVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		int userno = ((UserVo)sess.getAttribute("userInfo")).getUserno(); // session -> userno
		// vo set
		vo.setUserno(userno);
		int r = askService.reply(vo);
		System.out.println("r : "+r);
		
		// 정상적으로 등록되었습니다. alert 띄우고 
		// index.do 로 이동 
		if(r > 0) {
		req.setAttribute("msg", "정상적으로 답변이 등록되었습니다");
		req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "답변 오류 ");
			req.setAttribute("url", "edit.do?askno="+vo.getAskno());
		}
		
		return "include/return";
		}
	
	@PostMapping("/ask/update.do")
	public String updateUser(Model model, AskVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		// 사용자가 체크박스를 체크했는지 여부 
		//if (req.getParameter("delCheck")!= null) {
		if ("1".equals(req.getParameter("delCheck"))) {	
			AskVo avo = askService.edit(vo.getAskno());
			File f = new File(req.getRealPath("/upload/")+avo.getFilename_real());
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
		int r = askService.update(vo);
		if(r > 0) {
			model.addAttribute("msg","정상적으로 수정되었습니다.");
			model.addAttribute("url","askview.do?askno="+vo.getAskno()); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","수정오류");
			model.addAttribute("url","askedit.do?askno="+vo.getAskno()); //실패했을때 수정페이지 이동 
		}
		return "include/return";
	}
	
	@PostMapping("/admin/board/ask/update.do")
	public String updateAdmin(Model model, AskVo vo, HttpServletRequest req,  HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		int r = askService.update(vo);
		if(r > 0) {
			model.addAttribute("msg","정상적으로 수정되었습니다.");
			model.addAttribute("url","view.do?askno="+vo.getAskno()); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","수정오류");
			model.addAttribute("url","edit.do?askno="+vo.getAskno()); //실패했을때 수정페이지 이동 
		}
		return "include/return";
	}
	

}
