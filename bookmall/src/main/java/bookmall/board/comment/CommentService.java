package bookmall.board.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {

	@Autowired
	CommentDao dao;
	
	public List<CommentVo> selectList(CommentVo vo) {
		return dao.selectList(vo); 
	}
	
	public int insert(CommentVo vo) {
		int r = dao.insert(vo);
		if (r > 0) dao.updateGno(vo.getNo());
		return r;
	}
	public int delete(int c_no) {
		return dao.delete(c_no);
	}
	
	public int reply(CommentVo vo) {
		dao.updaOno(vo); // 같은 그룹이면 부모의 ono보다 큰놈들을 전부 +1
		vo.setOno(vo.getOno()+1); // 부모 ono에서 +1
		vo.setNested(vo.getNested()+1); // 부모 nested에서 +1
		return dao.insertReply(vo); // 위에 다한다음에 답변 저장 
	}
}
