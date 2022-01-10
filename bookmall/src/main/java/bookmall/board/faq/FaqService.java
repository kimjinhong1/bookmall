package bookmall.board.faq;

import java.util.List;


public interface FaqService {

	List<FaqVo> selectAll(FaqVo vo);
	int count(FaqVo vo);
	int insert(FaqVo vo);
	FaqVo view(int faqno);
	FaqVo edit(int faqno);
	int update(FaqVo vo);
	int delete(FaqVo vo);
}

