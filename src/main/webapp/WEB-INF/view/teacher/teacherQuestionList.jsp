<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
	<h1>Test Question List</h1>
	<!-- 강사 선택 메뉴 -->
	<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import><br>
	
	<a href="${pageContext.request.contextPath }/teacher/teacherTestList">시험목록으로</a>
	<br><br>
	
	<!-- 검색 -->
	<form action="${pageContext.request.contextPath }/teacher/teacherQuestionList" method="get">
		<input type="text" name="searchWord">
		<button type="submit">문제 제목 검색</button>
	</form><br>
	
	<!-- 문제 리스트 -->
	<table border="1">
		<tr>
			<td>시험 번호</td>
			<td>문제 번호</td>
			<td>문제 제목</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="q" items="${list }">
			<input type="hidden" value="${q.questionNo}">
			<tr>
				<td>${q.testNo}</td>
				<td>${q.questionIdx}</td>
				<td>
					<a href="${pageContext.request.contextPath }/teacher/teacherExampleList?questionNo=${q.questionNo}&testNo=${testNo}">${q.questionTitle}</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath }/teacher/teacherModifyQuestion?questionTitle=${q.questionTitle}&questionNo=${q.questionNo}&testNo=${q.testNo}">수정</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath }/teacher/removeQuestion?questionNo=${q.questionNo}&testNo=${q.testNo}">삭제</a>
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
			<a href="${pageContext.request.contextPath }/teacher/teacherQuestionList?currentPage=1&searchWord=${searchWord}">처음으로</a>
		</c:if>
		<c:if test="${startPage <= 10}">
			<span>이전 10페이지</span>
		</c:if>
		<c:if test="${startPage > 1}">
			<a href="${pageContext.request.contextPath }/teacher/teacherQuestionList?currentPage=${startPage-10}&searchWord=${searchWord}">이전 10페이지</a>
		</c:if>
			
		<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
			<a href="${pageContext.request.contextPath }/teacher/teacherQuestionList?currentPage=${i}">${i}</a>
		</c:forEach>
			
		<c:if test="${endPage - startPage < 9 }">
			<span>다음 10페이지</span>
		</c:if>
		<c:if test="${currentPage==lastPage}">
			<span>끝으로</span>
		</c:if>
		<c:if test="${endPage - startPage == 9 }">
			<a href="${pageContext.request.contextPath }/teacher/teacherQuestionList?currentPage=${startPage+10}&searchWord=${searchWord}">다음 10페이지</a>
		</c:if>		
		<c:if test="${currentPage < lastPage }">
			<a href="${pageContext.request.contextPath }/teacher/teacherQuestionList?currentPage=${lastPage}&searchWord=${searchWord}">끝으로</a>
		</c:if>
	</div>
	
	<!-- 문제 등록 -->
	<h2>Add Question</h2>
	<form action="${pageContext.request.contextPath }/teacher/addQuestion" method="post">
		<table border="1">
			<tr>
				<td>시험 번호  </td>
				<td><input type="text" name="testNo" value="${testNo }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>문제 번호  </td>
				<td><input type="text" name="questionIdx" value="${questionTotalCount + 1 }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>문제 제목  </td>
				<td><input type="text" name="questionTitle"></td>
			</tr>
		</table><br>
		<button type="submit">문제 등록</button>
	</form>
	
</body>
</html>