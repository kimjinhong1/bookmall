package bookmall.orders;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class OrdersController {
		
	@RequestMapping("/order1.do")
	public String order1() {
		return "orders/order1"; 
	}
	@RequestMapping("/order2.do")
	public String order2() {
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
	
}
