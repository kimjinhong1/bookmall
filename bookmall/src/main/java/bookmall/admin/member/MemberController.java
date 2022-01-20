package bookmall.admin.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bookmall.user.UserVo;
import bookmall.util.CommonUtil;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	// 회원관리 목록 페이지
	@RequestMapping("/admin/member/index.do")
	public String memberIndex(Model model,HttpServletRequest req, UserVo vo) {
		// 총 회원 수
		int totCount = service.count(vo); 
		// 총 페이지 수
		int totPage = totCount / 10; // ex) 31개면 3페이지
		if (totCount % 10 > 0) totPage++; //나눠서 나머지 있으면 1페이지 추가
		//시작 인덱스 값 구하기, 10개씩 나오게, 1페이지 0~9, 2페이지 10~19
		int startIdx = (vo.getPage()-1) * 10; //초기값 1이므로 0
		vo.setStartIdx(startIdx);
		
		List<UserVo> memberlist = service.member(vo);
		model.addAttribute("list", memberlist);
		model.addAttribute("totPage", totPage);	
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getPageAreaMember("index.do", vo.getPage(), totPage, 10, vo));
		return "admin/member/index"; 
	}
	
	// 회원관리 상세 페이지
	@GetMapping("/admin/member/detail.do")
	public String memberDetail(Model model, UserVo vo) {
		int totCount = service.countOrder(vo); 
		int totPage = totCount / 10; 
		if (totCount % 10 > 0) totPage++; 
		int startIdx = (vo.getPage()-1) * 10;
		vo.setStartIdx(startIdx);
		
		UserVo dvo = service.detailMember(vo);
		//int buy_price = service.member_buy_price(vo);
		//int buy_count = service.member_buy_count(vo);
		List<UserVo> memberBuy = service.memberBuyRecode(vo);
		//model.addAttribute("buy_price", buy_price);
		//model.addAttribute("buy_count", buy_count);
		model.addAttribute("member", dvo);
		model.addAttribute("memberBuy", memberBuy);
		model.addAttribute("totPage", totPage);	 
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getMemberBuyPageArea("detail.do?userno="+vo.getUserno(), vo.getPage(), totPage, 10));
		return "admin/member/detail";
	}
	
	// 회원관리 수정 페이지
	@GetMapping("/admin/member/edit.do")
	public String memberEdit(Model model, UserVo vo) {
		return "admin/member/edit";
	}
	
	// 회원관리 수정 업데이트
	@GetMapping("/admin/member/update.do")
	public String memberUpdate(Model model, UserVo vo) {
		model.addAttribute("result", service.memberUpdate(vo));
		return "include/result";
	}
	

}
