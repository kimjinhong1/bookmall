package bookmall.ask;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.board.suda.SudaVo;

@Repository  // MvcCinfig 에 스캔을 해서 @Repository 적기만해도 빈 객체 생성 
public class AskDao {
	
	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;
	
	public int count(AskVo vo) {
		return sqlSessionTemplate.selectOne("ask.count",vo);
	}
	
	public List<AskVo> askList(AskVo vo) {
		return sqlSessionTemplate.selectList("ask.askList",vo);
	}

	public int insert(AskVo vo) {
		//return sqlSessionTemplate.insert("ask.insert",vo);
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("ask.askinsert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public AskVo selectOne(int askno) {
		return sqlSessionTemplate.selectOne("ask.selectOne",askno);
	}
	
	public int delete(AskVo vo) {
		return sqlSessionTemplate.delete("ask.delete",vo.getAskno());
	}
	
	public int updateGno(int askno) {
		return sqlSessionTemplate.update("ask.updateGno", askno);
	}
	
	public int updateOno(AskVo askno) {
		return sqlSessionTemplate.update("ask.updateOno", askno);
	}
	
	public int insertReply (AskVo askno) {
		return sqlSessionTemplate.insert("ask.insertReply", askno);
	}
}


