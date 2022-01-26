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
	private String author;
	private String publisher;
	private Timestamp regdate;
	
}
