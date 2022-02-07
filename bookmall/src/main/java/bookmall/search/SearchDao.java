package bookmall.search;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class SearchDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//카테고리 선택
	public List<SearchVo> categorySelectList(SearchVo vo) {
		return sqlSessionTemplate.selectList("search.categorySelectList", vo);
	}
	
	// 도서 검색
	public List<SearchVo> selectBookList(SearchVo vo) {
		return sqlSessionTemplate.selectList("search.selectBookList", vo);
	}
	
	// 검색된 도서 수량
	public int countBook(SearchVo vo) {
		return sqlSessionTemplate.selectOne("search.countBook", vo);
	}
}