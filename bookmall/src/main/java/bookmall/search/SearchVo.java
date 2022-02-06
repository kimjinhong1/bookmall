package bookmall.search;

import java.sql.Timestamp;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchVo extends CommonVo {
	
	// Book category 
	private int bcategoryno;
	private int bparentno;
	private int[] bcategorynoS;
	private int[] bparentnoS;
	private int blevel;
	private String bcategoryname;
	private int bclassify;
	// 국내,외국도서
	private int korea = 0;
	private int foreign = 1;
	// Book
	private int bookno;
	private String isbn;
	private String btitle_first;
	private String btitle_second;
	private String author;
	private String publisher;
	private String pubdate;
	private int price;
	private int discountrate;
	private int classify;
	private String translator;
	private int bpages;
	private int bweight;
	private int bwidth;
	private int bvertical;
	private int bheight;
	private String bintroduce;
	private String bindex;
	private String bthumb_org;
	private String bthumb_real;
	private int bstack;
	private Timestamp regdate;
	private Timestamp moddate;
	private int salesprice;
	private int bstatus;
	private String auto_first;
	private String auto_second;
	private String auto_author;
	private String auto_publisher;
	
	// 페이징
	private int totCount;
	
}