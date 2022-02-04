package bookmall.admin.orders;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import bookmall.ask.AskVo;
import bookmall.user.UserVo;
import bookmall.util.CommonUtil;

@Controller
public class OrdersAdminController {
	
	@Autowired
	OrdersAdminService ordersService;

	@RequestMapping("/admin/orders/index.do")
	public String ordersAdmin(OrdersAdminVo vo, Model model, HttpServletRequest req) {
//		model.addAttribute("totSelect", ordersService.totSelect(vo));
		int totCount = ordersService.count(vo); 
		int totPage = totCount/vo.getNumchoose();  
		if (totCount % vo.getNumchoose() > 0) totPage++; 
		
//		System.out.println(vo.getNumchoose());
		int statIdx = (vo.getPage()-1)*vo.getNumchoose();
		vo.setStartIdx(statIdx);
		
		List<OrdersAdminVo> orderlist = ordersService.totSelect(vo); 
		model.addAttribute("list", orderlist);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount", totCount);  
		model.addAttribute("pageArea", CommonUtil.getPageAreaAdmin("index.do", vo.getPage(), totPage, vo.getNumchoose()));
		
		return "admin/orders/index"; 
	}
	
	@RequestMapping("/admin/orders/update.do")
	public String updateAdmin(Model model, OrdersAdminVo vo, HttpServletRequest req) {
		int r = ordersService.update(vo);
		if(r > 0) {
			model.addAttribute("msg","정상적으로 수정되었습니다.");
			model.addAttribute("url","index.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","수정오류");
			model.addAttribute("url","index.do"); //실패했을때 수정페이지 이동 
		}
		return "include/return";
	}
}
