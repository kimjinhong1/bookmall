package bookmall.orders;

import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVo {
	//orderDesc관련 property
		private String orderno;			//주문번호
		private int userno; 			//회원번호
		
		private int totalPrice;			//주문총액
		private String paymentStatus;	//결제상태(미결제, 결제완료, 결제취소)
		private String canceledStatus;  //취소상태
		private Timestamp orderDate;	//주문날짜
		private String opayWay;			//지불방법(100:무통장 입금, 200:신용카드, 300:N Pay)
		private int approvalNumber; 	//승인번호
		
		
//		//orderProduct관련 property
//		//OrderVO have Products
//		private List<ProductVO> orderList;
//		
//		//receiver관련 property
//		//OrderVO has Receiver
//		private ReceiverVO receiver;//수령자 정보
}
