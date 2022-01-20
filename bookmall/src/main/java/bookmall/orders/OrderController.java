package bookmall.orders;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("/addrList.do")
	public String addrList() {
		return "orders/addrList"; 
	}
	
	// 한개 상품 구매하기
	@RequestMapping("/order1.do")
	public String order1(BookVo vo, Model model, HttpServletRequest req, UserVo uv) {
		model.addAttribute("result", orderService.bookSelect(vo));
		model.addAttribute("loginUser", orderService.userSelect(uv));
		return "orders/order1"; 
	}
	
	// 장바구니 상품 구매하기
	@RequestMapping("/order2.do")
	public String order2(CartVo vo, Model model, HttpServletRequest req, UserVo uv) {
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
	
	@RequestMapping("/orderInsert.do")
	public String order1Insert(OrderVo vo, HttpServletRequest req, BookVo bvo, CartVo cv ) {
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
		
		// main.do 로 이동 
		if(r > 0 && bli > 0) {
		req.setAttribute("msg", "정상적으로 결제되었습니다");
		req.setAttribute("url", "main.do");
		} else {
			req.setAttribute("msg", "결제 오류 ");
		}
		
		System.out.println(r);
		System.out.println(bli);
		return "orders/return";
	}
	
}
