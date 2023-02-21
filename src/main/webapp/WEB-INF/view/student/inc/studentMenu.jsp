<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>


	<!-- 
		지나간 시험(table: test) 리스트+점수 - 점수확인버튼 - 제출답안지 확인 (table : paper)
		오늘날짜 시험 리스트는 응시버튼 - 시험지 출력(table(join): question X example) - 답안지제출(table: paper)
	-->
	<a href="${pageContext.request.contextPath }/student/studentTestList">[시험 목록]</a>
	
	<a href="${pageContext.request.contextPath }/student/studentModifyPw">[비밀번호 수정]</a>

	<a href="${pageContext.request.contextPath }/student/logout">[로그아웃]</a>
	
</div>