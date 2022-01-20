package bookmall.orders;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookVo {

	private int bookno;				//도서번호
	private String isbn;			//isbn
	private String btitle_first;	//도서명_대제목
	private String btitle_second;	//도서명_소제목
	private String author;			//저자
	private String publisher;		//출판사
	private String pubdate;			//출간일
	private int price;				//가격
	private int discountrate;		//할인율
	private int classify;			//도서분류(국내/국외)
	private String translator;		//번역가
	private int bpages;				//페이지수
	private int bweight;			//무게
	private int bwidth;				//크기_가로
	private int bvertical;			//크기_세로
	private int bheight;			//크기_높이
	private String bintroduce;		//도서_소개
	private String bindex;			//도서_목차
	private String bthumb_org;		//도서_썸네일(원본)
	private String bthumb_real;		//도서_썸네일(실제)
	private int bstack;				//재고
	private Timestamp regdate;		//등록일
	private Timestamp moddate;		//수정일
	private int salesprice;			//판매가
	private int bstatus;			//도서상태(노출/비노출)
	private String auto_first;		//자동완성_대재목
	private String auto_second;		//자동완성_소재목
	private String auto_author;		//자동완성_저자
	private String auto_publisher;	//자동완성_출판사
	
	
}
