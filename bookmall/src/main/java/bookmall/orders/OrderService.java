package bookmall.orders;

import java.util.List;

import bookmall.book.BookVo;
import bookmall.cart.CartDto;
import bookmall.user.UserVo;

public interface OrderService {

	int insert(OrderVo vo);
	int bookInsert(BookVo vo);
	int bookListInsert(CartDto cdto);
	int addrInsert(AddrListVo vo);
	BookVo bookSelect(BookVo vo);
	List<CartDto> bookListSelect(CartDto cv);
	UserVo userSelect(UserVo vo);
	List<AddrListVo> addrSelect(AddrListVo vo);
	OrderVo orderSelect(OrderVo vo);
	int deleteOrderCart(CartDto vo);
	List<CartDto> cartnoSelect(CartDto vo);
}
