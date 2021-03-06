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
	
	// 소셜 로그인
	public UserVo socialLogin(UserVo vo) {
		return sqlSession.selectOne("user.socialLogin", vo);
		
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
	// 소셜 식별자 체크
	public int socialCheck(String identifier) {
		return sqlSession.selectOne("user.socialCheck", identifier);
	}
	// 회원정보 업데이트
	public int userUpdate(UserVo vo) {
		return sqlSession.update("user.userUpdate", vo);
	}
	// 닉네임 정보 업데이트
	public int nickUpdate(UserVo vo) {
		return sqlSession.update("user.nickUpdate", vo);
	}
	
	// 회원 선택
	public UserVo userSelect(UserVo vo) {
		return sqlSession.selectOne("user.userSelect", vo);
	}
	
	// 비밀번호 확인 (수정)
	public int pwdCheck(UserVo vo) {
		return sqlSession.selectOne("user.pwdCheck", vo);
	}
	
	// 비밀번호 변경 (수정)
	public int pwdUpdate(UserVo vo) {
		return sqlSession.update("user.pwdUpdate", vo);
	}
	
	// 회원 탈퇴 (일반)
	public int userDelete(UserVo vo) {
		return sqlSession.update("user.userDelete", vo);
	}
	
	// 회원 탈퇴 (소셜)
	public int userSocialDelete(UserVo vo) {
		return sqlSession.update("user.userSocialDelete", vo);
	}
}
