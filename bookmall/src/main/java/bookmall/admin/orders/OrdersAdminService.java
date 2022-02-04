package bookmall.admin.orders;

import java.util.List;

public interface OrdersAdminService {

	List<OrdersAdminVo> totSelect(OrdersAdminVo vo);  
	public int count(OrdersAdminVo vo);
	/*문의내역 답글*/
	int update(OrdersAdminVo vo);
}
