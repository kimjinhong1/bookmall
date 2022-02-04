package bookmall.util;

public class NLCommonVo {
	private String searchType;
	private String searchWord;
	private String searchCategory;
	private String orderCond;
	private int startIdx; //limit 시작값
	private int page; //사용자가 요청한 페이지 
	private String tablename; // table gubun
	private int numchoose;
	
	public NLCommonVo() {  //초기값 1페이지 
		page = 1;
		numchoose = 10;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchCategory() {
		return searchCategory;
	}

	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}

	public String getOrderCond() {
		return orderCond;
	}

	public void setOrderCond(String orderCond) {
		this.orderCond = orderCond;
	}

	public int getStartIdx() {
		return startIdx;
	}

	public void setStartIdx(int startIdx) {
		this.startIdx = startIdx;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public int getNumchoose() {
		return numchoose;
	}

	public void setNumchoose(int numchoose) {
		this.numchoose = numchoose;
	}
}
