package bookmall.cart;

public class CartDto {
	
	private int cartno;  // 장바구니 번호
	private int userno; // 회원번호

	private int bookno; 
	private int bookcount; // 상품수량
	
	//book
	private String btitle_first; // 책제목
	private int price;  //상품가격
	private int discountrate; //할인금액
	

	// 추가
	private int totalPrice; // 총금액 (테이블에는 없는 속성)

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

	public int getTotalPrice() {
		return totalPrice;
	}
	
	public void initSaleTotal() {  //totalPrice를 초기화해주는 메서드
		this.totalPrice = (this.price-this.discountrate)*this.bookcount;
	}

	@Override
	public String toString() {
		return "CartDto [cartno=" + cartno + ", userno=" + userno+ ", bookno=" + bookno + ", bookcount=" + bookcount
				+ ", btitle_first=" + btitle_first + ", price=" + price + ", discountrate=" + discountrate
				+ ", totalPrice=" + totalPrice + "]";
	}



}
