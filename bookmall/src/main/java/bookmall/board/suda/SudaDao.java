package bookmall.board.suda;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.board.comment.CommentVo;



@Repository  // MvcCinfig 에 스캔을 해서 @Repository 적기만해도 빈 객체 생성 
public class SudaDao {
	
	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;
	
	public int count(SudaVo vo) {
		return sqlSessionTemplate.selectOne("suda.count",vo);
	}
	
	public List<SudaVo> selectList(SudaVo vo) {
		return sqlSessionTemplate.selectList("suda.selectList",vo);
	}
	
	public int insert(SudaVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("suda.insert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public SudaVo selectOne(int sudano) {
		return sqlSessionTemplate.selectOne("suda.selectOne", sudano);
	}
	
	public int updateReadcount(int sudano) {
		return sqlSessionTemplate.update("suda.updateReadcount", sudano);
	}
	
	public int delete(SudaVo vo) {
		return sqlSessionTemplate.delete("suda.delete",vo.getNo());
	}
	
	
	public int update(SudaVo vo) {
		return sqlSessionTemplate.update("suda.update", vo);
	}
	
	public int updateGno(int no) {
		return sqlSessionTemplate.update("suda.updateGno", no);
	}
	
	public int updateOno(SudaVo vo) {
		return sqlSessionTemplate.update("suda.updateOno", vo);
	}
	
	public int insertReply (SudaVo vo) {
		return sqlSessionTemplate.insert("suda.insertReply", vo);
	}
}
