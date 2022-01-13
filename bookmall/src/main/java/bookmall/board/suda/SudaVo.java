package bookmall.board.suda;

import java.sql.Timestamp;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SudaVo extends CommonVo {
	private int no;
	private String title;
	private String content;
	private Timestamp regdate;
	private String filename_org;
	private String filename_real;
	private int top_notice;
	private int new_icon;
	private int secret;
	private int gno;
	private int ono;
	private int nested;
	private int category;
	private int userno;
	private int readcount;
	private String sendDate;
	private int mode;
}
