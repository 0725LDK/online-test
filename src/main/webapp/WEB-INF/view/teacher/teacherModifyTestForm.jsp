<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
	<h1>Teacher Test Modify</h1>
	<!-- 강사 선택 메뉴 -->
	<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import><br>
	
	<a href="${pageContext.request.contextPath }/teacher/addQuestion">시험등록</a>
	<a href="${pageContext.request.contextPath }/teacher/teacherTestList">시험목록으로</a>
	
	<!-- 시험 수정 -->
	<h2>Modify Test</h2>
	<form action="${pageContext.request.contextPath }/teacher/teacherModifyTest" method="post">
		<table border="1">
			<tr>
				<td>시험 번호  </td>
				<td><input type="text" name="testNo" value="${testNo }"  readonly="readonly"></td>
			</tr>
			<tr>
				<td>시험 제목  </td>
				<td><input type="text" name="testTitle" value="${testTitle }" ></td>
			</tr>
			<tr>
				<td>시험 날짜  </td>
				<td><input type="date" name="testDate" value="${testDate }" ></td>
			</tr>
		</table><br>
		<button type="submit">시험 수정</button>
	</form>
	
</body>
</html>