package bookmall.refund;

import java.util.List;

public interface RefundService {
	
	/*교환,반품 내역*/
	List<RefundVo> refundList(RefundVo vo);
	
	/*내역보기*/
	RefundVo view(int refundno);
	
	/*요청하기*/
	int insert(RefundVo vo);
	int insertEx(RefundVo vo);
	
	/*페이지 카운트*/
	int count(RefundVo vo);
	
	/*주문상태*/
	int update(RefundVo vo);
	
}
