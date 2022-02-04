package bookmall.admin.orders;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.ask.AskVo;


@Repository
public class OrdersAdminDao {
	
	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;

	public List<OrdersAdminVo> totSelect(OrdersAdminVo vo) {  
		return sqlSessionTemplate.selectList("orders.totSelect", vo);
	}
	
	public int count(OrdersAdminVo vo) {
		return sqlSessionTemplate.selectOne("orders.count",vo);
	}

	public int update(OrdersAdminVo vo) {
		return sqlSessionTemplate.update("orders.update", vo);
	}
}
