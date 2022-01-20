package bookmall.orders;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVo {

	private int cartno;
	private int bookcount;
	private String product;
	private int price;
	private int userno;
	private int bookno;
	private String cartnos;
	
	// bookVo 조인
	private String btitle_first;
	private int discountrate;
	private int salesprice;

	
	private int total_price;         //총합 
	private int orderno;
	
	public void initSaleTotal() {
		this.total_price = this.salesprice*this.bookcount;
	}
}
