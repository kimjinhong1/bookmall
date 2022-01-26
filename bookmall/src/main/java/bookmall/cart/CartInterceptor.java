package bookmall.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import bookmall.user.UserVo;

public class CartInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		UserVo uvo = (UserVo)session.getAttribute("userno");  //로그인 시 sesseion에 userno로 로그인 사용자 정보 데이터를 저장, session의 "userno"를 불러들여서 데이터 있는지 없는지를 통해 로그인 여부를 판단
		
		if(uvo == null) {
			response.sendRedirect("/main.do");
			return false;
		} else {
			return true;
		}
	}

}
