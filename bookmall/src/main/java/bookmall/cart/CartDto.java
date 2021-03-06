package bookmall.cart;

public class CartDto {
	
	private int cartno;  // 장바구니 번호
	private int userno; // 회원번호
	private String cartnos;

	private int bookno; //상품번호
	private int bookcount; // 상품수량

	//order
	private int orderno;
	//order_Detail
	private int exchangeno;		//주문상태(기본값:0, 취소:1, 반품:2, 환불:3)
	
	//book
	private String btitle_first; // 책제목
	private String btitle_second;// 책부재
	private String author; // 글쓴이
	private int salesprice;  //상품가격
	
	private int discountrate; //할인금액
	private String bthumb_org;
	private String bthumb_real;
	
	// 추가
	private int totalPrice; // 총금액 (테이블에는 없는 속성)
	private int total_price; // 총금액 (테이블에는 없는 속성)
	
	
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
		
	public int getExchangeno() {
		return exchangeno;
	}

	public void setExchangeno(int exchangeno) {
		this.exchangeno = exchangeno;
	}
	
	public String getCartnos() {
		return cartnos;
	}

	public void setCartnos(String cartnos) {
		this.cartnos = cartnos;
	}

	public int getOrderno() {
		return orderno;
	}

	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}

	public int getTotal_Price() {
		return total_price;
	}
	

	public void setTotal_Price(int total_price) {
		this.total_price = total_price;
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

	public int getUserno() {
		return userno;
	}
	
	public void setUserno(int userno) {
		this.userno = userno;
	}
	
	public int getCartno() {
		return cartno;
	}

	public void setCartno(int cartno) {
		this.cartno = cartno;
	}

	public int getBookno() {
		return bookno;
	}

	public void setBookno(int bookno) {
		this.bookno = bookno;
	}

	public int getBookcount() {
		return bookcount;
	}

	public void setBookcount(int bookcount) {
		this.bookcount = bookcount;
	}

	public String getBtitle_first() {
		return btitle_first;
	}

	public void setBtitle_first(String btitle_first) {
		this.btitle_first = btitle_first;
	}

	public int getSalesprice() {
		return salesprice;
	}

	public void setSalesprice(int salesprice) {
		this.salesprice = salesprice;
	}

	public int getDiscountrate() {
		return discountrate;
	}
	
	public void setDiscountrate(int discountrate) {
		this.discountrate = discountrate;
	}

	public int getTotalPrice() {
		return totalPrice;
	}
	
	public void initSaleTotal() {  //totalPrice를 초기화해주는 메서드
		this.totalPrice = (this.salesprice-this.discountrate)*this.bookcount;
	}

	@Override
	public String toString() {
		return "CartDto [cartno=" + cartno + ", userno=" + userno+ ", bookno=" + bookno + ", bookcount=" + bookcount
				+ ", btitle_first=" + btitle_first + ", salesprice=" + salesprice + ", discountrate=" + discountrate
				+ ", totalPrice=" + totalPrice + "]";
	}



}
