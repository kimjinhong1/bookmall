package bookmall.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookmall.user.UserVo;


@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDao cartdao;
	
	//카트추가
	@Override
	public int addCart(CartDto cart) {
		
		//장바구니 데이터 체크 
		CartDto checkCart = cartdao.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		//장바구니 등록 & 에러시 0 반환
		return cartdao.addCart(cart);
	}


	//카트목록
	@Override
	public List<CartDto> getSelectList(CartDto userno) {
		List<CartDto> cart = cartdao.selectList(userno);
		for(CartDto dto : cart) {
			dto.initSaleTotal();
		}
		return cart;
	}
	
	//카트수량
	@Override
	public int modifyCount(CartDto cartno) {
		return cartdao.modifyCount(cartno);
	}

	//카트삭제
	@Override
	public int deleteCart(int cartno) {
		return cartdao.deleteCart(cartno);
	}
	
	//카트확인
	@Override
	public CartDto checkCart(CartDto cartno) {
		return cartdao.checkCart(cartno);
	}





}