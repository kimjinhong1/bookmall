package bookmall.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BookDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 도서 상세 정보를 위한 도서 하나만 검색
	public BookVo selectOne(int bookno) {
		return sqlSession.selectOne("book.selectOne", bookno);
	}
	
	// 도서 리스트 출력
	public List<BookVo> selectList(BookVo vo) {
		return sqlSession.selectList("book.selectList", vo);
	}
	
	// 도서 갯수 카운팅
	public int count(BookVo vo) {
		return sqlSession.selectOne("book.count",vo);
	}
}
