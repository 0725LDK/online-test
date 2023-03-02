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
	<title>Student Question List</title>
</head>
<body>
	<div class="container-xxl flex-grow-1 container-p-y">
		<h1>문제 리스트</h1>
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
				<form action="${pageContext.request.contextPath }/student/studentTestPaper?testNo=${testNo}&studentNo=${studentNo}" method="post">
					<table class="table table-hover">
						<c:forEach var="q" items="${list }" >
							
							<input type="hidden" name="studentNo" value="${studentNo}">
							<input type="hidden" name="questionNo${q.questionIdx}" value="${q.questionNo}">
							<tr>
								<td>Q${q.questionIdx} </td>
								<td>${q.questionTitle}</td>
							</tr>
							<tr>
								<td>보기</td>
								<td>
									1) ${q.exampleIdx1} <input type="text" value="${q.answer1 }"><input type="radio" name="choice${q.questionIdx}" value="1"><br>
									2) ${q.exampleIdx2} <input type="text" value="${q.answer2 }"><input type="radio" name="choice${q.questionIdx}" value="2"><br>
									3) ${q.exampleIdx3} <input type="text" value="${q.answer3 }"><input type="radio" name="choice${q.questionIdx}" value="3"><br>
									4) ${q.exampleIdx4} <input type="text" value="${q.answer4 }"><input type="radio" name="choice${q.questionIdx}" value="4"><br>
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
					</table><br>
					<div align="center">
						<button class="btn rounded-pill btn-primary" type="submit">제출</button>
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