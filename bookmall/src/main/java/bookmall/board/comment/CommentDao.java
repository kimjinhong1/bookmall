package bookmall.board.comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CommentDao {

	@Autowired
	private SqlSessionTemplate sst;
	
	public List<CommentVo> selectList(CommentVo cv) {
		List<CommentVo> list = sst.selectList("comment.selectList", cv); 
		return list;
	}
	
	public int insert(CommentVo cv) {
		return sst.insert("comment.insert",cv); 
	}
	
	public int delete(int c_no) {
		return sst.delete("comment.delete",c_no); 
		
	}
	
	public int updateGno(int no) {
		return sst.update("comment.updateGno", no);
	}
	
	public int updaOno(CommentVo vo) {
		return sst.update("comment.updateOno", vo);
	}
	
	public int insertReply (CommentVo vo) {
		return sst.insert("comment.insertReply", vo);
	}
}
