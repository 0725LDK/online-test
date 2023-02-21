<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>

	<!-- 
		시험 회차(table : test) 관리(CRUD)
		개별시험화차 클릭하면 그 회차의 문제 리스트 출력(문제 CRUD) 
		개별문제 클릭하면 그 뮨제의 보기 리스트 출력(보기 CRUD) 
	-->
	<a href="${pageContext.request.contextPath }/teacher/teacherTestList">[시험 관리]</a>
	
	<a href="${pageContext.request.contextPath }/teacher/modifyTeacherPw">[비밀번호 수정]</a>
	<a href="${pageContext.request.contextPath }/teacher/logout">[로그아웃]</a>
	
</div>