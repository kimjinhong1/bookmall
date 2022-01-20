package bookmall.admin.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.book.BookVo;

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
	
	// 도서 갯수 카운팅
	public int count(BookVo vo) {
		return sqlSession.selectOne("book.count",vo);
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
}
