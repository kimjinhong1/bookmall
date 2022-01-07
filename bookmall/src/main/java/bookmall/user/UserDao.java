package bookmall.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 회원가입
		public int insert(UserVo vo) {
			return sqlSession.insert("user.insert", vo);
		}
	
	//로그인
	public UserVo login(UserVo vo) {
		return sqlSession.selectOne("user.login", vo);
		
	}
	
	//이메일 중복체크
	public int emailCheck(String email) {
		return sqlSession.selectOne("user.emailCheck", email);
	}

}
