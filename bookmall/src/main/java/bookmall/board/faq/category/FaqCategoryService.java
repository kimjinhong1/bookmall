package bookmall.board.faq.category;

import java.util.List;


public interface FaqCategoryService {
	
	List<FaqCategoryVo> selectAll(FaqCategoryVo vo);
	int insert(FaqCategoryVo vo);
	int update(FaqCategoryVo vo);
	int delete(FaqCategoryVo vo);
}