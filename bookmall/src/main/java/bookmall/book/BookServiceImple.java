package bookmall.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class BookServiceImple implements BookService {

	@Autowired
	BookDao dao;

	@Override
	public BookVo selectOne(int bookno) {
		return dao.selectOne(bookno);
	}

	@Override
	public List<BookVo> selectList(BookVo vo) {
		return dao.selectList(vo);
	}

	@Override
	public int count(BookVo vo) {
		return dao.count(vo);
	}
}
