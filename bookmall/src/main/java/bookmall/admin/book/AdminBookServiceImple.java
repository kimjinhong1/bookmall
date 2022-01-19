package bookmall.admin.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookmall.book.BookVo;

@Service
public class AdminBookServiceImple implements AdminBookService {

	@Autowired
	AdminBookDao dao;
	
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

	@Override
	public int insert(BookVo vo) {
		return dao.insert(vo);
	}

	@Override
	public int update(BookVo vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(BookVo vo) {
		return dao.delete(vo);
	}

	@Override
	public int isbnCheck(String isbn) {
		return dao.isbnCheck(isbn);
	}

}
