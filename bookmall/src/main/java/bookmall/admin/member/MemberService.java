package bookmall.admin.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookmall.user.UserVo;

@Service
public class MemberService {
	
	@Autowired
	MemberDao dao;
	
	public List<UserVo> member(UserVo vo) {
		return dao.member(vo);
	}
	
	public int count(UserVo vo) {
		return dao.count(vo);
	}

}
