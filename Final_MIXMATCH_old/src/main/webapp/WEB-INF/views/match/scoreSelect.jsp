<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="page-main-style">
	<h2>점수보기</h2>
	<hr class="style"><br>
	<div class="detail-style"><br><br>
		<table class="versus"> 
			<tr>
				<td><img src="${pageContext.request.contextPath}/resources/images/home_img.png" width="80"></td>
				<td><span style="font-size:25px;color:blue;font-weight:bold;">${match.m_home}</span><br>${match.t_name}<br><input type="button" value="팀정보" class="btn-team-info" onclick="location.href='${pageContext.request.contextPath}/teamInfo.do?t_name=${match.t_name}'"></td>
				<td><img src="${pageContext.request.contextPath}/resources/images/versus.png" width="80"></td>
				<td><span style="font-size:25px;color:red;font-weight:bold;">${match.m_away}</span><br>${match.m_challenger}<br><input type="button" value="팀정보" class="btn-team-info" onclick="location.href='${pageContext.request.contextPath}/teamInfo.do?t_name=${match.m_challenger}'"></td>
				<td><img src="${pageContext.request.contextPath}/resources/images/away_img.png" width="80"></td>
			</tr>
		</table><br><br>
		<table class="list"> 
			<tr>
				<td class="left-style">MVP</td>
				<td align="left"> ${match.m_mvp}</td>
			</tr>
			<tr>
				<td class="left-style">지역</td>
				<td align="left"> ${match.m_area}</td>
			</tr>
			<tr>
				<td class="left-style">날짜</td>
				<td align="left"> ${match.m_date}</td>
			</tr>
			<tr>	
				<td class="left-style">시간</td>
				<td align="left"> ${match.m_time}</td>
			</tr>
			<tr>
				<td class="left-style">경기장</td>
				<td align="left"> ${match.m_place}</td>
			</tr>
		</table><br><br>
		<input type="button" value="목록으로" class="btn" onclick="location.href='scoreBoard.do'">
	</div>
	<br><hr class="style">
</div>