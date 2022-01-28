package bookmall.util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommonVo {
	private String searchType;
	private String searchWord;
	private String searchCategory;
	private String orderCond;
	private int startIdx; //limit 시작값
	private int page; //사용자가 요청한 페이지 
	private String tablename; // table gubun
	private int numchoose;
	private int pageRow;
	
	public CommonVo() {  //초기값 1페이지 
		page = 1;
		numchoose = 10;
	}
}
