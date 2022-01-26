package bookmall.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int bookListInsert(CartVo vo) {
		return orderDao.bookListInsert(vo);
	}
	
	@Override
	public int addrInsert(AddrListVo vo) {
		return orderDao.addrInsert(vo);
	}
	
	@Override
	public BookVo bookSelect(BookVo vo) {
		return orderDao.bookSelect(vo);
	}

	@Override
	public List<CartVo> bookListSelect(CartVo vo) {
		return orderDao.bookListSelect(vo);		
	}

	@Override
	public UserVo userSelect(UserVo vo) {
		return orderDao.userSelect(vo);
	}

	@Override
	public List<AddrListVo> addrSelect(AddrListVo vo) {
		return orderDao.addrSelect(vo);
	}

}
	
