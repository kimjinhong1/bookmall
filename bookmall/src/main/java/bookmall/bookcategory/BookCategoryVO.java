package bookmall.bookcategory;

public class BookCategoryVO {
	
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
	
	
}
