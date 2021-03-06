package bookmall.book;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.bookcategory.BookCategoryVO;


@Repository
public class BookDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 도서 상세 정보를 위한 도서 하나만 검색
	public BookVo selectOne(int bookno) {
		return sqlSession.selectOne("book.selectOne", bookno);
	}
	
	public List<LinkedHashMap> selectCate(int bookno) {
		return sqlSession.selectList("book.selectCate", bookno);
	}
	
	// 도서 리스트 출력
	public List<BookVo> selectList(BookVo vo) {
		return sqlSession.selectList("book.selectList", vo);
	}
	
	// 도서 목록에 필요한 카테고리 검색 정보
	public List<HashMap<String, Object>> selectCateList(int bclassify, int blevel, int bcategoryno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("bclassify", bclassify);
		map.put("blevel", blevel);
		map.put("bcategoryno", bcategoryno);

		return sqlSession.selectList("book.cateList", map);
	}
	
	// 도서 카테고리
	public List<BookVo> cateNameList(BookVo vo) {
		return sqlSession.selectList("book.cateNameList", vo);
	}
	
	// 도서 메인 - 새로 나온 도서
	public List<BookVo> selectNewBook(BookVo vo) {
		return sqlSession.selectList("book.newBook", vo);
	}
	
	// 도서 메인 - 새로 나온 도서
	public List<BookVo> selectHotBook(BookVo vo) {
		return sqlSession.selectList("book.hotBook", vo);
	}
	
	// 도서 목록 - 도서 카운팅
	public int bookCount(BookVo vo) {
		return sqlSession.selectOne("book.bookCount", vo);
	}
}
