package bookmall.user;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVo extends CommonVo {
	//회원
	private int userno;
	private String email;
	private String pwd;
	private String pwd_question = "질문";
	private String pwd_answer = "대답";
	private String nickname;
	private String name;
	private String birthday;
	private String tel;
	private int gender;
	private Timestamp regdate;
	private Timestamp moddate;
	private Timestamp recently_accessed;
	private int user_type;
	private int state;
	private String identifier = null;
	private String zipcode;
	private String addr1;
	private String addr2;
	private int checkNumber;
	// 주문
	private String orderno;			//주문번호
	private int totalPrice;			//주문총액
	private String paymentStatus;	//결제상태(미결제, 결제완료, 결제취소)
	private String canceledStatus;  //취소상태
	private Timestamp order_date;	//주문날짜
	private int methodOfPayment;    //결제방법
	
	private int member_buy_count; // 회원 총 구매 상품 수
	private int member_buy_price; // 회원 총 구매 금액
	// 주문디테일
	private int order_detailno;
    private int count; 
    private int price; 
    private int o_d_count; // 주문 디테일 개수
    private int total_price; // 주문 디테일 총 가격
    
    private int exchangeno;
	// 도서
    private int bookno;
	private String isbn;
	private String btitle_first;
	private String btitle_second;
	private String btitle;
	
	public String getBtitle() {
		btitle = btitle_first + btitle_second;
		return btitle;
	}
    
	public String getRegdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.regdate);
	}
	
	public String getModdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.moddate);
	}
	
	public String getRecently_accessed() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.recently_accessed);
	}

}
