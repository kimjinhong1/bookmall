package bookmall.admin.orders;

import java.util.List;

public interface OrdersAdminService {

	/*주문목록*/
	List<OrdersAdminVo> totSelect(OrdersAdminVo vo);  
	
	/*페이지 카운트*/
	int count(OrdersAdminVo vo);
	
	/*관리자 페이지 주문상태*/
	int update(OrdersAdminVo vo);
	
	/*refund 주문상태*/
	int refundUpdate(OrdersAdminVo vo);
}
