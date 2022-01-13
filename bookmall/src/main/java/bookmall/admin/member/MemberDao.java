package bookmall.admin.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookmall.user.UserVo;

@Repository
public class MemberDao {
		
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<UserVo> member(UserVo vo) {
		return sqlSession.selectList("member.member", vo);
	}
	
	public int count(UserVo vo) {
		return sqlSession.selectOne("member.count", vo);
	}
}
