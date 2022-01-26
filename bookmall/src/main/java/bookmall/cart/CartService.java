package bookmall.cart;

import java.util.List;

public interface CartService {

	/*장바구니 추가*/
	public int addCart(CartDto cartno);
	
	/*장바구니 정보 리스트*/
	public List<CartDto> getSelectList(CartDto userno);
	
	/*카트 수량 수정*/
	public int modifyCount(CartDto cartno);
	
	/*카트 삭제*/
	public int deleteCart(int cartno);
	

	/*카트 확인*/
	public CartDto checkCart(CartDto cartno);

}
