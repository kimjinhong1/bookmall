package bookmall.admin.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bookmall.user.UserVo;
import bookmall.util.CommonUtil;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping("/admin/member/index.do")
	public String memberIndex(Model model,HttpServletRequest req, UserVo vo) {
		int totCount = service.count(vo); // 총개수
		int totPage = totCount / 10; //총페이지수
		if (totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1) * 10; //시작 인덱스값 구함, 10개씩나오게 할거니깐 1페이지면 0부터 9, 2페이지면 10~19
		vo.setStartIdx(startIdx);
		
		List<UserVo> memberlist = service.member(vo);
		model.addAttribute("list", memberlist);
		model.addAttribute("totPage", totPage);	 //모델에 totpage라는 이름으로 값 등록, index.jsp에서${} 쓰기위함!
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));
		return "admin/member/index"; 
	}

}
