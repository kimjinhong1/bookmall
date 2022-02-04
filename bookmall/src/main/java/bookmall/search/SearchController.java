package bookmall.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bookmall.util.CommonUtil;

@Controller
public class SearchController {
	
	@Autowired
	SearchService service;
	
	// 검색 페이지
	@GetMapping("/search/index.do")
	public String index(Model model, SearchVo vo) {
		model.addAttribute("vo", vo);
		return "search/index";
	}
	
	//검색 실행
	@GetMapping("/search/search.do")
	@ResponseBody
	public Map<String, Object> search(Model model, SearchVo vo) {
		
		Map<String, Object> result = new HashMap<String, Object>();

		// 총 페이지 수
		int totCount = service.countBook(vo);
		int totPage = totCount / 10;
		if (totCount % 10 > 0) totPage++;
		// 시작인덱스 구하기
		int startIdx = (vo.getPage()-1) * 10;
		vo.setStartIdx(startIdx);
		int page = vo.getPage();
		
		List<SearchVo> booklist = service.selectBookList(vo);
		result.put("booklist", booklist);
		result.put("totCount", totCount);
		result.put("totPage", totPage);
		result.put("page", page);
		//result.put("pageArea", CommonUtil.getPageAreaSearch("search.do", vo.getPage(), totPage, 10, vo));
		return result;
	}
	
	// 카테고리 클릭 이벤트
	@GetMapping("/search/category2.do")
	@ResponseBody
	public Object search2(SearchVo vo, Model model) {
			List<SearchVo> catelist = service.categorySelectList(vo);
		return catelist;
	}
	
}