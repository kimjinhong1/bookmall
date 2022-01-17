package bookmall.board.notice;

import java.sql.Timestamp;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVo extends CommonVo {
	private int no;
	private String title;
	private Timestamp regdate;
	private int readcount;
	private String content;
	private String filename_org;
	private String filename_real;
	private String sendDate;
	private int mode;
	
}
