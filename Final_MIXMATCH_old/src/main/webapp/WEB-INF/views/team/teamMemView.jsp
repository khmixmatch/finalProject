<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="page-main-style">
	팀원관리 <br>
	팀명: <% out.print(request.getParameter("t_name")); %>
	<hr>
	소속 팀원 :
	<table>
		<tr>
			<th>프로필</th>
			<th>이름</th>
			<th>팀가입일</th>
			<th>팀원여부</th>
		</tr>
	<c:forEach var="list" items="${tMemList}">
		<tr>
			<td>
				<c:if test="${fn:endsWith(list.profile_name, '.jpg') || fn:endsWith(list.profile_name, '.png') || fn:endsWith(list.profile_name, '.gif') || fn:endsWith(list.profile_name, '.JPG') || fn:endsWith(list.profile_name, '.PNG') || fn:endsWith(list.profile_name, '.GIF')}">
					<img src="imageView.do?id=${list.id}" style="width:100px;height:100px;">
				</c:if> 
			</td>
			<td>${list.name}</td>
			<td>${list.t_mem_regdate}</td>
			<td>
				<c:if test="${list.t_mem_auth==1}">
					팀원
				</c:if>
				<c:if test="${list.t_mem_auth==0}">
					미승인 회원
				</c:if>
			</td>
		<tr>
	</c:forEach>
	</table>
</div>