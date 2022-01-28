package bookmall.book.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class ReviewDao {

	@Autowired
	private SqlSessionTemplate sst;
	
	public List<ReviewVo> selectList(ReviewVo vo) {
		List<ReviewVo> list = sst.selectList("review.selectList", vo); 
		return list;
	}
	
	public int insert(ReviewVo vo) {
		return sst.insert("review.insert", vo); 
	}
	
	public int delete(ReviewVo vo) {
		return sst.delete("review.delete",vo); 
		
	}
	public int update(ReviewVo vo) {
		return sst.update("review.update", vo);
	}
	
	public int count(ReviewVo vo) {
		return sst.selectOne("review.count",vo);
	}
	
	public double score(ReviewVo vo) {
		return sst.selectOne("review.score",vo);
	}
	
	public int countAdmin(ReviewVo vo) {
		return sst.selectOne("review.countAdmin",vo);
	}
	
	public List<ReviewVo> selectListAdmin(ReviewVo vo) {
		List<ReviewVo> list = sst.selectList("review.selectListAdmin", vo); 
		return list;
	}
}
