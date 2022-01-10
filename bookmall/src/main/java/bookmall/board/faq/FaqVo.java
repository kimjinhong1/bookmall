package bookmall.board.faq;

import java.sql.Timestamp;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FaqVo extends CommonVo{

	private int no;
	private String title;
	private String content;
	private Timestamp regdate;
	private int categoryno;
	private String filename_org;
	private String filename_real;
	private String sendDate;
	private String categoryname;
}
