package bookmall.board.faq.category;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository  // MvcCinfig 에 스캔을 해서 @Repository 적기만해도 빈 객체 생성 
public class FaqCategoryDao {
	
	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<FaqCategoryVo> selectList(FaqCategoryVo vo) {
		return sqlSessionTemplate.selectList("faqcategory.selectList",vo);
	}
	
	public int insert(FaqCategoryVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("faqcategory.insert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public int update(FaqCategoryVo vo) {
		return sqlSessionTemplate.update("faqcategory.update", vo);
	}
	
	public int delete(FaqCategoryVo vo) {
		return sqlSessionTemplate.delete("faqcategory.delete",vo.getNo());
	}

}
