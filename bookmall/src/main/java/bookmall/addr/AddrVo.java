package bookmall.addr;


import java.sql.Timestamp;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AddrVo extends CommonVo {
	private int addno;
	private String division;
	private int userno; 
	private String name;
	private int zipcode;
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	private String address;
	private String address2;
	private Timestamp regdate;
	
}
