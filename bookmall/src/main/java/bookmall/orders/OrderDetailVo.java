package bookmall.orders;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDetailVo {

	private int order_detailno;
	private int orderno;
	private int bookno; 
	private int bookcount; 
	private int price; 
	private int salesprice;
	
	// 만들어 낼 값
	private int total_price; 
	private int exchangeno;
	
	
	public void total_price() {
		this.total_price = this.price*this.bookcount;
		
	}
}
  