package bookmall.admin.book;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import bookmall.book.BookVo;
import bookmall.bookcategory.BookCategoryMappingVO;

public interface AdminBookService {

	List<BookVo> selectList(BookVo vo);
	List<BookVo> selectAdminList(BookVo vo);
	int bookCount(BookVo vo);
	int AdminbookCount(BookVo vo);
	int insert(BookVo vo);
	BookVo selectOne(int bookno);
	int update(BookVo vo);
	int delete(BookVo vo);
	int isbnCheck(String isbn);
	List<LinkedHashMap> selectCate(int bookno);
	List<HashMap<String, Object>> selectCateList(int bclassify, int blevel, int bcategoryno);
	int insertMapping(BookCategoryMappingVO vo);
}
