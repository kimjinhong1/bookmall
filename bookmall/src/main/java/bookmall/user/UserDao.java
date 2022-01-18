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
	
	
	//닉네임 중복체크
	public int nickCheck(String nickname) {
		return sqlSession.selectOne("user.nickCheck", nickname);
	}
	
	// 이메일 찾기
	public UserVo searchId(UserVo vo) {
		return sqlSession.selectOne("user.searchId", vo);
	}
	
	// 비밀번호 찾기(해당 유저정보 검색)
	public UserVo searchPwd(UserVo vo) {
		return sqlSession.selectOne("user.searchPwd", vo);
	}
	// 임시 비밀번호 업데이트
	public int updateTempPwd(UserVo vo) {
		return sqlSession.update("user.updateTempPwd", vo);
	}
	
	// 최근 로그인 날짜 체크
	public int updateRecently_accessed(UserVo vo) {
		return sqlSession.update("user.updateRecently_accessed", vo);
	}
	
	//로그인 횟수 기록
	public int checkNumber(UserVo vo) {
		return sqlSession.update("user.checkNumber", vo);
	}
	
}
