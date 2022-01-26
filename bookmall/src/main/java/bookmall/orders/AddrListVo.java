package bookmall.orders;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AddrListVo {
	
	private int addrno;			// 주소록 번호
	private int userno;	
	private String division;	// 이름/별칭
	private String zipcode;		// 우편번호
	private String address;		// 주소 
	private String address2;	// 상세주소
	private String addrnos;
}
