package bookmall.recentOrder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookmall.cart.CartDto;


@Service
public class RecentOrderServiceImpl implements RecentOrderService {

		@Autowired
		RecentOrderDao recentOrderDao;
		
		@Override
	   public List<RecentOrderVo> listSelect(RecentOrderVo vo) {
	      return recentOrderDao.myList(vo);
		   }
		
		@Override
	   public List<RecentOrderVo> orderMypage(RecentOrderVo vo) {
	      return recentOrderDao.orderMypage(vo);
	   }
		
		@Override
		public int delete(int orderno) {
			return recentOrderDao.delete(orderno);
		}
	

}
