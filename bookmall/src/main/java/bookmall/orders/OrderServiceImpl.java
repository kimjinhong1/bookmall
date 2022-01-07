package bookmall.orders;

import java.util.List;

import org.springframework.stereotype.Service;

@Service("orderServiceImpl")
public class OrderServiceImpl implements OrderService {
//	@Inject
//	private OrderMapper orderMapper;
	
	@Override
	public List<OrderVo> getOrderDesc(String orderno) {
		return null;
	}

	@Override
	public List<OrderVo> getUserOrderList(int userno) {
		return null;
	}

}
	
