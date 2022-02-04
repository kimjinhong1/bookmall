package bookmall.refund;

import java.sql.Timestamp;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RefundVo extends CommonVo {
	private int refundno;
	private Timestamp order_date;
	private int userno;
	
	private String receiver_name;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String division;
	private String pick;
	private String reason;
	private String tel1;
	private String tel2;
	private String tel3;
	private int order_detailno;
	private Timestamp regdate;
	private int orderno;
	private String creditCard;
	private String apply_num;
	private int paid_amount;
	private int exchangeno;
	private String status;
}
