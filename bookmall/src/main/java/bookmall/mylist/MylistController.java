package bookmall.mylist;

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
public class MylistController {
	
	@Autowired
	MylistService mylistService;
	
	@GetMapping("/mylist/mylist.do") // 매핑된경로 
	public String index(Model model, MylistVo vo) {
		model.addAttribute("dibsList", mylistService.listSelect(vo));
		return "/user/mylist"; // 리턴되는 jsp경로   
	}
	
	// 저장
	@PostMapping("/mylist/insert.do")
	public String insert(MylistVo vo, HttpServletRequest req, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		int r = mylistService.insert(vo);
		if(r > 0) {
		req.setAttribute("msg", "정상적으로 등록되었습니다");
		req.setAttribute("url", "mylist.do");
		} else {
			req.setAttribute("msg", "등록 오류 ");
			req.setAttribute("url", "");
		}
		
		return "include/return";
		}

	@PostMapping("/mylist/deleteAjax.do")
	public String deleteAjax(Model model, HttpServletRequest req) {
		String[] listno = req.getParameterValues("listno"); // 배열로 전송된 listno
		
		int cnt = 0;
		for (int i=0; i<listno.length; i++) {
			cnt += mylistService.delete(Integer.parseInt(listno[i])); // 배열의 개수만큼 반복하면서 삭제
		}
		// 반복이 끝나면 cnt변수에는 삭제된 개수가 담김
		model.addAttribute("result", cnt);
		return "include/result";
	}
}
