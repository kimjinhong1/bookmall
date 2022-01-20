package bookmall.orders;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AddrList {
	
	private int addrno;			// 주소록 번호
	private int userno;			 
	private String zipcode;		// 우편번호
	private String addr1;		// 주소 
	private String addr2;		// 상세주소
}
