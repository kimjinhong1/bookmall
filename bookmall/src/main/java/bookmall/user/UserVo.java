package bookmall.user;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVo extends CommonVo {
	
	private int userno;
	private String email;
	private String pwd;
	private String pwd_question = "질문";
	private String pwd_answer = "대답";
	private String nickname;
	private String name;
	private String birthday;
	private String tel;
	private int gender;
	private Timestamp regdate;
	private Timestamp moddate;
	private Timestamp recently_accessed;
	private int user_type = 1;
	private int state = 1;
	private String identifier = null;
	private String zipcode;
	private String addr1;
	private String addr2;
	
	public String getRegdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.regdate);
	}
	
	public String getModdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.moddate);
	}
	
	public String getRecently_accessed() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.recently_accessed);
	}

}
