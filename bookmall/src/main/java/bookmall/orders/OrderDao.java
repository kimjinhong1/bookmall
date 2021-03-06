package bookmall.orders;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.addr.AddrVo;
import bookmall.book.BookVo;
import bookmall.cart.CartDto;
import bookmall.user.UserVo;

@Repository
public class OrderDao {

	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;
//	배송자 정보
	public int insert(OrderVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("orders.insert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
//	바로 구매하기	
	public int bookInsert(BookVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("orders.bookInsert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
//	장바구니
	public int bookListInsert(CartDto vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("orders.bookListInsert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
//	새 주소록
	public int addrInsert(AddrVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("orders.addrInsert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	//책정보 가져오기
	public BookVo bookSelect(BookVo vo) {
		return sqlSessionTemplate.selectOne("orders.bookSelect", vo);
	}
	
	// 장바구니에서 책정보 가져오기
	public List<CartDto> bookListSelect(CartDto vo) {  
		return sqlSessionTemplate.selectList("orders.bookListSelect", vo);
	}
	//cartno 가져오기
	public List<CartDto> cartnoSelect(CartDto vo) {  
		return sqlSessionTemplate.selectList("orders.cartnoSelect", vo);
	}
	
	// 회원정보 가져오기
	public UserVo userSelect(UserVo vo) {
		return sqlSessionTemplate.selectOne("orders.userSelect", vo);
	}
	
	// 주소록 가져오기
	public List<AddrVo> addrSelect(AddrVo vo) {
		return sqlSessionTemplate.selectList("orders.addrSelect", vo);
	}
	
	// 주문정보 가져오기
	public OrderVo orderSelect(OrderVo vo) {
		return sqlSessionTemplate.selectOne("orders.orderSelect", vo);
	}
	
	public int deleteOrderCart(int vo) {
		return sqlSessionTemplate.delete("orders.deleteOrderCart", vo);
	}
	
	
	
}
