<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<h1>Student List</h1>
	<a href="${pageContext.request.contextPath }/student/addStudent">학생등록</a>
	<table border="1">
		<tr>
			<td>학생 ID</td>
			<td>학생 이름</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="s" items="${list }">
		
			<tr>
				<td>${s.studentId }</td>
				<td>${s.studentName }</td>
				<td>
					<a href="${pageContext.request.contextPath }/student/removeStudent?studentNo=${s.studentNo}">삭제</a>
				</td>
			</tr>	
		</c:forEach>
	</table>
	
	<div>
		<c:if test="${currentPage == 1 }">
			<span>처음으로</span>
			<span>이전</span>
		
		</c:if>
		<c:if test="${currentPage > 1 }">
			<a href="${pageContext.request.contextPath }/teacher/teacherList?currentPage=1">처음으로</a>
			<a href="${pageContext.request.contextPath }/teacher/teacherList?currentPage=${currentPage-1}">이전</a>
		
		</c:if>
		<span>[ ${currentPage } ]</span>
		<c:if test="${currentPage == lastPage}">
			<span>다음</span>
			<span>끝으로</span>
		</c:if>
		<c:if test="${currentPage < lastPage}">
		
			<a href="${pageContext.request.contextPath }/teacher/teacherList?currentPage=${currentPage+1}">다음</a>
			<a href="${pageContext.request.contextPath }/teacher/teacherList?currentPage=${lastPage}">끝으로</a>
		</c:if>
	
	</div>
</body>
</html>