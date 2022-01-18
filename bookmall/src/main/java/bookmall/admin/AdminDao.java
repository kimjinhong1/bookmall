package bookmall.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인
	public AdminVo login(AdminVo avo) {
		return sqlSession.selectOne("admin.login", avo);
	}

}
