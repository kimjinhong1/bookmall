package bookmall.recentOrder;

import java.util.List;

import bookmall.board.suda.SudaVo;
import bookmall.cart.CartDto;

public interface RecentOrderService {
	
	/*최근주문내역*/
	List<RecentOrderVo> listSelect(RecentOrderVo vo);
	List<RecentOrderVo> orderMypage(RecentOrderVo vo);
	
	/*주문내역 삭제*/
	int delete(int orderno);

}
