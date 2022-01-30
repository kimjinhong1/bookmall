package bookmall.recentOrder;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.board.suda.SudaVo;
import bookmall.cart.CartDto;

@Repository  // MvcCinfig 에 스캔을 해서 @Repository 적기만해도 빈 객체 생성 
public class RecentOrderDao {
	
	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;
	
	//목록
	public List<RecentOrderVo> myList(RecentOrderVo vo) {
		return sqlSessionTemplate.selectList("recentOrder.listSelect",vo);
	}
	
	//마이페이지 목록
	public List<RecentOrderVo> orderMypage(RecentOrderVo vo) {
		return sqlSessionTemplate.selectList("recentOrder.orderMypage",vo);
	}

	public int delete(int orderno) {
		return sqlSessionTemplate.delete("recentOrder.delete",orderno);
	}
	
}


