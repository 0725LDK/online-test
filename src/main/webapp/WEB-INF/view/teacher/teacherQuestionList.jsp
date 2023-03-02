<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${pageContext.request.contextPath}/resource/assets/"
  data-template="vertical-menu-template-free"
>
<head>
<meta charset="UTF-8">
<jsp:include page="/inc/HTMLHead.jsp"></jsp:include>	
	<meta charset="UTF-8">
	<title>Teacher Question List</title>
</head>

<body>
	<div class="container-xxl flex-grow-1 container-p-y">
	<h1>강사 시험 리스트</h1>
		<span>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/teacher/teacherTestList">시험 관리</a>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/teacher/modifyTeacherPw">비밀번호 수정</a>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath }/teacher/logout">로그아웃</a>
		</span>
		<br><br>
		
		<!-- Hoverable Table rows -->
		<div class="card">
			<h5 class="card-header">강사 시험 리스트 <a href="${pageContext.request.contextPath }/teacher/teacherTestList"> [ 시험목록으로 ]</a>
			</h5>
			<span style="text-align:right">
				<form id="searchForm" action="${pageContext.request.contextPath }/teacher/teacherQuestionList" method="get">
					<span><input id="search" type="text" name="searchWord" placeholder="Search Test"></span>
					<button id="seachFormBtn" type="submit" class="btn rounded-pill btn-outline-primary">검색</button>			
				</form>
			</span>
			<div class="table-responsive text-nowrap">
				<table class="table table-hover">
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
					<tfoot>
						<tr>
							<td colspan="5" style="text-align:center">
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
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<div class="container-xxl flex-grow-1 container-p-y">
		<h1>문제 등록</h1>
		<div class="card">	
			<div class="table-responsive text-nowrap">
				<form action="${pageContext.request.contextPath }/teacher/addQuestion" method="post">
					<table class="table table-hover">
						<tr>
							<td>시험 제목  </td>
							<td><input type="text" name="testTitle"></td>
						</tr>
						<tr>
							<td>시험 날짜  </td>
							<td><input type="date" name="testDate"></td>
						</tr>
					</table>
					<div align="center"><br>
						<button class="btn rounded-pill btn-primary" type="submit">시험 등록</button>
					</div><br>
				</form>
			</div>	
		</div>			
	</div>
	<div class="container-xxl flex-grow-1 container-p-y">
		<h1>시험별 평균</h1>
		<div class="card">	
			<!-- 차트 -->
			<canvas id="myChart" style="width:100%;max-width:600px"></canvas>
		</div>
	</div>
	<!-- /메인 -->
	
	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<jsp:include page="/inc/coreJS.jsp"></jsp:include>






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
			<c:if test="${questionTotalCount < 5}">
				<button type="submit">시험 등록</button>
			</c:if>
			<c:if test="${questionTotalCount == 5}">
				<span>문제는 5개까지 등록 가능합니다.</span>
			</c:if>
		
	</form>
	
</body>
</html>