package bookmall.search;
<<<<<<< HEAD

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchServiceimpl implements SearchService {
	
	@Autowired
	SearchDao dao;
	
	@Override
	public List<SearchVo> categorySelectList(SearchVo vo) {
		return dao.categorySelectList(vo);
	}

	@Override
	public List<SearchVo> selectBookList(SearchVo vo) {
		return dao.selectBookList(vo);
	}

	@Override
	public int countBook(SearchVo vo) {
		return dao.countBook(vo);
	}
}
=======
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SearchServiceimpl implements SearchService {
	
	@Autowired
	SearchDao dao;
	
	@Override
	public List<SearchVo> categorySelectList(SearchVo vo) {
		return dao.categorySelectList(vo);
	}
	@Override
	public List<SearchVo> selectBookList(SearchVo vo) {
		return dao.selectBookList(vo);
	}
	@Override
	public int countBook(SearchVo vo) {
		return dao.countBook(vo);
	}
}
>>>>>>> branch 'master' of https://github.com/kimjinhong1/bookmall.git
