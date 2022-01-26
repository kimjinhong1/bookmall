package bookmall.user;

import javax.servlet.http.HttpSession;

public interface UserService {
	
	boolean login(UserVo vo, HttpSession sess);
	int emailCheck(String email);
	int nickCheck(String nickname);
	int insert(UserVo vo);
	UserVo searchId(UserVo vo);
	UserVo searchPwd(UserVo vo);
	boolean socialLogin(UserVo vo, HttpSession sess);
	int socialCheck(String identifier);
	int userUpdate(UserVo vo);
	int nickUpdate(UserVo vo);
	UserVo userSelect(UserVo vo);
	int pwdCheck(UserVo vo);
	int pwdUpdate(UserVo vo);
	int userDelete(UserVo vo);

}
