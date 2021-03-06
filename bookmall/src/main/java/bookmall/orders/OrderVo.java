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
		private String zipcode;			//우편번호
		private String addr1;			//주소
		private String addr2;			//상세주소
		private String receiver_phone;
		
		
		private String methodOfPayment;	//결제수단 pay_method
		private String bankToDeposit; 	//무통장_은행
		private String nameOfDepositor;	//무통장_입금자명
		private String creditCard;		//신용카드_카드사 card_name
		
		private String apply_num;		//승인번호
		private String status;  		//결제/취소/교환/환불/반품 
		private String imp_uid;			//고유Id
		private int paid_amount; 		//결제금액
		private String bookname;		//주문상품이름(대표 1권)

		
		
		//DB 없는 상품
		private int salesprice; 		//판매가
		private int totalPrice;         //총합 
		private int bookcount;			//주문수량
		private int total_price; 
		private int no;
		
		
}
