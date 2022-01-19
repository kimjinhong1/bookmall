package bookmall.admin.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.user.UserVo;

@Repository
public class MemberDao {
		
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 회원 리스트
	public List<UserVo> member(UserVo vo) {
		return sqlSession.selectList("member.member", vo);
	}
	// 회원 수
	public int count(UserVo vo) {
		return sqlSession.selectOne("member.count", vo);
	}
	
	// 회원 상세
	public UserVo detailMember(UserVo vo) {
		return sqlSession.selectOne("member.detailMember", vo);
	}
	
	// 회원 수정
	public int memberUpdate(UserVo vo) {
		return sqlSession.update("member.memberUpdate", vo);
	}
	
	// 회원 구매 정보
	public List<UserVo> memberBuyRecode(UserVo vo) {
		return sqlSession.selectList("member.memberBuyRecode", vo);
	}
	
	// 주문상품 금액 총합
	public int member_buy_price(UserVo vo) {
		return sqlSession.selectOne("member.member_buy_price", vo);
	}
	
	// 주문상품 개수 총합
	public int member_buy_count(UserVo vo) {
		return sqlSession.selectOne("member.member_buy_count", vo);
	}
	
	// 회원이 구매한 주문상세 수
	public int countOrder(UserVo vo) {
		return sqlSession.selectOne("member.countOrder",vo);
	}
}
