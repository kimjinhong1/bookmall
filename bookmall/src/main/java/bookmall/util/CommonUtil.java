package bookmall.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import bookmall.user.UserVo;

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
	
	public static String getPageAreaReview(int bookno, int curPage, int totPage, int pageRange) {
		// 페이지범위 
		int startPage = (curPage-1)/pageRange*pageRange+1; // 시작페이지 
		int endPage = startPage + pageRange - 1; // 종료페이지 
		if (endPage > totPage) endPage = totPage;
		
		String ret="";
		ret += "  <div class=\"pagenate clear\">\r\n"
		+ "                        <ul class='paging'>\r\n";
		if (startPage >pageRange) {
			ret += "					<li><a href=\"javascript:reviewList("+bookno+","+(startPage-1)+");\"> < </a>\r\n";
		}
		for (int rp = startPage; rp <= endPage; rp++) {
		ret += "	                <li><a href='javascript:reviewList("+bookno+", "+rp+");'";
		if (rp ==curPage) ret += "class='current'";
		ret += ">"+rp+"</a></li>\r\n";
				
		}
		if (totPage > endPage) {
			ret += "     	<li><a href=\"javascript:reviewList("+bookno+","+(endPage+1)+");\"> > </a>\r\n";
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
		
		// adminMember(회원관리) paging
		// curPage : 현재 위치한 페이지, totPage : 전체 페이지 개수, pageRange: 한번에 볼수있는 최대 페이지, 10개 고정	
		public static String getPageAreaMember(String url, int curPage, int totPage, int pageRange, UserVo vo) {
			
			// 페이지범위 
			int startPage = (curPage-1)/pageRange*pageRange+1; // 시작 페이지 (가장 왼쪽 시작 번호)
			int endPage = startPage + pageRange - 1; // 끝 페이지 (가장 오른쪽, 끝 번호)
			
			// 끝 페이지가 총 페이지 개수보다 클 때, 끝 페이지를 총 페이지로 맞춤
			if (endPage > totPage) endPage = totPage;
			
			// div 태그 시작
			String ret="";
			ret += "  <div class=\"page\">\r\n";
			// 시작페이지가 10보다 클 때, ' < '  왼쪽에 추가, 11페이지에서 누르면 10페이지 이동
			if (startPage >pageRange) {
				ret += "					<a href=\""+url+"?page="+(startPage-1)+"\"> < </a>\r\n";
			}
			// 1~10 , 11~20.. 페이지번호 나열
			for (int rp = startPage; rp <= endPage; rp++) {
				if (rp ==curPage) {
					ret += "<strong>"+rp+"</strong>";
				} else {
					if(vo.getSearchWord() == null || vo.getSearchType() == null) {
						ret += "	                <a href='javascript:location.href=\""+url+"?page="+rp+"\";'";
					} else {
						ret += "	                <a href='javascript:location.href=\""+url+"?user_type="+vo.getUser_type()+"&state="+vo.getState()+"&searchType="+vo.getSearchType()+"&searchWord="+vo.getSearchWord()+"&page="+rp+"\";'";
					}
						ret += ">"+rp+"</a>\r\n";
				}
			}
			// 총 페이지가 끝 페이지보다 클 때, ' > ' 오른쪽 추가, 10페이지에서 누르면 11페이지 이동
			if (totPage > endPage) {
				ret += "     	<a href=\""+url+"?page="+(endPage+1)+"\"> > </a>\r\n";
			}
			// div 태그 종료
			ret += "                    </div>";
			return ret;
			
		}
		
		// 회원 관리의 상세 회원 구매정보 페이징
		public static String getMemberBuyPageArea(String url, int curPage, int totPage, int pageRange) {
			// 페이지범위 
			int startPage = (curPage-1)/pageRange*pageRange+1; // 시작페이지 
			int endPage = startPage + pageRange - 1; // 종료페이지 
			if (endPage > totPage) endPage = totPage;
			
			String ret="";
			ret += "  <div class=\"page\">\r\n";
			if (startPage >pageRange) {
				ret += "					<a href=\""+url+"&page="+(startPage-1)+"\"> < </a>\r\n";
			}
			for (int rp = startPage; rp <= endPage; rp++) {
			ret += "	                <a href='javascript:location.href=\""+url+"&page="+rp+"\";'";
			if (rp ==curPage) ret += "class='current'";
			ret += ">"+rp+"</a>\r\n";
					
			}
			if (totPage > endPage) {
				ret += "     	<a href=\""+url+"&page="+(endPage+1)+"\"> > </a>\r\n";
			}

			ret += "                        </ul>\r\n"
			+ "                    </div>";
			return ret;
			
		}
		
		public static String getContentNewLine(String content) {
			return content.replaceAll("\n", "<br>");
		}
		
		
		//문의하기 관리자페이지 페이징
		public static String getAskPageArea(String url, int curPage, int totPage, int pageRange) {
			// 페이지범위 
			int startPage = (curPage-1)/pageRange*pageRange+1; // 시작페이지 
			int endPage = startPage + pageRange - 1; // 종료페이지 
			if (endPage > totPage) endPage = totPage;
			
			String ret="";
			ret += "<div class=\"pagenate clear\"> \r\n" + "<ul class='paging'> \r\n";
			if (startPage >pageRange) {
				ret += "<li><a href=\""+url+"?page="+(startPage-1)+"\"> < </a>\r\n";
			}
			for (int rp = startPage; rp <= endPage; rp++) {
			ret += "<li><a href='javascript:location.href=\""+url+"?page="+rp+"\";'";
			if (rp ==curPage) ret += "class='current'";
			ret += ">"+rp+"</a></li>\r\n";
					
			}
			if (totPage > endPage) {
				ret += " <li><a href=\""+url+"?page="+(endPage+1)+"\"> > </a>\r\n";
			}

			ret += "</ul>\r\n"
			+ "</div>";
			return ret;
			
		}
		
		//문의하기 사용자페이지 페이징
		public static String getAskUserPageArea(String url, int curPage, int totPage, int pageRange) {
			// 페이지범위 
			int startPage = (curPage-1)/pageRange*pageRange+1; // 시작페이지 
			int endPage = startPage + pageRange - 1; // 종료페이지 
			if (endPage > totPage) endPage = totPage;
			
			String ret="";
			ret += "<div class=\"pagenate clear\"> \r\n" + "<ul class='paging'> \r\n";
			if (startPage >pageRange) {
				ret += "<li><a href=\""+url+"?page="+(startPage-1)+"\"> < </a>\r\n";
			}
			for (int rp = startPage; rp <= endPage; rp++) {
				ret += "<li><a href='javascript:location.href=\""+url+"?page="+rp+"\";'";
				if (rp ==curPage) ret += "class='current'";
				ret += ">"+rp+"</a></li>\r\n";
				
			}
			if (totPage > endPage) {
				ret += " <li><a href=\""+url+"?page="+(endPage+1)+"\"> > </a>\r\n";
			}
			
			ret += "</ul>\r\n"
					+ "</div>";
			return ret;
			
		}
		
}
