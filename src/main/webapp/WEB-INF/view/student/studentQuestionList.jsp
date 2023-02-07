<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
	<h1>Student Question List</h1>
	<!-- 학생 선택 메뉴 -->
	<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import><br>
	
	<!-- 시험 리스트 -->
	<h2>문제</h2>
	<form action="${pageContext.request.contextPath }/student/studentTestPaper?testNo=${testNo}&studentNo=${studentNo}" method="post">
		<table border="1">
			<c:forEach var="q" items="${list }" >
				<input type="hidden" name="questionNo" value="${q.questionNo}">
				<tr>
					<td>${q.questionIdx}</td>
					<td>${q.questionTitle}</td>
				</tr>
				<tr>
					<td>보기</td>
					<td>
						1) ${q.exampleIdx1} <input type="text" value="${q.answer1 }"><input type="radio" name="choice${q.questionIdx}" value="${q.answer1 }"><br>
						2) ${q.exampleIdx2} <input type="text" value="${q.answer2 }"><input type="radio" name="choice${q.questionIdx}" value="${q.answer2 }"><br>
						3) ${q.exampleIdx3} <input type="text" value="${q.answer3 }"><input type="radio" name="choice${q.questionIdx}" value="${q.answer3 }"><br>
						4) ${q.exampleIdx4} <input type="text" value="${q.answer4 }"><input type="radio" name="choice${q.questionIdx}" value="${q.answer4 }"><br>
					</td>
				</tr>	
				
			</c:forEach>
		</table>
		<button type="submit">제출</button>
	</form>
	
</body>
</html>