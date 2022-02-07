package bookmall.book;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import bookmall.util.NLCommonVo;

public class BookVo extends NLCommonVo {

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
	private String categoryArrStr;
	private int bookcount;
	
	public int getBookcount() {
		return bookcount;
	}

	public void setBookcount(int bookcount) {
		this.bookcount = bookcount;
	}

	
	public String getCategoryArrStr() {
		return categoryArrStr;
	}

	public void setCategoryArrStr(String categoryArrStr) {
		this.categoryArrStr = categoryArrStr;
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

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public void setModdate(Timestamp moddate) {
		this.moddate = moddate;
	}

	public String getRegdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.regdate);
	}
	
	public String getModdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.moddate);
	}
	
	// 카테고리 정보
	private int bcategoryno;
	private int bparentno;
	private int blevel;
	private String bcategoryname;
	private int bclassify;
	
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
	
	// 카테고리 정보
	private int blev1;
	private int blev2;
	private String blev1name;
	private String blev2name;

	public int getBlev1() {
		return blev1;
	}

	public void setBlev1(int blev1) {
		this.blev1 = blev1;
	}

	public int getBlev2() {
		return blev2;
	}

	public void setBlev2(int blev2) {
		this.blev2 = blev2;
	}

	public String getBlev1name() {
		return blev1name;
	}

	public void setBlev1name(String blev1name) {
		this.blev1name = blev1name;
	}

	public String getBlev2name() {
		return blev2name;
	}

	public void setBlev2name(String blev2name) {
		this.blev2name = blev2name;
	}

	// 도서 목록 정렬
	private String listOrder;
	
	public String getListOrder() {
		return listOrder;
	}

	public void setListOrder(String listOrder) {
		this.listOrder = listOrder;
	}
	
	// 도서 리뷰 정보
	private double review_score;
	private int review_count;


	public double getReview_score() {
		return review_score;
	}

	public void setReview_score(double review_score) {
		this.review_score = review_score;
	}

	public int getReview_count() {
		return review_count;
	}

	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	
	// 도서 판매량 체크
	private int sales;


	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}
	
	
	
}
