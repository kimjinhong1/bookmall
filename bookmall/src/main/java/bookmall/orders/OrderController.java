package bookmall.orders;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bookmall.cart.CartDto;
import bookmall.cart.CartService;
import bookmall.user.UserVo;


@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	CartService cartService;
		
	// test
	@RequestMapping("/test.do")
	public String test() {
		return "orders/test"; 
	}
	@RequestMapping("/test2.do")
	public String test2() {
		return "orders/test2"; 
	}
	
	@RequestMapping("/complete.do")
	public String orderSelect(OrderVo vo, Model model, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		model.addAttribute("order", orderService.orderSelect(vo));
		return "orders/complete"; 
	}
	
	@RequestMapping("/addrList.do")
	public String addrList(AddrListVo vo, Model model, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		model.addAttribute("addrlist", orderService.addrSelect(vo));
		return "orders/addrList"; 
	}
	
	
	// 한개 상품 구매하기
	@RequestMapping("/order1.do")
	public String order1(BookVo bv, Model model, HttpServletRequest req, UserVo vo, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());	  	
		model.addAttribute("result", orderService.bookSelect(bv));
		model.addAttribute("loginUser", orderService.userSelect(vo));
		return "orders/order1"; 
	}
	
	// 장바구니 상품 구매하기
	@RequestMapping("/order2.do")
	public String order2(CartDto cv, Model model, HttpServletRequest req, UserVo vo, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());	
		System.out.println("cartno:"+cv.getCartno());
		model.addAttribute("bookList", orderService.bookListSelect(cv));
		model.addAttribute("loginUser", orderService.userSelect(vo));
		
//		String[] bookList = req.getParameterValues("btitle_first"); // 배열로 전송된 cartno
//		 
//		
//		for (int i=0; i<btitle_first.length; i++) {
//			cnt += orderService.bookSelect(Integer.parseInt(btitle_first[1])); // 배열의 개수만큼 반복하면서 삭제
//		}
//		// 반복이 끝나면 cnt변수에는 삭제된 개수가 담김
//		model.addAttribute("result", cnt);
		
		
		return "orders/order2"; 
	}
	

	@RequestMapping("/cartOrder.do")
	public String cartOrder() {
		return "orders/cartOrder"; 
	}
	
	@RequestMapping("/orderInsertAjax.do")
	public String orderInsertAjax(OrderVo vo, Model model, HttpServletRequest req, BookVo bvo, CartDto dto, AddrListVo alv, HttpSession sess, int paid_amount, String paymentStatus) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		int r = orderService.insert(vo);
		vo.setPaid_amount(paid_amount);
		vo.setPaymentStatus(paymentStatus);
		int bli = 0;
		
		String[] bookno = req.getParameterValues("bookno");
//		System.out.println(bookno[0]);
//		System.out.println(bookno[1]);
		String[] bookcount = req.getParameterValues("bookcount");
		String[] price = req.getParameterValues("price");
		String[] salesprice = req.getParameterValues("salesprice");
		System.out.println("bookno:"+bookno.length);
		System.out.println("bookcount:"+bookcount.length);
		System.out.println("price:"+price.length);
		System.out.println("salesprice:"+salesprice.length);
//		CartVo cvo;
		for (int i=0; i<bookno.length; i++) {
			CartDto cdto = new CartDto();
			cdto.setOrderno(vo.getOrderno());
			cdto.setBookno(Integer.parseInt(bookno[i]));
			cdto.setBookcount(Integer.parseInt(bookcount[i]));
			cdto.setSalesprice(Integer.parseInt(salesprice[i]));
			cdto.setTotal_Price(Integer.parseInt(bookcount[i]) * Integer.parseInt(salesprice[i]));
			bli += orderService.bookListInsert(cdto);		// 정상적으로 결제되었습니다. alert 띄우고 
		}
		if ( r > 0 && bli > 0) {  
			model.addAttribute("result", vo.getOrderno()); 
		} else { 
			model.addAttribute("result", '0'); 
		}
		return "orders/result";
	}
	
//	주소록 등록
	@RequestMapping("/writeInsert.do")
	public String addrInsert(AddrListVo vo, HttpServletRequest req, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());	
//		vo.setUserno(1);  
		int r = orderService.addrInsert(vo);
		if(r > 0 ) {
		req.setAttribute("msg", "정상적으로 등록되었습니다");
		req.setAttribute("url", "addrList.do");
		} else {
			req.setAttribute("msg", "등록 오류 ");
		}
		
		System.out.println(r);
		return "orders/return";
	
	}
	@RequestMapping("/exchange.do")
	public String exchange() {
		return "orders/exchange"; 
	}

	
	@RequestMapping("/addrInsert.do")
	public String writeInsert(AddrListVo vo,HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		return "orders/addrInsert"; 
	}
	
//	public void deleteOrderCart() {
//		int userno = 1;
//		int bookno = 1;
//		
//		CartVo vo = new CartVo();
//		vo.setUserno(userno);
//		vo.setBookno(bookno);
//		
//		.deleteOrderCart(vo);
//		
//	}
	
}
