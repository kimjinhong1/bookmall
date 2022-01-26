package bookmall.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDao {

	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sst;
	
	//카트추가 (row 추가)
	public int addCart(CartDto cartno) {
		return sst.insert("cart.addCart", cartno);
	}
	
	//카트삭제 (row 삭제)
	public int deleteCart(int Cartno) {
		return sst.delete("cart.deleteCart", Cartno);
	}
	
	//카트수량수정
	public int modifyCount(CartDto cartno) {
		return sst.update("cart.modifyCount", cartno);
	}
	
	//카트목록
	public List<CartDto> selectList(CartDto cartno){
		List<CartDto>list = sst.selectList("cart.selectList", cartno);
		return list;
	}
	
	//카트확인
	public CartDto checkCart(CartDto cartno) {
		return sst.selectOne("cart.checkCart",cartno);
	}


}
