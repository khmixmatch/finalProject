<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="page-main-style">
	<h2>점수보기</h2>
	<hr class="style"><br>
	<div class="detail-style"><br><br>
		<table class="versus"> 
			<tr>
				<td>
					<c:if test="${!empty t_name}">
						<img src="matchImageView.do?t_name=${match.t_name}" width="80">
					</c:if>
					<c:if test="${empty t_name}">
						<c:if test="${match.m_type eq '축구'}"><img src="${pageContext.request.contextPath}/resources/images/football.png" style="width:80px;height:80px;"></c:if>
						<c:if test="${match.m_type eq '야구'}"><img src="${pageContext.request.contextPath}/resources/images/baseball.png" style="width:80px;height:80px;"></c:if>
						<c:if test="${match.m_type eq '농구'}"><img src="${pageContext.request.contextPath}/resources/images/basketball.png" style="width:80px;height:80px;"></c:if>
					</c:if>
				<td><span style="font-size:25px;color:blue;font-weight:bold;">${match.m_home}</span><br>${match.t_name}<br><input type="button" value="팀정보" class="btn-team-info" onclick="location.href='${pageContext.request.contextPath}/teamInfo.do?t_name=${match.t_name}'"></td>
				<td><img src="${pageContext.request.contextPath}/resources/images/versus.png" width="80"></td>
				<td><span style="font-size:25px;color:red;font-weight:bold;">${match.m_away}</span><br>${match.m_challenger}<br><input type="button" value="팀정보" class="btn-team-info" onclick="location.href='${pageContext.request.contextPath}/teamInfo.do?t_name=${match.m_challenger}'"></td>
				<td>
					<c:if test="${!empty m_challenger}">
						<img src="matchImageView.do?t_name=${match.m_challenger}" width="80">
					</c:if>
					<c:if test="${empty m_challenger}">
						<c:if test="${match.m_type eq '축구'}"><img src="${pageContext.request.contextPath}/resources/images/football.png" style="width:80px;height:80px;"></c:if>
						<c:if test="${match.m_type eq '야구'}"><img src="${pageContext.request.contextPath}/resources/images/baseball.png" style="width:80px;height:80px;"></c:if>
						<c:if test="${match.m_type eq '농구'}"><img src="${pageContext.request.contextPath}/resources/images/basketball.png" style="width:80px;height:80px;"></c:if>
					</c:if>
				</td>
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
	<c:if test="${fn:contains(mt_name,match.t_name)}">  
		<input type="button" value="개인기록+" class="btn" onclick="location.href='${pageContext.request.contextPath}/matchMemRecordInsert.do?m_seq=${match.m_seq}'">
	</c:if>
		<input type="button" value="목록으로" class="btn" onclick="location.href='scoreBoard.do'">
	</div>
	<br><hr class="style">
	<div align="center">
	<h3>베팅회원 목록</h3>
	<table border="1" style="width:400px;text-align:center;border-collapse:collapse;">
		<tr>
			<th>아이디</th>
			<th>예상승리팀</th>
			<th>예상점수</th>
			<th>베팅포인트</th>
			<th>배당률</th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.id}</td>
				<td>${list.t_winteam}</td>
				<td>${list.t_score}</td>
				<td>${list.t_point}</td>
				<td>${list.t_rate}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</div>