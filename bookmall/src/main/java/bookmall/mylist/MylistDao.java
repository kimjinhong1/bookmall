package bookmall.mylist;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.board.suda.SudaVo;
import bookmall.cart.CartDto;

@Repository  // MvcCinfig 에 스캔을 해서 @Repository 적기만해도 빈 객체 생성 
public class MylistDao {
	
	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<MylistVo> myList(MylistVo vo) {
		return sqlSessionTemplate.selectList("mylist.listSelect",vo);
	}
	
	public List<MylistVo> listMypage(MylistVo vo) {
		return sqlSessionTemplate.selectList("mylist.listMypage",vo);
	}

	public int insert(MylistVo vo) {
		//return sqlSessionTemplate.insert("ask.insert",vo);
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("mylist.insert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public int delete(int listno) {
		return sqlSessionTemplate.delete("mylist.delete",listno);
	}
	
	//카트확인
	public MylistVo checkList(MylistVo vo) {
		return sqlSessionTemplate.selectOne("mylist.checkList",vo);
	}
	
}


