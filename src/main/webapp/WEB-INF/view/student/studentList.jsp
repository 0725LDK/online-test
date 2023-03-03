<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<title>STUDENT LIST</title>
</head>
<body>
	<div class="container-xxl flex-grow-1 container-p-y">
		<h1>학생 리스트</h1>
		<span>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/employee/empList">사원관리</a>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/employee/teacher/teacherList">강사관리</a>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/employee/student/studentList">학생관리</a>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/employee/modifyEmpPw">비밀번호 수정</a>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/logout">로그아웃</a>
		</span>
		<br><br>
		<!-- Hoverable Table rows -->
			<div class="card">
				<h5 class="card-header">학생 리스트 [<a href="${pageContext.request.contextPath }/employee/student/addStudent">학생등록</a>]</h5>
					
				<span style="text-align:right">
					<form id="searchForm" action="${pageContext.request.contextPath }/employee/student/studentList" method="get">
						<span><input id="search" type="text" name="searchWord" placeholder="Search Name"></span>
						<button id="seachFormBtn" type="submit" class="btn rounded-pill btn-outline-primary">검색</button>			
					</form>
				</span>
			
			<div class="table-responsive text-nowrap">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="font-size : 15px;">학생 ID</th>
							<th style="font-size : 15px;">학생 이름</th>
							<th style="font-size : 15px;">삭제</th>
						</tr>
					</thead>
					<c:forEach var="s" items="${list }">
						<tr>
							<td>${s.studentId }</td>
							<td>${s.studentName }</td>
							<td>
								<a href="${pageContext.request.contextPath }/employee/student/removeStudent?studentNo=${s.studentNo}">삭제</a>
							</td>
						</tr>	
					</c:forEach>
					<tfoot>
						<tr>
							<td colspan="5" style="text-align:center">
								<!-- 페이징 -->
								<div>
									<c:if test="${currentPage == 1 }">
										<span>[처음으로]</span>
									</c:if>
									<c:if test="${currentPage != 1 }">
										<a href="${pageContext.request.contextPath }/employee/student/studentList?currentPage=1&searchWord=${searchWord}">[처음으로]</a>
									</c:if>
									<c:if test="${startPage <= 10}">
										<span>[이전 10페이지]</span>
									</c:if>
									<c:if test="${startPage > 1}">
										<a href="${pageContext.request.contextPath }/employee/student/studentList?currentPage=${startPage-10}&searchWord=${searchWord}">[이전 10페이지]</a>
									</c:if>
										
									<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
										<a href="${pageContext.request.contextPath }/employee/student/studentList?currentPage=${i}">[${i}]</a>
									</c:forEach>
										
									<c:if test="${endPage - startPage < 9 }">
										<span>[다음 10페이지]</span>
									</c:if>
									<c:if test="${currentPage==lastPage}">
										<span>[끝으로]</span>
									</c:if>
									<c:if test="${endPage - startPage == 9 }">
										<a href="${pageContext.request.contextPath }/employee/student/studentList?currentPage=${startPage+10}&searchWord=${searchWord}">[다음 10페이지]</a>
									</c:if>		
									<c:if test="${currentPage < lastPage }">
										<a href="${pageContext.request.contextPath }/employee/student/studentList?currentPage=${lastPage}&searchWord=${searchWord}">[끝으로]</a>
									</c:if>
								</div>
							</td>
						</tr>
					</tfoot>
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