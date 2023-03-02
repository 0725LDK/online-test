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
	<jsp:include page="/inc/HTMLHead.jsp"></jsp:include>	
	<meta charset="UTF-8">
	<title>Student Test List</title>
</head>
<body>

	<div class="container-xxl flex-grow-1 container-p-y">
		<h1>시험 리스트</h1>
		<span>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/student/studentTestList">시험목록</a>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/student/studentModifyPw">비밀번호 수정</a>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/student/logout">로그아웃</a>
		</span>
		<br><br>
		<!-- Hoverable Table rows -->
		<input type="hidden" value="${loginStudent.studentNo}">
		<div class="card">
			<h5 class="card-header">Student Test List</h5>
			<div class="table-responsive text-nowrap">
				<table class="table table-hover">
					<thead>
						<tr>
							<td>시험 번호</td>
							<td>시험 제목</td>
							<td>시험 일자</td>
							<td>응시</td>
							<td>점수</td>
						</tr>
					</thead>
					<c:forEach var="t" items="${list }" varStatus="status">
						<tr>
							<td>${t.testNo}</td>
							<td>
								${t.testTitle}
							</td>
							<td>${t.testDate}</td>
							<td>
								<c:if test="${t.score == 0}">
									<a href="${pageContext.request.contextPath }/student/studentQuestionList?testNo=${t.testNo}&studentNo=${loginStudent.studentNo}">응시</a>
								</c:if>
								<c:if test="${t.score != 0 }">
									불가
								</c:if>
							</td>
							<td>
								${t.score } 점
							</td>
						</tr>	
					</c:forEach>
				</table>
			</div><br>
			<h5 class="card-header">Exfired  Test List</h5>
			<div class="table-responsive text-nowrap">
				<table class="table table-hover">
					<thead>
						<tr>
							<td>시험 번호</td>
							<td>시험 제목</td>
							<td>시험 일자</td>
							<td>응시</td>
							<td>점수</td>
						</tr>
					</thead>
					<c:forEach var="et" items="${endList }" varStatus="status">
						<tr>
							<td>${et.testNo}</td>
							<td>
								${et.testTitle}
							</td>
							<td>${et.testDate}</td>
							<td>
								불가
							</td>
							<td>
								${et.score } 점
							</td>
						</tr>	
					</c:forEach>
				</table>
			</div>					
		</div>
	</div>
	<!-- /메인 -->
	
	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<jsp:include page="/inc/coreJS.jsp"></jsp:include>

</body>
</html>