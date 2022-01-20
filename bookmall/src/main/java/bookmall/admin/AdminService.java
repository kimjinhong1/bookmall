package bookmall.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
	
	@Autowired
	AdminDao dao;
	
	//로그인
	public boolean login(AdminVo avo, HttpSession sess) {
		AdminVo av = dao.login(avo);
		if (av != null) {
			sess.setAttribute("adminInfo", av);
			return true;
		}
		return false;
	}

}
