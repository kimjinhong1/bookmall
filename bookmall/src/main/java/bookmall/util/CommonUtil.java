package bookmall.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CommonUtil {

	public static String getPageArea(String url, int curPage, int totPage, int pageRange) {
		// 페이지범위 
		int startPage = (curPage-1)/pageRange*pageRange+1; // 시작페이지 
		int endPage = startPage + pageRange - 1; // 종료페이지 
		if (endPage > totPage) endPage = totPage;
		
		String ret="";
		ret += "  <div class=\"pagenate clear\">\r\n"
		+ "                        <ul class='paging'>\r\n";
		if (startPage >pageRange) {
			ret += "					<li><a href=\""+url+"?page="+(startPage-1)+"\"> < </a>\r\n";
		}
		for (int rp = startPage; rp <= endPage; rp++) {
		ret += "	                <li><a href='javascript:location.href=\""+url+"?page="+rp+"\";'";
		if (rp ==curPage) ret += "class='current'";
		ret += ">"+rp+"</a></li>\r\n";
				
		}
		if (totPage > endPage) {
			ret += "     	<li><a href=\""+url+"?page="+(endPage+1)+"\"> > </a>\r\n";
		}

		ret += "                        </ul>\r\n"
		+ "                    </div>";
		return ret;
		
	}
	// admin paging
		public static String getPageAreaAdmin(String url, int curPage, int totPage, int pageRange) {
			// 페이지범위 
			int startPage = (curPage-1)/pageRange*pageRange+1; // 시작페이지 (화면 아래쪽에 출력되는 첫번재번호)
			int endPage = startPage + pageRange - 1; // 종료페이지 (화면 아래쪽에 출력되는 마지막 번호)
			if (endPage > totPage) endPage = totPage;
			
			String ret="";
			ret += "  <div class=\"page\">\r\n";
			if (startPage >pageRange) {
				ret += "					<a href=\""+url+"?page="+(startPage-1)+"\"> < </a>\r\n";
			}
			for (int rp = startPage; rp <= endPage; rp++) {
				if (rp ==curPage) {
					ret += "<strong>"+rp+"</strong>";
				} else {
					ret += "	                <a href='javascript:location.href=\""+url+"?page="+rp+"\";'";
					ret += ">"+rp+"</a>\r\n";
				}
			}
			if (totPage > endPage) {
				ret += "     	<a href=\""+url+"?page="+(endPage+1)+"\"> > </a>\r\n";
			}
			ret += "                    </div>";
			return ret;
			
		}
		
		public static String getNewIcon(Timestamp regdate, int new_icon) throws Exception {
			Calendar getToday = Calendar.getInstance(); 
			getToday.setTime(new Date()); 
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
			String s_date = sdf.format(regdate); 
			
			Date date = new SimpleDateFormat("yyyy-MM-dd").parse(s_date); 
			Calendar cmpDate = Calendar.getInstance();
			cmpDate.setTime(date); 
			
			
			long diffSec = (getToday.getTimeInMillis() - cmpDate.getTimeInMillis()) / 1000;
			long diffDays = diffSec / (24*60*60); 
			System.out.println("diffDays:"+diffDays);
			String newicon = "<img src='/bookmall/img/new_icon.png' style='width:15px;'>";  
			
			if (new_icon == 2) { 
				if (diffDays > 7 ) newicon = ""; 
			} else if (new_icon == 3) { 
				newicon = ""; 
			}
			System.out.println(newicon);
			return newicon; 
		}
}
