package bookmall.mylist;

import java.sql.Timestamp;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MylistVo extends CommonVo {
	private int listno;
	private int bookno; 
	private int userno; 
	private String btitle_first;
	private String btitle_second;
	private String author;
	private String publisher;
	private int salesprice;
	private Timestamp regdate;
	private String bthumb_org;
	private String bthumb_real;
}
