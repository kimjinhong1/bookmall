package bookmall.orders;

import java.util.List;

public interface OrderService {

	//주문번호로 주문 내역정보를 가져오는 메소드
	List<OrderVo> getOrderDesc(String orderno);
		
	//회원번호로 회원의 주문한 목록을 가져오는 메소드
	List<OrderVo> getUserOrderList(int userno);
}
