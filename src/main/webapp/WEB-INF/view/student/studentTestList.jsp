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
					<a href="${pageContext.request.contextPath }/student/studentQuestionList?testNo=${t.testNo}&studentNo=${loginStudent.studentNo}">응시</a>
				</td>
				<td>
					
				</td>
			</tr>	
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div>
		<c:if test="${currentPage == 1 }">
			<span>처음으로</span>
		</c:if>
		<c:if test="${currentPage != 1 }">
			<a href="${pageContext.request.contextPath }/teacher/teacherTestList?currentPage=1&searchWord=${searchWord}">처음으로</a>
		</c:if>
		<c:if test="${startPage <= 10}">
			<span>이전 10페이지</span>
		</c:if>
		<c:if test="${startPage > 1}">
			<a href="${pageContext.request.contextPath }/teacher/teacherTestList?currentPage=${startPage-10}&searchWord=${searchWord}">이전 10페이지</a>
		</c:if>
			
		<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
			<a href="${pageContext.request.contextPath }/teacher/teacherTestList?currentPage=${i}">${i}</a>
		</c:forEach>
			
		<c:if test="${endPage - startPage < 9 }">
			<span>다음 10페이지</span>
		</c:if>
		<c:if test="${currentPage==lastPage}">
			<span>끝으로</span>
		</c:if>
		<c:if test="${endPage - startPage == 9 }">
			<a href="${pageContext.request.contextPath }/teacher/teacherTestList?currentPage=${startPage+10}&searchWord=${searchWord}">다음 10페이지</a>
		</c:if>		
		<c:if test="${currentPage < lastPage }">
			<a href="${pageContext.request.contextPath }/teacher/teacherTestList?currentPage=${lastPage}&searchWord=${searchWord}">끝으로</a>
		</c:if>
	</div><br><br>
</body>
</html>