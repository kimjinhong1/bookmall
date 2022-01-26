package bookmall.orders;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bookmall.user.UserVo;


@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
		
	// test
	@RequestMapping("/test.do")
	public String test() {
		return "orders/test"; 
	}
	@RequestMapping("/test2.do")
	public String test2() {
		return "orders/test2"; 
	}
//	아임포트 test
	@RequestMapping("/test3.do")
	public String test3() {
		return "orders/test3"; 
	}
	
	@RequestMapping("/addrList.do")
	public String addrList(AddrListVo vo, Model model, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		model.addAttribute("addrlist", orderService.addrSelect(vo));
		return "orders/addrList"; 
	}
	
	
	// 한개 상품 구매하기
	@RequestMapping("/order1.do")
	public String order1(BookVo vo, Model model, HttpServletRequest req, UserVo uv, HttpSession sess) {
		uv.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());		
		model.addAttribute("result", orderService.bookSelect(vo));
		model.addAttribute("loginUser", orderService.userSelect(uv));
		return "orders/order1"; 
	}
	
	// 장바구니 상품 구매하기
	@RequestMapping("/order2.do")
	public String order2(CartVo vo, Model model, HttpServletRequest req, UserVo uv, HttpSession sess) {
		uv.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());	
		System.out.println("cartnos:"+vo.getCartnos());
		model.addAttribute("bookList", orderService.bookListSelect(vo));
		model.addAttribute("loginUser", orderService.userSelect(uv));
		return "orders/order2"; 
	}
	

	@RequestMapping("/complete.do")
	public String complete() {
		return "orders/complete"; 
	}
	@RequestMapping("/cartOrder.do")
	public String cartOrder() {
		return "orders/cartOrder"; 
	}
	
	@RequestMapping("/orderInsertAjax.do")
	public String orderInsertAjax(OrderVo vo, Model model, HttpServletRequest req, BookVo bvo, CartVo cv, AddrListVo alv, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		int r = orderService.insert(vo);
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
			CartVo cvo = new CartVo();
			cvo.setOrderno(vo.getOrderno());
			cvo.setBookno(Integer.parseInt(bookno[i]));
			cvo.setBookcount(Integer.parseInt(bookcount[i]));
			cvo.setPrice(Integer.parseInt(price[i]));
			cvo.setSalesprice(Integer.parseInt(salesprice[i]));
			cvo.setTotal_price(Integer.parseInt(bookcount[i]) * Integer.parseInt(salesprice[i]));
			bli += orderService.bookListInsert(cvo);		// 정상적으로 결제되었습니다. alert 띄우고 
		}
		if ( r > 0 && bli > 0) {  
			model.addAttribute("result", '1'); 
		} else { 
			model.addAttribute("result", '0'); 
		}
		return "orders/result";
//		if(r > 0 && bli > 0) {
//		req.setAttribute("msg", "정상적으로 결제되었습니다");
//		req.setAttribute("url", "main.do");
//		} else {
//			req.setAttribute("msg", "결제 오류 ");
//		}
//		System.out.println(r);
//		System.out.println(bli);
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
	
	@RequestMapping("/refund.do")
	public String refund() {
		return "orders/refund"; 
	}
	
	@RequestMapping("/addrInsert.do")
	public String writeInsert(AddrListVo vo,HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		return "orders/addrInsert"; 
	}
	
	
}
