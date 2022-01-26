package bookmall.book;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;


public interface BookService {

	BookVo selectOne(int bookno);
	List<BookVo> selectList(BookVo vo);
	int count(BookVo vo);
	List<LinkedHashMap> selectCate(int bookno);
	List<HashMap<String, Object>> selectCateList(int bclassify, int blevel, int bcategoryno);
}
