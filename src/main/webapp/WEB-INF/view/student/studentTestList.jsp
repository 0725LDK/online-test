<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
	<h1>Student Test List</h1>
	<!-- 학생 선택 메뉴 -->
	<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import><br>
	
	<!-- 시험 리스트 -->
	<input type="hidden" value="${loginStudent.studentNo}">
	<table border="1">
		<tr>
			<td>시험 번호</td>
			<td>시험 제목</td>
			<td>시험 일자</td>
			<td>응시</td>
			<td>점수</td>
		</tr>
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
					${t.score }
				</td>
			</tr>	
		</c:forEach>
	</table>
	
	<h2>Exfired Test</h2>
	<table border="1">
		<tr>
			<td>시험 번호</td>
			<td>시험 제목</td>
			<td>시험 일자</td>
			<td>응시</td>
			<td>점수</td>
		</tr>
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
					${et.score }
				</td>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>