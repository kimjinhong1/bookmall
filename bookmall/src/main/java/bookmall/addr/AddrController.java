package bookmall.addr;

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

import bookmall.board.suda.SudaVo;
import bookmall.cart.CartDto;
import bookmall.user.UserVo;
import bookmall.util.CommonUtil;

@Controller
public class AddrController {
	
	@Autowired
	AddrService addListService;
	
	@GetMapping("/addr/addressList.do") // 매핑된경로 
	public String index(Model model, AddrVo vo, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		model.addAttribute("addBook", addListService.listSelect(vo));
		return "/addr/addressList"; // 리턴되는 jsp경로   
	}
	@GetMapping("/addr/addpop.do") // 매핑된경로 
	public String indexpop(Model model, AddrVo vo) {
		model.addAttribute("addBook", addListService.listSelect(vo));
		return "/addr/addpop"; // 리턴되는 jsp경로   
	}
	
	// 저장
	@PostMapping("/addr/insert.do")
	public String insert(AddrVo vo, HttpServletRequest req, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		int r = addListService.insert(vo);
		if(r > 0) {
		req.setAttribute("msg", "정상적으로 등록되었습니다");
		req.setAttribute("url", "addressList.do");
		} else {
			req.setAttribute("msg", "등록 오류 ");
			req.setAttribute("url", "");
		}
		
		return "include/return";
		}

	@RequestMapping("/addr/write.do")
	public String write() {
		return "addr/write";
	}
	
	@GetMapping("/addr/view.do")
	public String view(Model model, @RequestParam int addno) {
		model.addAttribute("addBook", addListService.view (addno));
		return "addr/view";
	}
	
	@PostMapping("/addr/deleteAjax.do")
	public String deleteAjax(Model model, HttpServletRequest req) {
		String[] addno = req.getParameterValues("addno"); // 배열로 전송된 listno
		
		int cnt = 0;
		for (int i=0; i<addno.length; i++) {
			cnt += addListService.delete(Integer.parseInt(addno[i])); // 배열의 개수만큼 반복하면서 삭제
		}
		// 반복이 끝나면 cnt변수에는 삭제된 개수가 담김
		model.addAttribute("result", cnt);
		return "include/result";
	}
	
	@PostMapping("/addr/update.do")
	public String update(AddrVo vo, HttpServletRequest req, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		int r = addListService.update(vo);
		if(r > 0) {
		req.setAttribute("msg", "정상적으로 수정되었습니다");
		req.setAttribute("url", "close");
		} else {
			req.setAttribute("msg", "등록 오류 ");
			req.setAttribute("url", "");
		}
		
		return "include/return";
		}
}
