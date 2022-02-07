package bookmall.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookmall.addr.AddrVo;
import bookmall.book.BookVo;
import bookmall.cart.CartDto;
import bookmall.user.UserVo;


@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDao orderDao;

	@Override
	public int insert(OrderVo vo) {
		return orderDao.insert(vo);
	}
	
	@Override
	public int bookInsert(BookVo vo) {
		return orderDao.bookInsert(vo);
	}
	
	@Override
	public int bookListInsert(CartDto vo) {
		return orderDao.bookListInsert(vo);
	}
	
	@Override
	public int addrInsert(AddrVo vo) {
		return orderDao.addrInsert(vo);
	}
	
	@Override
	public BookVo bookSelect(BookVo vo) {
		return orderDao.bookSelect(vo);
	}

	@Override
	public List<CartDto> bookListSelect(CartDto vo) {
		return orderDao.bookListSelect(vo);		
	}
	
	@Override
	public List<CartDto> cartnoSelect(CartDto vo) {
		return orderDao.cartnoSelect(vo);		
	}

	@Override
	public UserVo userSelect(UserVo vo) {
		return orderDao.userSelect(vo);
	}

	@Override
	public List<AddrVo> addrSelect(AddrVo vo) {
		return orderDao.addrSelect(vo);
	}

	@Override
	public OrderVo orderSelect(OrderVo vo) {
		return orderDao.orderSelect(vo);
	}

	@Override
	public int deleteOrderCart(int vo) {
		return orderDao.deleteOrderCart(vo);
	}


}
	
