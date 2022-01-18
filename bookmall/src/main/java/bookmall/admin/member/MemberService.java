package bookmall.admin.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookmall.user.UserVo;

@Service
public class MemberService {
	
	@Autowired
	MemberDao dao;
	// 회원 리스트
	public List<UserVo> member(UserVo vo) {
		return dao.member(vo);
	}
	// 회원 수
	public int count(UserVo vo) {
		return dao.count(vo);
	}
	
	// 회원 상세
	public UserVo detailMember(UserVo vo) {
		return dao.detailMember(vo);
	}
	
	// 회원 수정
	public int memberUpdate(UserVo vo) {
		return dao.memberUpdate(vo);
	}
	
	//회원 구매정보
	public List<UserVo> memberBuyRecode(UserVo vo) {
		return dao.memberBuyRecode(vo);
	}
	
	// 주문상품 금액 총합
	public int member_buy_price(UserVo vo) {
		return dao.member_buy_price(vo);
	}
	
	// 주문상품 개수 총합
	public int member_buy_count(UserVo vo) {
		return dao.member_buy_count(vo);
	}
	
	// 회원이 구매한 주문상세 수
	public int countOrder(UserVo vo) {
		return dao.countOrder(vo);
	}

}
