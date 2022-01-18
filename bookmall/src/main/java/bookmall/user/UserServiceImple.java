package bookmall.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookmall.util.SendMail;

@Service
public class UserServiceImple implements UserService {

	@Autowired
	UserDao dao;
	
	//로그인
	@Override
	public boolean login(UserVo vo, HttpSession sess) {
		UserVo uv = dao.login(vo);
		if (uv != null) { 
			sess.setAttribute("userInfo", uv);
			dao.updateRecently_accessed(vo); // 최근 로그인 기록
			// 로그인 기록 1증가
			vo.setCheckNumber(vo.getCheckNumber()+1);
			dao.checkNumber(vo); 
			return true;
		}		
		return false;
	}
	// 가입 시 이메일 체크
	@Override
	public int emailCheck(String email) {		
		return dao.emailCheck(email);
	}
	// 가입 시 닉네임 체크
	@Override
	public int nickCheck(String nickname) {		
		return dao.nickCheck(nickname);
	}
	// 회원 가입
	@Override
	public int insert(UserVo vo) {
		return dao.insert(vo);
	}
	// 이메일 찾기
	@Override
	public UserVo searchId(UserVo vo) {
		return dao.searchId(vo);
	}
	// 비밀번호 찾기(임시비밀번호 생성 후 이메일로 전송함)
	@Override
	public UserVo searchPwd(UserVo vo) {
		// 이메일과 이름으로 DB에서 조회
		UserVo uv = dao.searchPwd(vo);
		// 조회한 결과가 있으면 임시비밀번호 생성, 임시비밀번호로 변경, 이메일 발송
		if (uv != null) {
			// 임시비밀번호 생성
			String tempPwd = SendMail.random();
			// 임시비밀번호 변경
			vo.setPwd(tempPwd);
			System.out.println(tempPwd);
			dao.updateTempPwd(vo);
			// 이메일발송
			SendMail.sendMail(	uv.getEmail(),
								"[임시비밀번호]" ,
								"임시비밀번호는 <span style='color:red;'> "+tempPwd+"</span>입니다.");
		}
		return uv;
	}

}