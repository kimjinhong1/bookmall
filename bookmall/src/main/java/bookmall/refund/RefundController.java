package bookmall.refund;

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
public class RefundController {
	
	@Autowired
	RefundService refundService;
	
	//문의내역 사용자페이지
	@GetMapping("/refund/exchange.do") // 매핑된경로 
	public String indexUser(Model model, RefundVo vo, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		vo.setPageRow(10);
		
		int totCount = refundService.count(vo); 
		int totPage = totCount/vo.getPageRow();  
		if (totCount % vo.getPageRow() > 0) totPage++; 
		
		int statIdx = (vo.getPage()-1)*vo.getPageRow();
		vo.setStartIdx(statIdx);
		
		model.addAttribute("refundList", refundService.refundList(vo));
		return "/refund/exchange"; // 리턴되는 jsp경로   
	}
	
	//문의내역 사용자페이지
	@GetMapping("/refund/refund.do") // 매핑된경로 
	public String indexUser2(Model model, RefundVo vo, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		vo.setPageRow(10);
		
		int totCount = refundService.count(vo); 
		int totPage = totCount/vo.getPageRow();  
		if (totCount % vo.getPageRow() > 0) totPage++; 
		
		int statIdx = (vo.getPage()-1)*vo.getPageRow();
		vo.setStartIdx(statIdx);
		
		model.addAttribute("refundList", refundService.refundList(vo));
		return "/refund/refund"; // 리턴되는 jsp경로   
	}
	
	//문의내역 사용자페이지
	@GetMapping("/refund/index.do") // 매핑된경로 
	public String index(Model model, RefundVo vo, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		vo.setPageRow(10);
		
		int totCount = refundService.count(vo);
		int totPage = totCount/vo.getPageRow();  
		if (totCount % vo.getPageRow() > 0) totPage++; 
		
		int statIdx = (vo.getPage()-1)*vo.getPageRow();
		vo.setStartIdx(statIdx);
		
		model.addAttribute("refundList", refundService.refundList(vo));
		return "/refund/index"; // 리턴되는 jsp경로   
	}
	
	//문의내역 관리자페이지
	@GetMapping("/admin/board/refund/index.do") // 매핑된경로 
	public String index(Model model, RefundVo vo) {
		vo.setPageRow(10);
		int totCount = refundService.count(vo); 
		int totPage = totCount/vo.getPageRow();  
		if (totCount % vo.getPageRow() > 0) totPage++; 
		
		int statIdx = (vo.getPage()-1)*vo.getPageRow();
		vo.setStartIdx(statIdx);
		
		model.addAttribute("refundList", refundService.refundList(vo));
		return "/admin/board/refund/index"; // 리턴되는 jsp경로   
	}
	

	// 문의사항 저장
	@PostMapping("/refund/insert.do")
	public String insert(RefundVo vo, HttpServletRequest req, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		
		int r = refundService.insert(vo);
		
		// 정상적으로 등록되었습니다. alert 띄우고 
		// index.do 로 이동 
		if(r > 0) {
		req.setAttribute("msg", "취소/환불 신청이 완료 되었습니다");
		req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "등록 오류 ");
			req.setAttribute("url", "refund.do");
		}
		
		return "include/return";
		}
	// 문의사항 저장
	@PostMapping("/refund/insertEx.do")
	public String insertEx(RefundVo vo, HttpServletRequest req, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		
		int r = refundService.insert(vo);
		
		// 정상적으로 등록되었습니다. alert 띄우고 
		// index.do 로 이동 
		if(r > 0) {
			req.setAttribute("msg", "반품/교환 신청이 완료 되었습니다");
			req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "등록 오류 ");
			req.setAttribute("url", "exchange.do");
		}
		
		return "include/return";
	}

	@GetMapping("/admin/board/refund/view.do") //상세 
	public String view(Model model, @RequestParam int refundno, HttpServletRequest request) {
		model.addAttribute("refundData", refundService.view(refundno));
		return "/admin/board/refund/view";
	}

}
