<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<a href="${pageContext.request.contextPath }/employee/empList">[사원관리]</a>
	<!-- 사원등록시 ID체크(employee+student+teacher -->
	
	<!-- 강사 목록, 강사 삭제-->
	<a href="${pageContext.request.contextPath }/employee/teacher/teacherList">[강사관리]</a>
	
	<!-- 학생 목록, 학생 삭제 -->
	<a href="${pageContext.request.contextPath }/employee/student/studentList">[학생관리]</a><br>
	
	<a href="${pageContext.request.contextPath }/employee/modifyEmpPw">[비밀번호 수정]</a>
	<a href="${pageContext.request.contextPath }/logout">[로그아웃]</a>
</div>