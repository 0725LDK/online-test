<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
	<h1>Question Example List</h1>
	<!-- 강사 선택 메뉴 -->
	<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import><br>
	
	<a href="${pageContext.request.contextPath }/teacher/teacherTestList">시험목록으로</a>
	<a href="${pageContext.request.contextPath }/teacher/teacherQuestionList?testNo=${testNo}">문제목록으로</a>
	<br><br>
	<table border="1">
		<tr>
			<td>문제 번호</td>
			<td>보기 번호</td>
			<td>보기 내용</td>
			<td>정답/오답</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="e" items="${list }">
		
			<tr>
				<td>${e.questionNo}</td>
				<td>${e.exampleIdx}</td>
				<td>${e.exampleTitle}</td>
				<td>${e.exampleOx}</td>
				<td><a href="${pageContext.request.contextPath }/teacher/teacherModifyExample?exampleNo=${e.exampleNo}&questionNo=${e.questionNo}&testNo=${testNo}&exampleTitle=${e.exampleTitle}&exampleIdx=${e.exampleIdx}">수정</a></td>
				<td><a href="${pageContext.request.contextPath }/teacher/removeExample?exampleNo=${e.exampleNo}&questionNo=${e.questionNo}&testNo=${testNo}">삭제</a></td>
			</tr>	
		</c:forEach>
	</table>
	
	<!-- 보기 등록 -->
		
	<h2>Add Example</h2>
	<form action="${pageContext.request.contextPath }/teacher/addExample" method="post">
		<input type="hidden" name="testNo" value="${testNo }">
		<table border="1">
			<tr>
				<td>문제 번호  </td>
				<td><input type="text" name="questionNo" value="${questionNo }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>보기 번호  </td>
				<td><input type="text" name="exampleIdx" value="${exampleCount + 1 }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>보기 내용 제목  </td>
				<td><input type="text" name="exampleTitle"></td>
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
		<c:if test="${exampleCount+1 <= 4}">
			<button type="submit">보기 등록</button>
		</c:if>
		<c:if test="${exampleCount+1 == 5}">
			<button type="button">보기는 4개까지 등록가능합니다.</button>
		</c:if>
	</form>
	
</body>
</html>