<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>

<div class="page-main-style">
	<h2>공지사항</h2>
	
	<form:form commandName="noticeCommand" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<form:hidden path="id"/>
		<ul>
			<li>
				<label for="gn_title">제목</label>
				<form:input path="gn_title"/>
				<form:errors path="gn_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="gn_content">내용</label>
				<form:input path="gn_content"/>
				<form:errors path="gn_content" cssClass="error-color"/>
			</li>
			<li>
				<label for="gn_uploadfile_upload">파일업로드</label>
				<input type="file" id="gn_uploadfile_upload" name="gn_uploadfile_upload">
			</li>
		</ul>
		<input type="submit" value="공지사항등록">
		<input type="button" value="취소" onclick="location.href='notice.do'">
	</form:form>
</div>