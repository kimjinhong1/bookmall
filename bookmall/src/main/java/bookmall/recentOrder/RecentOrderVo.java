package bookmall.recentOrder;

import java.sql.Timestamp;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RecentOrderVo extends CommonVo {
	private int orderno;
	private int bookno; 
	private int userno; 
	private String receiver_name;
	private String receiver_phone;
	private String btitle_first;
	private String btitle_second;
	private String author;
	private String publisher;
	private int salesprice;
	private Timestamp order_date;
	private int paid_amount;
	private String zipcode;
	private String addr1;
	private String addr2;
	

}
