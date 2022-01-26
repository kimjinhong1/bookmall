package bookmall.addr;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.board.suda.SudaVo;

@Repository  // MvcCinfig 에 스캔을 해서 @Repository 적기만해도 빈 객체 생성 
public class AddrDao {
	
	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<AddrVo> addList(AddrVo vo) {
		return sqlSessionTemplate.selectList("addr.listSelect",vo);
	}

	public int insert(AddrVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("addr.insert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public int delete(int addno) {
		return sqlSessionTemplate.delete("addr.delete",addno);
	}

	public AddrVo view(int addno) {
		return sqlSessionTemplate.selectOne("addr.view",addno);
	}
	
	public int update(AddrVo vo) {
		return sqlSessionTemplate.update("addr.update", vo);
	}
	
}


