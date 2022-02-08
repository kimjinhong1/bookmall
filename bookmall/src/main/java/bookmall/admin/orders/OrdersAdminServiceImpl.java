package bookmall.admin.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookmall.board.suda.SudaVo;
import bookmall.book.BookVo;


@Service
public class OrdersAdminServiceImpl implements OrdersAdminService{
	
	@Autowired
	OrdersAdminDao ordersAdminDao;
	
	@Override
	public List<OrdersAdminVo> totSelect(OrdersAdminVo vo) {
		return ordersAdminDao.totSelect(vo);		
	}
	
	@Override
	public int count(OrdersAdminVo vo) {
		return ordersAdminDao.count(vo);
	}

	@Override
	public int update(OrdersAdminVo vo) {
		return ordersAdminDao.update(vo);
	}
	
	@Override
	public int refundUpdate(OrdersAdminVo vo) {
		return ordersAdminDao.refundUpdate(vo);
	}

}
