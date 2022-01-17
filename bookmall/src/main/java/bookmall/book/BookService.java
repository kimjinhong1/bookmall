package bookmall.book;

import java.util.List;


public interface BookService {

	BookVo selectOne(int bookno);
	List<BookVo> selectList(BookVo vo);
	int count(BookVo vo);
}
