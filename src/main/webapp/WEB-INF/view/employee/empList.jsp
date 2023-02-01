<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<h1>Employee List</h1>
	<a href="${pageContext.request.contextPath }/employee/addEmp">사원등록</a>
	<table>
		<tr>
			<td>empId</td>
			<td>empName</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="e" items="${list }">
		
			<tr>
				<td>${e.empId }</td>
				<td>${e.empName }</td>
				<td>
					<a href="${pageContext.request.contextPath }/employee/removeEmp?empNo=${e.empNo}">삭제</a>
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
			<a href="${pageContext.request.contextPath }/employee/empList?currentPage=1">처음으로</a>
			<a href="${pageContext.request.contextPath }/employee/empList?currentPage=${currentPage-1}">이전</a>
		
		</c:if>
		<span>[ ${currentPage } ]</span>
		<c:if test="${currentPage == lastPage}">
			<span>다음</span>
			<span>끝으로</span>
		</c:if>
		<c:if test="${currentPage < lastPage}">
		
			<a href="${pageContext.request.contextPath }/employee/empList?currentPage=${currentPage+1}">다음</a>
			<a href="${pageContext.request.contextPath }/employee/empList?currentPage=${lastPage}">끝으로</a>
		</c:if>
	
	</div>
</body>
</html>