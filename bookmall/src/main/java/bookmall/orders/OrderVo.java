package bookmall.orders;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVo {
		private int orderno;			//주문번호
		private int userno; 			//회원번호
		private Timestamp order_date;	//주문날짜
		private int delivery;			//배송방법
		private String name; 			//회원명
		private String receiver_name;	//수령자이름
		private String zipcode;		//우편번호
		private String addr1;		//주소
		private String addr2;		//상세주소
		private String receiver_phone;
		
		
		private String methodOfPayment;	//결제수단
		private String bankToDeposit; 	//무통장_은행
		private String nameOfDepositor;	//무통장_입금자명
		private String creditCard;		//신용카드_카드사
		
		private int approvalNumber;		//승인번호
		private int paymentStatus;		//결제상태
		private String canceledStatus;  //취소상태
		
		//DB에는 없다.
		private int salesprice; 		//판매가
		private int totalPrice;         //총합 
		private int bookCount;			//주문수량
		
		
		public void initSaleTotal() {
			this.totalPrice = this.salesprice*this.bookCount;
		}
		
		
}
