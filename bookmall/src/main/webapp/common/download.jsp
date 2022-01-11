<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.net.*"%>
<%@ page import ="java.io.*"%>
<%
// 3개의 파라미터(경로, 사용자가첨부한파일명, 서버에저장된파일명)
String path = request.getParameter("path");  // 경로 
String org = URLEncoder.encode(request.getParameter("org"),"UTF-8"); // 사용자가첨부한파일명
String real = request.getParameter("real"); // 서버에저장된파일명
// 실제경로 (/upload/1234/jpg)
String realpath = request.getRealPath(path+real);

try {
	// 파일객체 생성 
	File f = new File(realpath);
	// 입력객체 (서버)
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
	// 출력객체 (브라우저)
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	// 초기화 
	response.reset();
	// 브라우저 헤더 설정
	response.setHeader("Content-Type","application/octet-stream");
	response.setHeader("Content-Disposition","attachment;filename="+org);
	response.setHeader("Content-Transfer-Encoding","binary");
	response.setHeader("Content-Length",f.length()+"");
	
	//스트림 출력 
	byte[] b = new byte[1024];
	for (int i=0; (i = bis.read(b)) != -1;) {
		bos.write(b,0,i);
		bos.flush();
	}
	//자원해제
	bos.close();
	bis.close();
	
	
} catch (Exception e) {
	System.out.println(e.getMessage());
}

%>