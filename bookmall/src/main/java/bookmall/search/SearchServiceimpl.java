package bookmall.search;

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
