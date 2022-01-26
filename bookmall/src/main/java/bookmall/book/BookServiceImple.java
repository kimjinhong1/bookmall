package bookmall.book;

import java.util.HashMap;
import java.util.LinkedHashMap;
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

	@Override
	public List<LinkedHashMap> selectCate(int bookno) {
		return dao.selectCate(bookno);
	}
	
	@Override
	public List<HashMap<String, Object>> selectCateList(int bclassify, int blevel, int bcategoryno) {
		return dao.selectCateList(bclassify, blevel, bcategoryno);
	}
}
