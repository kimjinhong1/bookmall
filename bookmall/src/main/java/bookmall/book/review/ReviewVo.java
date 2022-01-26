package bookmall.book.review;

import java.sql.Timestamp;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVo extends CommonVo{
	private int no;
	private String content;
	private Timestamp regdate;
	private int score;
	private int userno;
	private int bookno;
	private String name;
	private String btitle;
}
