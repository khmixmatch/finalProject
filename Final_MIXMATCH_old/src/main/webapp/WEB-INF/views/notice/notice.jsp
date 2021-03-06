<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>

<style type="text/css">
	#search_form{width:500px;height:50px;margin:0 auto;}
	.search{list-style:none;}
	.search li{float:left; margin:10px 10px 10px 10px;}
</style>
<div class="page-main-style">
	<h2>공지사항</h2>
	
	<div class="align-right">
		<input type="button" value="글쓰기"  onclick="location.href='noticeInsert.do'" <c:if test="${user_id != 'admin'}">disabled="disabled"</c:if>>
	</div>
	<c:if test="${count==0 }">
		<div class="align-center">등록된 공지사항이 없습니다.</div>
	</c:if>
	<c:if test="${count>0 }">
		<table>
			<tr>
				<th>번호</th>
				<th width="400">제목</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="article" items="${list}">
			<tr>
				<td>${article.gn_seq }</td>
				<td><a href="noticeDetail.do?gn_seq=${article.gn_seq}">${article.gn_title}</a></td>
				<td>${article.gn_regdate}</td>
				<td>${article.gn_hit}</td>
			</tr>
			</c:forEach>
		</table>
		<div class="align-center">${pagingHtml}</div>
	</c:if>
	<form action="notice.do" id="search_form" method="get" >
		<ul class="search">
			<li>
				<select name="keyfield">
					<option value="gn_title">제목</option>
					<option value="gn_content">내용</option>
					<option value="all">전체</option>
				</select>
			</li> 
			<li>
				<input type="text" name="keyword" id="keyword">
			</li>
			<li>
				<input type="submit" value="찾기">
			</li>
		</ul>
	</form>
</div>