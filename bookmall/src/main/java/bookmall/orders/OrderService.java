package bookmall.orders;

import java.util.List;

import bookmall.user.UserVo;

public interface OrderService {

	int insert(OrderVo vo);
	int bookInsert(BookVo vo);
	int bookListInsert(CartVo vo);
	int addrInsert(AddrListVo vo);
	BookVo bookSelect(BookVo vo);
	List<CartVo> bookListSelect(CartVo vo);
	UserVo userSelect(UserVo vo);
	List<AddrListVo> addrSelect(AddrListVo vo);
}
