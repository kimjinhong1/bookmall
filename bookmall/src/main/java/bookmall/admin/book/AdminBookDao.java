package bookmall.admin.book;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.book.BookVo;
import bookmall.bookcategory.BookCategoryMappingVO;

@Repository
public class AdminBookDao {

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
	
	// (관리자) 도서 리스트 출력
	public List<BookVo> selectAdminList(BookVo vo) {
		return sqlSession.selectList("book.selectAdminList", vo);
	}
	
	// 도서 갯수 카운팅
	public int bookCount(BookVo vo) {
		return sqlSession.selectOne("book.bookCount", vo);
	}
	
	// (관리자) 도서 갯수 카운팅
	public int AdminbookCount(BookVo vo) {
		return sqlSession.selectOne("book.AdminbookCount", vo);
	}
	
	// 도서 등록
	public int insert(BookVo vo) {
		int r = -1;
		
		try {
			r =  sqlSession.insert("book.insert", vo); 
		} catch(Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	// 도서 정보 수정
	public int update(BookVo vo) {
		int r = -1;
		
		try {
			r =  sqlSession.update("book.update", vo); 
		} catch(Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	// 도서 정보 삭제
	public int delete(BookVo vo) {
		int r = -1;
		
		try {
			r =  sqlSession.update("book.delete", vo); 
		} catch(Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	// isbn 중복체크
	public int isbnCheck(String isbn) {
		return sqlSession.selectOne("book.isbnCheck", isbn);
	}
	
	// 도서 카테고리 정보 
	public List<LinkedHashMap> selectCate(int bookno) {
		return sqlSession.selectList("book.selectCate", bookno);
	}
	
	// 도서 등록에 필요한 카테고리 검색 정보
	public List<HashMap<String, Object>> selectCateList(int bclassify, int blevel, int bcategoryno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("bclassify", bclassify);
		map.put("blevel", blevel);
		map.put("bcategoryno", bcategoryno);

		return sqlSession.selectList("book.cateList", map);
	}
	
	// 도서-카테고리-매핑 테이블에 등록
	public int insertMapping(BookCategoryMappingVO vo) {
		return sqlSession.insert("book.insertMapping", vo);
	}
	
}
