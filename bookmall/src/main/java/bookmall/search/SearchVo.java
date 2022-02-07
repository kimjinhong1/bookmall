package bookmall.search;

import java.sql.Timestamp;

import bookmall.util.CommonVo;
import lombok.Getter;
import lombok.Setter;

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

	
	public int getBcategoryno() {
		return bcategoryno;
	}

	public void setBcategoryno(int bcategoryno) {
		this.bcategoryno = bcategoryno;
	}

	public int getBparentno() {
		return bparentno;
	}

	public void setBparentno(int bparentno) {
		this.bparentno = bparentno;
	}

	public int[] getBcategorynoS() {
		return bcategorynoS;
	}

	public void setBcategorynoS(int[] bcategorynoS) {
		this.bcategorynoS = bcategorynoS;
	}

	public int[] getBparentnoS() {
		return bparentnoS;
	}

	public void setBparentnoS(int[] bparentnoS) {
		this.bparentnoS = bparentnoS;
	}

	public int getBlevel() {
		return blevel;
	}

	public void setBlevel(int blevel) {
		this.blevel = blevel;
	}

	public String getBcategoryname() {
		return bcategoryname;
	}

	public void setBcategoryname(String bcategoryname) {
		this.bcategoryname = bcategoryname;
	}

	public int getBclassify() {
		return bclassify;
	}

	public void setBclassify(int bclassify) {
		this.bclassify = bclassify;
	}

	public int getKorea() {
		return korea;
	}

	public void setKorea(int korea) {
		this.korea = korea;
	}

	public int getForeign() {
		return foreign;
	}

	public void setForeign(int foreign) {
		this.foreign = foreign;
	}

	public int getBookno() {
		return bookno;
	}

	public void setBookno(int bookno) {
		this.bookno = bookno;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getBtitle_first() {
		return btitle_first;
	}

	public void setBtitle_first(String btitle_first) {
		this.btitle_first = btitle_first;
	}

	public String getBtitle_second() {
		return btitle_second;
	}

	public void setBtitle_second(String btitle_second) {
		this.btitle_second = btitle_second;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPubdate() {
		return pubdate;
	}

	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscountrate() {
		return discountrate;
	}

	public void setDiscountrate(int discountrate) {
		this.discountrate = discountrate;
	}

	public int getClassify() {
		return classify;
	}

	public void setClassify(int classify) {
		this.classify = classify;
	}

	public String getTranslator() {
		return translator;
	}

	public void setTranslator(String translator) {
		this.translator = translator;
	}

	public int getBpages() {
		return bpages;
	}

	public void setBpages(int bpages) {
		this.bpages = bpages;
	}

	public int getBweight() {
		return bweight;
	}

	public void setBweight(int bweight) {
		this.bweight = bweight;
	}

	public int getBwidth() {
		return bwidth;
	}

	public void setBwidth(int bwidth) {
		this.bwidth = bwidth;
	}

	public int getBvertical() {
		return bvertical;
	}

	public void setBvertical(int bvertical) {
		this.bvertical = bvertical;
	}

	public int getBheight() {
		return bheight;
	}

	public void setBheight(int bheight) {
		this.bheight = bheight;
	}

	public String getBintroduce() {
		return bintroduce;
	}

	public void setBintroduce(String bintroduce) {
		this.bintroduce = bintroduce;
	}

	public String getBindex() {
		return bindex;
	}

	public void setBindex(String bindex) {
		this.bindex = bindex;
	}

	public String getBthumb_org() {
		return bthumb_org;
	}

	public void setBthumb_org(String bthumb_org) {
		this.bthumb_org = bthumb_org;
	}

	public String getBthumb_real() {
		return bthumb_real;
	}

	public void setBthumb_real(String bthumb_real) {
		this.bthumb_real = bthumb_real;
	}

	public int getBstack() {
		return bstack;
	}

	public void setBstack(int bstack) {
		this.bstack = bstack;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Timestamp getModdate() {
		return moddate;
	}

	public void setModdate(Timestamp moddate) {
		this.moddate = moddate;
	}

	public int getSalesprice() {
		return salesprice;
	}

	public void setSalesprice(int salesprice) {
		this.salesprice = salesprice;
	}

	public int getBstatus() {
		return bstatus;
	}

	public void setBstatus(int bstatus) {
		this.bstatus = bstatus;
	}

	public String getAuto_first() {
		return auto_first;
	}

	public void setAuto_first(String auto_first) {
		this.auto_first = auto_first;
	}

	public String getAuto_second() {
		return auto_second;
	}

	public void setAuto_second(String auto_second) {
		this.auto_second = auto_second;
	}

	public String getAuto_author() {
		return auto_author;
	}

	public void setAuto_author(String auto_author) {
		this.auto_author = auto_author;
	}

	public String getAuto_publisher() {
		return auto_publisher;
	}

	public void setAuto_publisher(String auto_publisher) {
		this.auto_publisher = auto_publisher;
	}

	public int getTotCount() {
		return totCount;
	}

	public void setTotCount(int totCount) {
		this.totCount = totCount;
	}

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
