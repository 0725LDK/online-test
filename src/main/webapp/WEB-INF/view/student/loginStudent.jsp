<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
	<!-- 로그인 전 -->
	<c:if test="${loginStudent == null}">
		<h1>학생 로그인</h1>
		
		<!-- 로그인 선택 메뉴 -->
		<c:import url="/WEB-INF/view/employee/inc/loginMenu.jsp"></c:import><br>
	
		<form action="${pageContext.request.contextPath}/loginStudent" method="post">
			<table>
				<tr>
					<td>ID : </td>
					<td><input type="text" name="studentId"></td>
				</tr>
				<tr>
					<td>PW : </td>
					<td><input type="password" name="studentPw"></td>
				</tr>
			</table>
			<button type="submit">로그인</button>
		</form>
	</c:if>
	
	<!-- 로그인 되어 있으면 -->
	<c:if test="${loginStudent != null}">
		${loginStudent.studentName} 님 반갑습니다.
		<div>
			<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
		</div>
	</c:if>

</body>
</html>