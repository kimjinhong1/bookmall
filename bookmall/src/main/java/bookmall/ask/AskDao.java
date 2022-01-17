package bookmall.ask;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository  // MvcCinfig 에 스캔을 해서 @Repository 적기만해도 빈 객체 생성 
public class AskDao {
	
	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;
	
	public int count(AskVo vo) {
		return sqlSessionTemplate.selectOne("ask.count",vo);
	}
	
	public List<AskVo> selectList(AskVo vo) {
		return sqlSessionTemplate.selectList("ask.selectList",vo);
	}

	public int insert(AskVo vo) {
		//return sqlSessionTemplate.insert("ask.insert",vo);
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("ask.insert",vo);
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
}


