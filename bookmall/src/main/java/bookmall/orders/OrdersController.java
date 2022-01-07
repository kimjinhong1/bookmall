package bookmall.orders;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class OrdersController {
		
	@GetMapping("/order1.do")
	public String order1() {
		return "orders/order1"; 
	}
	@GetMapping("/order2.do")
	public String order2() {
		return "orders/order2"; 
	}
	
}
