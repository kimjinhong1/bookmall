package bookmall.admin.orders;

import java.sql.Timestamp;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class OrdersAdminVo extends CommonVo {
	
	// orders
	private int no;
	private int orderno;
	private int userno;
	private Timestamp order_date;
	private String name;
	private String status;				//결제/취소/교환/환불/반품 무통장:1, 신용카드:2
	private String methodOfPayment;		//무통장입금, 신용카드
	private String creditCard;			//카드사
	private int paid_amount;			//결제금액
	private String bookname;
	private String startDate;
	private String endDate;
	
	// refund
	private String reason;
	
}
