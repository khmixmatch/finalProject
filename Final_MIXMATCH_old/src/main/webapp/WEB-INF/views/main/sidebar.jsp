<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/teamLogo.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var flag = false;
		$("#sideMenu").hide();
		
		$('#side-btn').click(function(){
			if(flag == false) {
				$("#sideMenu").show();
				flag = true;
			} else {
				$("#sideMenu").hide();
				flag = false;
			}
		});
		
		var chat;
		var open = 0;
		$("#chat").click(function(){
			if(open==1){
				chat.close();
				open=0;
			}
			onPopupWindow();
		});
		function onPopupWindow(){  
		    chat = window.open("${pageContext.request.contextPath}/chat.do", "_blank", "top=300, left=500, width=400, height=400");
		    open=1;
		}
	});
</script>
<style type="text/css">
	#sideul li{
		height:150px;
		border:1px solid blue;
	}
	#sideul li form input{
		width:80px;
	}
</style>
<div>
	<span class="glyphicon glyphicon-chevron-right" id="side-btn"></span>
</div>
<div class="align-center" id="sideMenu" style="background:white;">
	<ul id="sideul">
		<li>
			<c:if test="${!empty user_id }">
			<a href="${pageContext.request.contextPath}/mypage/main.do?id=${user_id}" >
				<c:if test="${fn:endsWith(member.profile_name, '.jpg') || fn:endsWith(member.profile_name, '.png') || fn:endsWith(member.profile_name, '.gif') || fn:endsWith(member.profile_name, '.JPG') || fn:endsWith(member.profile_name, '.PNG') || fn:endsWith(member.profile_name, '.GIF')}">
					<img src="${pageContext.request.contextPath}/imageViewSide.do?id=${member.id}" style="width:100px;height:100px;">
				</c:if> 
				<c:if test="${empty member.profile_name }">
					<img src="${pageContext.request.contextPath}/resources/images/profile.jpg" style="width:100px;height:100px;">
				</c:if>
				
			</a>
			</c:if>
			<c:if test="${empty user_id}">
			
			<form action="${pageContext.request.contextPath}/login.do" method="post">
				<label for="id">ID</label><input type="text" id="id" name="id" >
				<label for="pw">PW</label><input type="password" id="pw" name="pw">
				<input type="submit" value="로그인">
			</form>
			</c:if>
		</li>
		<li> 
			<div  >
			<c:if test="${joinCountSide==0 }">
			가입신청한 팀이 없습니다. 자신의 팀을 생성하거나 이미 등록된 팀에 가입신청하세요.
			<a href="${pageContext.request.contextPath}/team.do">팀생성</a>
			</c:if>
			<c:if test="${joinCountSide>0 }">  
			<select id="myteam" name="myteam">
				<c:forEach var="joinListSide" items="${joinListSide}">
						<c:if test="${joinListSide.t_mem_auth > 0}">
						<option>
							${joinListSide.t_name}
						</option>
						</c:if>
				</c:forEach>
			</select>
			<c:forEach var="joinListSide" items="${joinListSide}">
				<a href="${pageContext.request.contextPath }/teamInfo.do?t_name=${joinListSide.t_name}" id="myteamLogo">
					<c:if test="${fn:endsWith(joinListSide.t_logo_name, '.jpg') || fn:endsWith(joinListSide.t_logo_name, '.png') || fn:endsWith(joinListSide.t_logo_name, '.gif') || fn:endsWith(joinListSide.t_logo_name, '.JPG') || fn:endsWith(joinListSide.t_logo_name, '.PNG') || fn:endsWith(joinListSide.t_logo_name, '.GIF')}">
						<img id="${joinListSide.t_name }" src="${pageContext.request.contextPath}/imageViewTside.do?t_name=${joinListSide.t_name}" style="width:100px;height:100px;display: none;">
					</c:if>
					<c:if test="${empty joinListSide.t_logo_name }">
						<c:if test="${joinListSide.t_type eq '야구' }">
							<img id="${joinListSide.t_name }" src="${pageContext.request.contextPath}/resources/images/baseball.png" style="width:100px;height:100px;display: none;">
						</c:if>
						<c:if test="${joinListSide.t_type eq '농구' }">
							<img id="${joinListSide.t_name }" src="${pageContext.request.contextPath}/resources/images/basketball.png" style="width:100px;height:100px;display: none;">
						</c:if>
						<c:if test="${joinListSide.t_type eq '축구' }">
							<img id="${joinListSide.t_name }" src="${pageContext.request.contextPath}/resources/images/football.png" style="width:100px;height:100px;display: none;">
						</c:if>
					</c:if>
				</a>
			</c:forEach>
			</c:if>
			</div>
		</li>
		<li>
			<a href="#">
			
			</a>
			<div>포인트샵</div> 
		</li>
		<li>
			<c:if test="${!empty user_id }">
			<div id="chat" style="height:100px;background:green;"> 채팅			
			</div>
			</c:if>
			<c:if test="${empty user_id}">
			<div style="height:100px;background:green;">로그인하세요</div>
			</c:if>
		</li>
	</ul>
</div>