<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${pageContext.request.contextPath}/resource/assets/"
  data-template="vertical-menu-template-free"
>
<head>
<meta charset="UTF-8">
<jsp:include page="/inc/HTMLHead.jsp"></jsp:include>	
	<meta charset="UTF-8">
	<title>Question Example List</title>
</head>
<body>

	<div class="container-xxl flex-grow-1 container-p-y">
	<h1>강사 시험-문제-보기 리스트</h1>
		<span>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/teacher/teacherTestList">시험 관리</a>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/teacher/modifyTeacherPw">비밀번호 수정</a>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/teacher/logout">로그아웃</a>
		</span>
		<br><br>
		
		<!-- Hoverable Table rows -->
		<div class="card">
			<h5 class="card-header">강사 시험-문제-보기 리스트 <a href="${pageContext.request.contextPath }/teacher/teacherTestList">[ 시험목록으로 ]</a> <a href="${pageContext.request.contextPath }/teacher/teacherQuestionList?testNo=${testNo}">[ 문제목록으로 ] </a>
			</h5>
			
			<div class="table-responsive text-nowrap">
				<table class="table table-hover">
					<tr>
						<td>문제 번호</td>
						<td>보기 번호</td>
						<td>보기 내용</td>
						<td>정답/오답</td>
						<td>수정</td>
						<td>삭제</td>
					</tr>
					<c:forEach var="e" items="${list }">
					
						<tr>
							<td>${e.questionNo}</td>
							<td>${e.exampleIdx}</td>
							<td>${e.exampleTitle}</td>
							<td>${e.exampleOx}</td>
							<td><a href="${pageContext.request.contextPath }/teacher/teacherModifyExample?exampleNo=${e.exampleNo}&questionNo=${e.questionNo}&testNo=${testNo}&exampleTitle=${e.exampleTitle}&exampleIdx=${e.exampleIdx}">수정</a></td>
							<td><a href="${pageContext.request.contextPath }/teacher/removeExample?exampleNo=${e.exampleNo}&questionNo=${e.questionNo}&testNo=${testNo}">삭제</a></td>
						</tr>	
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<div class="container-xxl flex-grow-1 container-p-y">
		<h1>보기 등록</h1>
		<div class="card">	
			<div class="table-responsive text-nowrap">
				<form action="${pageContext.request.contextPath }/teacher/addExample" method="post">
					<input type="hidden" name="testNo" value="${testNo }">
					<table class="table table-hover">
						<tr>
							<td>문제 번호  </td>
							<td><input type="text" name="questionNo" value="${questionNo }" readonly="readonly"></td>
						</tr>
						<tr>
							<td>보기 번호  </td>
							<td><input type="text" name="exampleIdx" value="${exampleCount + 1 }" readonly="readonly"></td>
						</tr>
						<tr>
							<td>보기 내용 제목  </td>
							<td><input type="text" name="exampleTitle"></td>
						</tr>
						<tr>
							<td>정답/오답  </td>
							<td>
								<select name="exampleOx">
									<option value="정답">정답</option>
									<option value="오답">오답</option>
								</select>
							</td>
						</tr>
					</table>
					<div align="center"><br>
						<c:if test="${exampleCount+1 <= 4}">
							<button type="submit">보기 등록</button>
						</c:if>
						<c:if test="${exampleCount+1 == 5}">
							<button type="button">보기는 4개까지 등록가능합니다.</button>
						</c:if>
					</div><br>
					
				</form>
			</div>	
		</div>			
	</div>

	<!-- /메인 -->
	
	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<jsp:include page="/inc/coreJS.jsp"></jsp:include>


</body>
</html>