<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
	<h1>Teacher Example Modify</h1>
	<!-- 강사 선택 메뉴 -->
	<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import><br>
	
	<a href="${pageContext.request.contextPath }/teacher/addQuestion">시험등록</a>
	<a href="${pageContext.request.contextPath }/teacher/teacherTestList">시험목록으로</a>
	<a href="${pageContext.request.contextPath }/teacher/teacherQuestionList?testNo=${testNo}">문제목록으로</a>
	
	<!-- 문제 수정 -->
	<h2>Modify Example</h2>
	<form action="${pageContext.request.contextPath }/teacher/teacherModifyExample" method="post">
		<input type="hidden" name="testNo" value="${testNo }">
		<input type="hidden" name="exampleNo" value="${exampleNo }">
		<table border="1">
			<tr>
				<td>문제 번호  </td>
				<td><input type="text" name="questionNo" value="${questionNo}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>보기 번호  </td>
				<td><input type="text" name="exampleIdx" value="${exampleIdx}" readonly="readonly" ></td>
			</tr>
			<tr>
				<td>보기 내용  </td>
				<td><input type="text" name="exampleTitle" value="${exampleTitle}" ></td>
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
			
		</table><br>
		<button type="submit">시험 수정</button>
	</form>
	
</body>
</html>