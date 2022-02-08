package bookmall.refund;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.board.notice.NoticeVo;
import bookmall.board.suda.SudaVo;

@Repository  // MvcCinfig 에 스캔을 해서 @Repository 적기만해도 빈 객체 생성 
public class RefundDao {
	
	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;
	
	//문의 목록
	public List<RefundVo> refundList(RefundVo vo) {
		return sqlSessionTemplate.selectList("refund.refundList",vo);
	}

	//취소,환불등록
	public int insert(RefundVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("refund.insert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	//교환,반품 등록
	public int insertEx(RefundVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("refund.insertEx",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	//문의 자세히보기
	public RefundVo view(int refundno) {
		return sqlSessionTemplate.selectOne("refund.view",refundno);
	}
	
	public int update(RefundVo vo) {
		return sqlSessionTemplate.update("refund.update", vo);
	}
	
	public int count(RefundVo vo) {
		return sqlSessionTemplate.selectOne("refund.count",vo);
	}
}


