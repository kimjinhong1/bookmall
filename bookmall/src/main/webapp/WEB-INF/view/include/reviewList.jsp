<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bookmall.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
					<table class="list">
                        <colgroup>
                            <col width="80px" />
                            <col width="100px" />
                            <col width="*" />
                            <col width="100px" />
                            <col width="130px" />
                        </colgroup>
                        <tbody>
						<c:if test="${empty list }">
                            <tr>
                                <td class="first" colspan="5">등록된 글이 없습니다.</td>
                            </tr>
						</c:if>
                        <c:if test="${!empty list }">
                        	<c:forEach var="vo" items="${list }">            
                            <tr>
                                <td>${vo.no }</td>
                                <td>
                                	<c:forEach begin="1" end="${vo.score }"><img src="/bookmall/img/score_icon.jpeg" style='width:10px;'></c:forEach>
	                             </td>
                                <td class="txt_l" style="text-align:left;">
                                    ${CommonUtil.getContentNewLine(vo.content)}
                                    <c:if test="${!empty userInfo}"></c:if>
                                    <c:if test="${vo.userno == userInfo.userno }">
                                    <a href="javascript:showTr(${vo.no });">[수정]</a>  
                                    <a href="javascript:goDelete(${vo.no });">[삭제]</a>
                                    </c:if>
                                </td>
                                <td class="writer">
                                   	${vo.name }
                                </td>
                                <td class="date">
                                	<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd" />
                                </td>
                             <tr class="replyTr" id="tr${vo.no }" style="display:none;">
                                <td colspan="4" style="color:#000000;text-align:left;">
                                <form id="frm${vo.no}">
                                	<input type="hidden" name="no" value="${vo.no }">
                                	<input type="hidden" name="bookno" value="${vo.bookno }">
                                	<input type="hidden" name="userno" value="${vo.userno }">
                                	<input type="radio" name="score" value="5" <c:if test="${vo.score == 5 }">checked</c:if>>5점️&nbsp;&nbsp;
                                	<input type="radio" name="score" value="4" <c:if test="${vo.score == 4 }">checked</c:if>>4점&nbsp;&nbsp;
                                	<input type="radio" name="score" value="3" <c:if test="${vo.score == 3 }">checked</c:if>>3점&nbsp;&nbsp; 
                                	<input type="radio" name="score" value="2" <c:if test="${vo.score == 2 }">checked</c:if>>2점&nbsp;&nbsp; 
                                	<input type="radio" name="score" value="1" <c:if test="${vo.score == 1 }">checked</c:if>>1점&nbsp;&nbsp; 
                                    <textarea name="content" id="content" style="height:50px; width:100%;">${vo.content }</textarea> <!-- 서버로 전송 댓글내-->
                                </form>
                                </td>
                                <td>
                                    <div class="btnSet"  style="text-align:right;">
                                        <a class="btn2" href="javascript:goReply(${vo.no });">수정</a>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                      ${pageArea } 