package bookmall.recentOrder;

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
public class RecentOrderController {
	
	@Autowired
	RecentOrderService recentOrderService;
	
	@GetMapping("/user/recentorder.do") // 매핑된경로 
	public String index(Model model, RecentOrderVo vo, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		vo.setPageRow(3);
		
		System.out.println("세션no:"+vo.getUserno());
		model.addAttribute("recentOrderInfo", recentOrderService.listSelect(vo));
		return "/user/recentorder"; // 리턴되는 jsp경로   
	}
	
	@PostMapping("/recentorder/deleteAjax.do")
	public String deleteAjax(Model model, HttpServletRequest req) {
		String[] rorderno = req.getParameterValues("rorderno"); // 배열로 전송된 listno
		
		int cnt = 0;
		for (int i=0; i<rorderno.length; i++) {
			cnt += recentOrderService.delete(Integer.parseInt(rorderno[i])); // 배열의 개수만큼 반복하면서 삭제
		}
		// 반복이 끝나면 cnt변수에는 삭제된 개수가 담김
		model.addAttribute("result", cnt);
		return "include/result";
	}
}
