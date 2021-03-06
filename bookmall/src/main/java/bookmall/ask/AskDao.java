package bookmall.ask;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.board.notice.NoticeVo;
import bookmall.board.suda.SudaVo;

@Repository  // MvcCinfig 에 스캔을 해서 @Repository 적기만해도 빈 객체 생성 
public class AskDao {
	
	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;
	
	//문의 목록
	public List<AskVo> askList(AskVo vo) {
		return sqlSessionTemplate.selectList("ask.askList",vo);
	}

	//문의등록
	public int insert(AskVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("ask.askinsert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	//문의 자세히보기
	public AskVo view(int askno) {
		return sqlSessionTemplate.selectOne("ask.view",askno);
	}
	
	//수정
	public AskVo edit(int askno) {
		return sqlSessionTemplate.selectOne("ask.askedit",askno);
	}
	
	//삭제
	public int delete(int askno) {
		return sqlSessionTemplate.delete("ask.askdelete",askno);
	}
	
	//답변등록 (관리자페이지)
	public int insertReply (AskVo askno) {
		return sqlSessionTemplate.insert("ask.insertReply", askno);
	}
	
	public int updateGno(int askno) {
		return sqlSessionTemplate.update("ask.updateGno", askno);
	}
	
	public int updateOno(AskVo askno) {
		return sqlSessionTemplate.update("ask.updateOno", askno);
	}
	
	
	public int update(AskVo askno) {
		return sqlSessionTemplate.update("ask.update", askno);
	}
	
	public int count(AskVo askno) {
		return sqlSessionTemplate.selectOne("ask.count",askno);
	}
}


