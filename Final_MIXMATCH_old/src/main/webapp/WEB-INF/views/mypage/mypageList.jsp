<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageLayout.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage.reply.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>

<div class="container">

<!-- ===============MyPage왼쪽 프로필부분=============== -->

	<div class="box-left">
		<div class="align-center">
			<c:if test="${empty member.profile_name}">
				<!-- 프로필사진이 등록되어 있지않으면 기본이미지 출력 -->
				<img src="${pageContext.request.contextPath}/resources/images/profile.jpg" style="max-width: 150px">	
			</c:if>
		</div>
		<c:if
			test="${fn:endsWith(member.profile_name,'.jpg') || 
				  fn:endsWith(member.profile_name,'.JPG') ||
				  fn:endsWith(member.profile_name,'.GIF') ||
				  fn:endsWith(member.profile_name,'.gif') ||
				  fn:endsWith(member.profile_name,'.png') ||
				  fn:endsWith(member.profile_name,'.PNG')}">
			<!-- String클래스에 있는 메서드 endsWith는 마지막거만 체크해. 만약 .jpg가 있으면 true를 반환 -->
			<div class="align-center">
				<img src="imageView.do?id=${member.id}" style="max-width: 150px">
			</div>
		</c:if><br>
		<div class="align-center">
			<c:if test="${!empty user_id && user_id == member.id}">		<!-- 자신의 미니홈피가 아니면 내 정보 버튼 숨김 -->
				<input type="button" value="내 정보" onclick="location.href='${pageContext.request.contextPath}/member/detail.do'" class="btn btn-info"/>
			</c:if>
		</div><br>
		<ul style="list-style: none;">
			<li>이름 : ${member.name}</li>
			<li>지역 : ${member.address}</li>
			<li>등급 : ${member.auth}</li>
			<li>포인트 : ${member.point}</li>
		</ul><br>

		<ul class="nav nav-tabs">
			<li class="active"><a href="#tab4" data-toggle="tab">축구</a></li>
			<li><a href="#tab5" data-toggle="tab">야구</a></li>
			<li><a href="#tab6" data-toggle="tab">농구</a></li>
		</ul>

		<div class="tab-content">			<!-- 각 종목들의 가장 최근 기록 -->
			<!-- 축구 -->
			<c:if test="${football == null}">
				<div class="tab-pane active fade in" id="tab4">
					<p class="p_size">최근 축구기록이 없습니다.</p>
				</div>
			</c:if>	
				<div class="tab-pane active fade in" id="tab4">
					<p class="p_size">소속팀명 : ${football.t_name}</p>
					<p class="p_size">골 : ${football.f_goal}</p>
					<p class="p_size">어시스트 : ${football.f_assist}</p>
					<p class="p_size">공격P : ${football.f_attack}</p>
				</div>
				
			<!-- 야구 -->	
			<c:if test="${baseball == null}">
				<div class="tab-pane fade" id="tab5">
					<p class="p_size">최근 야구기록이 없습니다.</p>
				</div>
			</c:if>	
				<div class="tab-pane fade" id="tab5">
					<p class="p_size">소속팀명 : ${baseball.t_name}</p>
					<p class="p_size">타율 : ${baseball.b_avg}</p>
					<p class="p_size">방어율 : ${baseball.b_era}</p>
				</div>
			
			<!-- 농구 -->
			<c:if test="${basketball == null}">
				<div class="tab-pane fade" id="tab6">
					<p class="p_size">최근 농구기록이 없습니다.</p>
				</div>
			</c:if>	
				<div class="tab-pane fade" id="tab6">
					<p class="p_size">소속팀명 : ${basketball.t_name}</p>
					<p class="p_size">득점 : ${basketball.b_score}</p>
					<p class="p_size">3점슛 : ${basketball.b_3point}</p>
					<p class="p_size">어시스트 : ${basketball.b_assist}</p>
					<p class="p_size">리바운드 : ${basketball.b_rebound}</p>
				</div>
		</div>
	</div>

<!-- ===============MyPage왼쪽 프로필부분=============== -->




