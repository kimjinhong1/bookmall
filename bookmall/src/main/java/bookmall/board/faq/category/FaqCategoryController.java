package bookmall.board.faq.category;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class FaqCategoryController {

	@Autowired
	FaqCategoryService faqcategoryservice;
	
	@GetMapping("/admin/board/faq/category/index.do")  
	public String index(Model model, HttpServletRequest req , FaqCategoryVo vo) {
		List <FaqCategoryVo> list = faqcategoryservice.selectAll(vo); 
		model.addAttribute("list", list);	
		return "/admin/board/faq/category/index";  
	}
	
	@PostMapping("/admin/board/faq/category/insert.do")
	public String insert(FaqCategoryVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		int r = faqcategoryservice.insert(vo);
		if(r > 0) {
		req.setAttribute("msg", "정상적으로 등록되었습니다");
		req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "등록 오류 ");
			req.setAttribute("url", "index.do");
		}
		
		return "include/return";
		}
	
	@PostMapping("/admin/board/faq/category/update.do")
	public String update(Model model, FaqCategoryVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		int r = faqcategoryservice.update(vo);
		if(r > 0) {
			model.addAttribute("msg","정상적으로 수정되었습니다.");
			model.addAttribute("url","index.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","수정오류");
			model.addAttribute("url","index.do"); //실패했을때 수정페이지 이동 
		}
		return "include/return";
	} 
	
	@GetMapping("/admin/board/faq/category/delete.do")
	public String delete(Model model, FaqCategoryVo vo) {
		int r = faqcategoryservice.delete(vo); 
		if(r > 0) {
			model.addAttribute("msg","정상적으로 삭제되었습니다.");
			model.addAttribute("url","index.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","삭제 오류");
			model.addAttribute("url","index.do"); //실패했을때 상세페이지 이동 
		}
		return "include/return";
	}
}
