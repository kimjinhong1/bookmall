package bookmall.book.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import bookmall.util.CommonUtil;


@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewservice;
	
	@RequestMapping("/center/review/insert.do")
	public String insert(Model model, ReviewVo vo) { 
		model.addAttribute("result",reviewservice.insert(vo)); 
		return "include/result";
	}
	
	@GetMapping("/center/review/list.do")
	public String list(Model model, ReviewVo vo) { 
		int totCount = reviewservice.count(vo); 
		int totPage = totCount/10;  
		if (totCount % 10 > 0) totPage++; 
		
		int statIdx = (vo.getPage()-1)*vo.getNumchoose();
		vo.setStartIdx(statIdx);
		
		List <ReviewVo> list = reviewservice.selectList(vo); 
		model.addAttribute("list", list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getPageAreaReview(vo.getBookno(), vo.getPage(), totPage, 10));
		return "include/reviewList"; 
	}
	
	@GetMapping("/admin/review/list.do")
	public String index(Model model, ReviewVo vo) {
		int totCount = reviewservice.countAdmin(vo); 
		int totPage = totCount/10;  
		if (totCount % 10 > 0) totPage++; 
		
		int statIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(statIdx);
		
		List <ReviewVo> list = reviewservice.selectListAdmin(vo); 
		model.addAttribute("list", list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getPageAreaAdmin("list.do", vo.getPage(), totPage, 10));
		return "/admin/include/reviewList"; 
	}
	
	@GetMapping("/center/review/delete.do")
	public String delete(Model model, ReviewVo vo) { 
		model.addAttribute("result", reviewservice.delete(vo)); 
		return "include/result";
	}
	
	@GetMapping("/admin/review/delete.do")
	public String deleteAdmin(Model model, ReviewVo vo) { 
		model.addAttribute("result", reviewservice.delete(vo)); 
		return "include/result";
	}
	
	@PostMapping("/admin/review/deleteAll.do")
	public String deleteAll(Model model, HttpServletRequest req) {
		String[] check = req.getParameterValues("check");
		  
		for (int i=0; i<check.length; i++) {
			ReviewVo vo = new ReviewVo();
			vo.setNo(Integer.parseInt(check[i]));
			reviewservice.delete(vo);
		}
		model.addAttribute("msg","정상적으로 삭제되었습니다.");
		model.addAttribute("url","list.do");
		return "include/return";
	}	
	
	@PostMapping("/center/review/update.do")
	public String update(Model model, ReviewVo vo) {
		model.addAttribute("result", reviewservice.update(vo)); 
		return "include/result";
	}
	@PostMapping("/admin/review/update.do")
	public String updateAdmin(Model model, ReviewVo vo) {
		model.addAttribute("result", reviewservice.update(vo));
		return "include/result";
	}
	
	@RequestMapping("/center/review/score.do")
	public String score(Model model, ReviewVo vo) { 
		model.addAttribute("result",reviewservice.score(vo)); 
		return "include/result";
	}
}
