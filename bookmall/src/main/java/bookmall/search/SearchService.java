package bookmall.search;

import java.util.List;

public interface SearchService {
 
	List<SearchVo> categorySelectList(SearchVo vo);
	List<SearchVo> selectBookList(SearchVo vo);
	int countBook(SearchVo vo);

}
