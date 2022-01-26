package bookmall.book.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {

	@Autowired
	ReviewDao reviewdao;
	
	public List<ReviewVo> selectList(ReviewVo vo) {
		return reviewdao.selectList(vo); 
	}
	
	public int insert(ReviewVo vo) {
		int r = reviewdao.insert(vo);
		return r;
	}
	public int delete(ReviewVo vo) {
		return reviewdao.delete(vo);
	}
	
	public int update(ReviewVo vo) {
		return reviewdao.update(vo);
	}
	
	public int count(ReviewVo vo) {
		return reviewdao.count(vo);
	}

	public double score(ReviewVo vo) {
		return reviewdao.score(vo);
	}
	
	public int countAdmin(ReviewVo vo) {
		return reviewdao.countAdmin(vo);
	}
	
	public List<ReviewVo> selectListAdmin(ReviewVo vo) {
		return reviewdao.selectListAdmin(vo); 
	}
}
