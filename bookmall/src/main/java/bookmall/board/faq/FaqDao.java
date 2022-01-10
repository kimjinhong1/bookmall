package bookmall.board.faq;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository 
public class FaqDao {

	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;
	
	public int count(FaqVo vo) {
		return sqlSessionTemplate.selectOne("faq.count",vo);
	}
	
	public List<FaqVo> selectList(FaqVo vo) {
		return sqlSessionTemplate.selectList("faq.selectList",vo);
	}
	
	public int insert(FaqVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("faq.insert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public FaqVo selectOne(int faqno) {
		return sqlSessionTemplate.selectOne("faq.selectOne", faqno);
	}
	
	public int update(FaqVo vo) {
		return sqlSessionTemplate.update("faq.update", vo);
	}
	
	public int delete(FaqVo vo) {
		return sqlSessionTemplate.delete("faq.delete",vo.getNo());
	}

}
