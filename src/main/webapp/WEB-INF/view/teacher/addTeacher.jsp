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
	<h1>강사 추가</h1>
	<div>${errorMsg}</div>
	<form action="${pageContext.request.contextPath}/teacher/addTeacher" method="post">
		<table>
			<tr>
				<td>강사 ID : </td>
				<td><input type="text" name="teacherId"></td>
			</tr>
			<tr>
				<td>강사 PW : </td>
				<td><input type="password" name="teacherPw"></td>
			</tr>
			<tr>
				<td>강사 이름 : </td>
				<td><input type="text" name="teacherName"></td>
			</tr>
		</table>
		<button type="submit">추가</button>
	</form>
</body>
</html>