package bookmall.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bookmall.user.UserVo;

@Controller
public class CartController {
	@Autowired
	CartService cartService;

	//장바구니 담기
	@PostMapping("/cart/add")
	@ResponseBody //메소드에서 리턴되는 값은 View 를 통해서 출력되지 않고 HTTP Response Body 에 직접 쓰여지게 됨
	public String addCartPOST(CartDto cartdto, HttpServletRequest req) { //등록할 데이터를 전달받아야 하기 때문에 CartDto 타입의 파라미터 변수를 선언, 추가로 로그인 여부를 확인하기 위해 session 객체가 필요로 하기 때문에 HttpservletRequest 타입의 파라미터 변수선언
		//로그인체크
		HttpSession session = req.getSession();
		UserVo uvo = (UserVo)session.getAttribute("userInfo");
		if (uvo == null) {
			return "0";
		}
		
		//카트등록
		cartdto.setUserno(uvo.getUserno());
		int result = cartService.addCart(cartdto);
		return result + "";
	}

	/* 장바구니 수량 수정 */
	@PostMapping("/cart/update")
	public String updateCartPOST(Model model,CartDto cartno) {
		int r = cartService.modifyCount(cartno);
		model.addAttribute("result", r);
		return "include/result";
	}
	/*장바구니 목록*/
	@GetMapping("/cart")
	public String selectList (Model model, CartDto dto, HttpSession sess) {
		int userno = ((UserVo)sess.getAttribute("userInfo")).getUserno();
		dto.setUserno(userno);
			model.addAttribute("cartInfo", cartService.getSelectList(dto));
		return "user/cart";
	}
	
	 /*장바구니 품목삭제*/
	@PostMapping("/cart/deleteAjax.do")
	public String deleteAjax(Model model, HttpServletRequest req) {
		String[] cartno = req.getParameterValues("cartnos"); // 배열로 전송된 cartno
		
		int cnt = 0;
		for (int i=0; i<cartno.length; i++) {
			cnt += cartService.deleteCart(Integer.parseInt(cartno[i])); // 배열의 개수만큼 반복하면서 삭제
		}
		// 반복이 끝나면 cnt변수에는 삭제된 개수가 담김
		model.addAttribute("result", cnt);
		return "include/result";
	}

	
}