<!-- ===============MyPage가운데 미니홈피부분=============== -->

	<div class="box-center">

	<c:if test="${!empty user_id && user_id == member.id}">		<!-- 자신의 미니홈피가 아니면 글등록폼 숨김 -->
	<!-- 글등록 폼 -->
		<div class="register_form">
			<form:form commandName="mypageCommand" action="main.do" enctype="multipart/form-data">		<!-- 파일 업로드 일때만 enctype을 명시해줘 -->
				<form:hidden path="id"/>
				<label for="h_content"></label>
				<form:textarea path="h_content"   placeholder="내용을 입력하세요" />
				<div class="post-file">
					<label for="uploadfile"></label>
					<input type="file" name="uploadfile" id="uploadfile">
					<form:select path="h_show">
						<form:option value="y">전체공개</form:option>
						<form:option value="n">비공개</form:option>
					</form:select>
						<input type="submit" value="등록">
				</div>
			</form:form>
		</div>
	</c:if>
	
	
	<!-- 목록출력 -->
	<c:if test="${h_show_count == 0}">			<!-- 전체공개글이 없을시 등록된 글이 없다는 메시지 출력 -->
	 	<div>등록된 글이 없습니다.</div>
	</c:if>
	
	
	<c:if test="${count > 0}">
		<c:forEach var="mypage" items="${list}">	
		
		<!-- 로그인 되어있는 유저가 다른 유저의 페이지를 방문했을때 비공개로 되어있는 글은 확인불가능 -->				
		<c:if test="${user_id != mypage.id}">					
		<c:if test="${mypage.h_show eq 'y'}">
			<input type="hidden" name="id" id="id" value="${mypage.id}">		<!-- 부모글 작성자 -->
			<input type="hidden" name="h_show" value="${mypage.h_show}">		<!-- 글 공개여부 -->
			<div class="post-list" id="${mypage.h_seq}">
		<div class="post_head">
			<table>
				<tr>
					<td rowspan="2">
						<c:if
							test="${fn:endsWith(member.profile_name,'.jpg') || 
								  fn:endsWith(member.profile_name,'.JPG') ||
								  fn:endsWith(member.profile_name,'.GIF') ||
								  fn:endsWith(member.profile_name,'.gif') ||
								  fn:endsWith(member.profile_name,'.png') ||
								  fn:endsWith(member.profile_name,'.PNG')}">
							<!-- String클래스에 있는 메서드 endsWith는 마지막거만 체크해. 만약 .jpg가 있으면 true를 반환 -->
							<div class="align-center">
								<img src="imageView.do?id=${member.id}" style="max-width: 30px" height="30px">
							</div>
						</c:if>
					</td>
					<td>${mypage.id}</td>
				</tr>
				<tr>
					<td>${mypage.h_regdate}</td>
				</tr>
			</table>
		</div>
		
		<div class="post-content1${mypage.h_seq}"></div>
			<div class="post-content2">
				${mypage.h_content}
			</div>

		<div class="post-content">
		<c:if
			test="${fn:endsWith(mypage.h_file_name,'.jpg') || 
			  fn:endsWith(mypage.h_file_name,'.JPG') ||
			  fn:endsWith(mypage.h_file_name,'.GIF') ||
			  fn:endsWith(mypage.h_file_name,'.gif') ||
			  fn:endsWith(mypage.h_file_name,'.png') ||
			  fn:endsWith(mypage.h_file_name,'.PNG')}">
			<!-- String클래스에 있는 메서드 endsWith는 마지막거만 체크해. 만약 .jpg가 있으면 true를 반환 -->
			<div class="align-center">
				<img src="imageView2.do?seq=${mypage.h_seq}" style="max-width: 300px">
			</div>
		</c:if>
		
		<hr size="1" width="100%" style="border-color: #d6cfcf;">		
		
		<div class="modify_delete_button">
			<div class="modify_delete_button"${mypage.h_seq}>
				<c:if test="${!empty user_id && user_id == mypage.id}">
					<input type="button" value="수정" id="post-modify${mypage.h_seq}" data-postNum="${mypage.h_seq}" data-postId="${mypage.id}" data-postShow="${mypage.h_show}">
					<input type="button" value="삭제" id="post-delete${mypage.h_seq}" data-postNum="${mypage.h_seq}" data-postId="${mypage.id}" data-postShow="${mypage.h_show}">
				</c:if>
			</div>
		</div>
		</div>
			
			
		<!-- 댓글등록 -->
		<div id="reply_div">
			<form id="re_form${mypage.h_seq}">
				<input type="hidden" name="h_seq" value="${mypage.h_seq}" id="h_seq">
				<input type="hidden" name="id" value="${user_id}" id="user_id">		<!-- session에 있는 아이디 -->
				<input type="text" name="h_re_content" id="h_re_content${mypage.h_seq}" placeholder="댓글을 입력하세요.">
				<input type="submit" value="댓글등록">
				
				<c:if test="${!empty user_id}">
					<div id="re_first">
						<span class="letter-count${mypage.h_seq}">300/300</span>
					</div>
				</c:if>
			</form>
		</div>
		
		<!-- 댓글목록 출력 -->
		<div id="output${mypage.h_seq}"></div>	<!-- 각각의 부모글번호를 댓글영역 id값에 붙임으로서 어느글에 댓글인지 구별할 수 있도록 함 -->
		<div class="paging-button${mypage.h_seq}" style="display: none;">
			<input type="button" value="다음 댓글 보기">
		</div>
	</div>
	</c:if>
	</c:if>

	<!-- 로그인 되어있는 유저가 자신의 페이지를 방문할때는 공개든 비공개든 모든 게시글 확인가능 -->
	<c:if test="${user_id == mypage.id}">						

			<input type="hidden" name="id" id="id" value="${mypage.id}">		<!-- 부모글 작성자 -->
			<input type="hidden" name="h_show" value="${mypage.h_show}">
			<div class="post-list" id="${mypage.h_seq}">
		<div class="post_head">
			<table>
				<tr>
					<td rowspan="2">
						<c:if
							test="${fn:endsWith(member.profile_name,'.jpg') || 
								  fn:endsWith(member.profile_name,'.JPG') ||
								  fn:endsWith(member.profile_name,'.GIF') ||
								  fn:endsWith(member.profile_name,'.gif') ||
								  fn:endsWith(member.profile_name,'.png') ||
								  fn:endsWith(member.profile_name,'.PNG')}">
							<!-- String클래스에 있는 메서드 endsWith는 마지막거만 체크해. 만약 .jpg가 있으면 true를 반환 -->
							<div class="align-center">
								<img src="imageView.do?id=${member.id}" style="max-width: 30px" height="30px">
							</div>
						</c:if>
					</td>
					<td>${mypage.id}</td>
				</tr>
				<tr>
					<td>${mypage.h_regdate}</td>
				</tr>
			</table>
		</div>
		
		<div class="post-content1${mypage.h_seq}"></div>
			<div class="post-content2">
				${mypage.h_content}
			</div>

		<div class="post-content">
		<c:if
			test="${fn:endsWith(mypage.h_file_name,'.jpg') || 
			  fn:endsWith(mypage.h_file_name,'.JPG') ||
			  fn:endsWith(mypage.h_file_name,'.GIF') ||
			  fn:endsWith(mypage.h_file_name,'.gif') ||
			  fn:endsWith(mypage.h_file_name,'.png') ||
			  fn:endsWith(mypage.h_file_name,'.PNG')}">
			<!-- String클래스에 있는 메서드 endsWith는 마지막거만 체크해. 만약 .jpg가 있으면 true를 반환 -->
			<div class="align-center">
				<img src="imageView2.do?seq=${mypage.h_seq}" style="max-width: 300px">
			</div>
		</c:if>
		
		<hr size="1" width="100%" style="border-color: #d6cfcf;">		
		
		<div class="modify_delete_button">
			<div class="modify_delete_button"${mypage.h_seq}>
				<c:if test="${!empty user_id && user_id == mypage.id}">
					<input type="button" value="수정" id="post-modify${mypage.h_seq}" data-postNum="${mypage.h_seq}" data-postId="${mypage.id}" data-postShow="${mypage.h_show}">
					<input type="button" value="삭제" id="post-delete${mypage.h_seq}" data-postNum="${mypage.h_seq}" data-postId="${mypage.id}" data-postShow="${mypage.h_show}">
				</c:if>
			</div>
		</div>
		</div>
			
			
		<!-- 댓글등록 -->
		<div id="reply_div">
			<form id="re_form${mypage.h_seq}">
				<input type="hidden" name="h_seq" value="${mypage.h_seq}" id="h_seq">
				<input type="hidden" name="id" value="${user_id}" id="user_id">		<!-- session에 있는 아이디 -->
				<input type="text" name="h_re_content" id="h_re_content${mypage.h_seq}" placeholder="댓글을 입력하세요.">
				<input type="submit" value="댓글등록">
				
				<c:if test="${!empty user_id}">
					<div id="re_first">
						<span class="letter-count${mypage.h_seq}">300/300</span>
					</div>
				</c:if>
			</form>
		</div>
		
		<!-- 댓글목록 출력 -->
		<div id="output${mypage.h_seq}"></div>	<!-- 각각의 부모글번호를 댓글영역 id값에 붙임으로서 어느글에 댓글인지 구별할 수 있도록 함 -->
		<div class="paging-button${mypage.h_seq}" style="display: none;">
			<input type="button" value="다음 댓글 보기">
		</div>
	</div>
	
	</c:if>
		</c:forEach>
	</c:if>

	<c:if test="${h_show_count != 0}">
		<div class="align-center">${pagingHtml}</div>
	</c:if>

</div>
	
<!-- ===============MyPage가운데 미니홈피부분=============== -->
</div>

