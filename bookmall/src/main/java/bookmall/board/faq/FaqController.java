package bookmall.board.faq;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import bookmall.board.faq.category.FaqCategoryService;
import bookmall.board.faq.category.FaqCategoryVo;
import bookmall.util.CommonUtil;

@Controller
public class FaqController {

	@Autowired
	FaqService faqservice;
	
	@Autowired
	FaqCategoryService faqcategoryservice;
	
	@GetMapping("/admin/board/faq/index.do")  
	public String index(Model model, HttpServletRequest req , FaqVo vo) {
		List <FaqCategoryVo> clist = faqcategoryservice.selectAll(new FaqCategoryVo()); 
		model.addAttribute("clist", clist);
		
		int totCount = faqservice.count(vo);
		int totPage = totCount/10;
		if (totCount % 10 > 0) totPage++;
		
		int statIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(statIdx);
		
		List <FaqVo> list = faqservice.selectAll(vo); 
		model.addAttribute("list", list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getPageAreaAdmin("index.do", vo.getPage(), totPage, 10));		
		return "/admin/board/faq/index";  
	}
	
	@GetMapping("/center/faq/index.do")  
	public String indexUser(Model model, HttpServletRequest req , FaqVo vo) {
		vo.setMode(1);
		List <FaqCategoryVo> clist = faqcategoryservice.selectAll(new FaqCategoryVo()); 
		model.addAttribute("clist", clist);
		
		int totCount = faqservice.count(vo);
		int totPage = totCount/10;
		if (totCount % 10 > 0) totPage++;
		
		int statIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(statIdx);
		
		List <FaqVo> list = faqservice.selectAll(vo); 
		model.addAttribute("list", list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));		
		return "/center/faq/index";  
	}
	
	@RequestMapping("/admin/board/faq/write.do")
	public String write(Model model, FaqCategoryVo vo) {
		List <FaqCategoryVo> list = faqcategoryservice.selectAll(vo); 
		model.addAttribute("list", list);	
		return "/admin/board/faq/write";
	}
	
	@PostMapping("/admin/board/faq/insert.do")
	public String insert(FaqVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		System.out.println("title:"+vo.getTitle());
		System.out.println("content:"+vo.getContent());
		int r = faqservice.insert(vo);
		System.out.println("r : "+r);
		
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
	
	@GetMapping("/admin/board/faq/view.do") //상세 
	public String view(Model model, @RequestParam int faqno, HttpServletRequest request,FaqCategoryVo vo) {
		model.addAttribute("data", faqservice.view(faqno));
		List <FaqCategoryVo> list = faqcategoryservice.selectAll(vo); 
		model.addAttribute("list", list);
		return "/admin/board/faq/view";
	}
	
	@GetMapping("/center/faq/view.do") //상세 
	public String viewUser(Model model, @RequestParam int faqno, HttpServletRequest request,FaqCategoryVo vo) {
		model.addAttribute("data", faqservice.view(faqno));
		List <FaqCategoryVo> list = faqcategoryservice.selectAll(vo); 
		model.addAttribute("list", list);
		return "/center/faq/view";
	}
	
	@GetMapping("/admin/board/faq/edit.do")
	public String edit(Model model, @RequestParam int faqno, FaqCategoryVo vo) {
		model.addAttribute("data", faqservice.edit(faqno));
		List <FaqCategoryVo> list = faqcategoryservice.selectAll(vo); 
		model.addAttribute("list", list);
		return "/admin/board/faq/edit";
	}
	
	@PostMapping("/admin/board/faq/update.do")
	public String update(Model model, FaqVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		int r = faqservice.update(vo);
		if(r > 0) {
			model.addAttribute("msg","정상적으로 수정되었습니다.");
			model.addAttribute("url","view.do?faqno="+vo.getNo()); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","수정오류");
			model.addAttribute("url","edit.do?faqno="+vo.getNo()); //실패했을때 수정페이지 이동 
		}
		return "include/return";
	}  
	
	@GetMapping("/admin/board/faq/delete.do")
	public String delete(Model model, FaqVo vo) {
		int r = faqservice.delete(vo); 
		if(r > 0) {
			model.addAttribute("msg","정상적으로 삭제되었습니다.");
			model.addAttribute("url","index.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","삭제 오류");
			model.addAttribute("url","view.do?faqno="+vo.getNo()); //실패했을때 상세페이지 이동 
		}
		return "include/return";
	}
	
	@PostMapping("/admin/board/faq/deleteAll.do")
	public String deleteAll(Model model, HttpServletRequest req) {
		String[] check = req.getParameterValues("check");
		
		for (int i=0; i<check.length; i++) {
			FaqVo vo = new FaqVo();
			vo.setNo(Integer.parseInt(check[i]));
			faqservice.delete(vo);
		}
		model.addAttribute("msg","정상적으로 삭제되었습니다.");
		model.addAttribute("url","index.do");
		return "include/return";
	}	
}
