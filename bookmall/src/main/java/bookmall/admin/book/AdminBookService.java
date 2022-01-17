package bookmall.admin.book;

import java.util.List;
import bookmall.book.BookVo;

public interface AdminBookService {

	List<BookVo> selectList(BookVo vo);
	int count(BookVo vo);
	int insert(BookVo vo);
	BookVo selectOne(int bookno);
	int update(BookVo vo);
	int delete(BookVo vo);
}
