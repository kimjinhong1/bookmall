package bookmall.ask;

import java.sql.Timestamp;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AskVo extends CommonVo {
	private int askno;
	private String subject;
	private String title;
	private String content;
	private Timestamp regdate;
	private String filename_org;
	private String filename_real;
	private int userno;
	private int gno;
	private int ono;
	private int nested;
	private String status;
	private String name;
	private int adminno;
	private String answer;
	
}
