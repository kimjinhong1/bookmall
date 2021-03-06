<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bookmall.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
					<table class="list">
                        <colgroup>
                            <col width="80px" />
                            <col width="*" />
                            <col width="100px" />
                            <col width="130px" />
                        </colgroup>
                        <tbody>
						<c:if test="${empty cList }">
                            <tr>
                                <td class="first" colspan="4">등록된 글이 없습니다.</td>
                            </tr>
						</c:if>
                        <c:if test="${!empty cList }">
                        	<c:forEach var="vo" items="${cList }">            
                            <tr>
                                <td>${vo.no }</td>
                                <td class="txt_l" style="text-align:left;">
                                
                                
                                 <c:if test="${vo.nested > 0 }">
                                 	<c:forEach begin="1" end="${vo.nested}">&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
                                	<img src="/bookmall/img/answer_icon3.png" style='width:15px;'>
                                </c:if>
                                
                                    ${CommonUtil.getContentNewLine(vo.content)}
                                    <c:if test="${!empty userInfo}">
                                    <a href="javascript:showTr(${vo.no });">[답변]</a>
                                    </c:if>
                                    <c:if test="${vo.userno == userInfo.userno }">
                                    <a href="javascript:goDel(${vo.no });">[삭제]</a>
                                    </c:if>
                                </td>
                                <td class="writer">
                                	<c:if test="${vo.userno == 0}">관리자</c:if>
                                   	${vo.name }
                                </td>
                                <td class="date"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd" /></td>
                            </tr>
                            <tr class="replyTr" id="tr${vo.no }" style="display:none;">
                                <td colspan="3">
                                <form id="frm${vo.no}">
                                	<input type="hidden" name="tablename" value="board">
                                	<input type="hidden" name="postno" value="${vo.postno}">
                                	<input type="hidden" name="gno" value="${vo.gno}">
                                	<input type="hidden" name="ono" value="${vo.ono }">
                                	<input type="hidden" name="nested" value="${vo.nested }">
                                	<input type="hidden" name="userno" value="${userInfo.userno}">
                                    <textarea name="content" id="content" placeholder="주제와 무관한 댓글, 악플 등의 글은 임의 삭제될 수 있습니다." style="height:50px;width:100%;" ></textarea> <!-- 서버로 전송 댓글내-->
                                </form>
                                </td>
                                <td>
                                    <div class="btnSet"  style="text-align:right;">
                                        <a class="btn2" href="javascript:goReply(${vo.no });">저장 </a>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
                        </c:if>
                        </tbody>
                    </table>