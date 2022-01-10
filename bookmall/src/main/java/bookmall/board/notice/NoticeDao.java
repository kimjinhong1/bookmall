package bookmall.board.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository  // MvcCinfig 에 스캔을 해서 @Repository 적기만해도 빈 객체 생성 
public class NoticeDao {
	
	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;
	
	public int count(NoticeVo vo) {
		return sqlSessionTemplate.selectOne("notice.count",vo);
	}
	
	public List<NoticeVo> selectList(NoticeVo vo) {
		return sqlSessionTemplate.selectList("notice.selectList",vo);
	}
	
	public int insert(NoticeVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("notice.insert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public NoticeVo selectOne(int noticeno) {
		return sqlSessionTemplate.selectOne("notice.selectOne", noticeno);
	}
	
	public int updateReadcount(int noticeno) {
		return sqlSessionTemplate.update("notice.updateReadcount", noticeno);
	}
	
	
	public int delete(NoticeVo vo) {
		return sqlSessionTemplate.delete("notice.delete",vo.getNo());
	}
	
	public int update(NoticeVo vo) {
		return sqlSessionTemplate.update("notice.update", vo);
	}
}
