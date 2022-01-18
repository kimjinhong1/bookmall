package bookmall.board.comment;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentVo {
	private int no;
	private String content;
	private Timestamp regdate;
	private String tablename;
	private String filename_real;
	private int gno;
	private int ono;
	private int nested;
	private int postno;
	private int userno;
	private String name;

}
