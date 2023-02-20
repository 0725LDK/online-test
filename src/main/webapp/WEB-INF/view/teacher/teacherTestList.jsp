<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<title> </title>

</head>
<body>
	<h1>Teacher Test List</h1>
	<!-- 강사 선택 메뉴 -->
	<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import><br>
	
	<!-- 검색 -->
	<form action="${pageContext.request.contextPath }/teacher/teacherTestList" method="get">
		<input type="text" name="searchWord">
		<button type="submit">시험제목 검색</button>
	</form>
	<br>
	
	<!-- 시험 리스트 -->
	<table border="1">
		<tr>
			<td>시험 번호</td>
			<td>시험 제목</td>
			<td>시험 일자</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="t" items="${list }" varStatus="status">
		
			<tr>
				<td>${t.testNo}</td>
				<td>
					<a href="${pageContext.request.contextPath }/teacher/teacherQuestionList?testNo=${t.testNo}">${t.testTitle}</a>
				</td>
				<td>${t.testDate}</td>
				<td>
					<a href="${pageContext.request.contextPath }/teacher/teacherModifyTest?testNo=${t.testNo}&testTitle=${t.testTitle}&testDate=${t.testDate}">수정</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath }/teacher/removeTest?testNo=${t.testNo}">삭제</a>
				</td>
			</tr>	

		</c:forEach>
	</table>
	
	<table>
		<c:forEach var="s" items="${avgList }">
		
		<tr>
			<td>${s.testTitle }</td>
			<td>${s.avgScore }</td>
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
	
	<!-- 시험 등록 -->
	<h2>Add Test</h2>
	<form action="${pageContext.request.contextPath }/teacher/addTest" method="post">
		<table border="1">
			<tr>
				<td>시험 제목  </td>
				<td><input type="text" name="testTitle"></td>
			</tr>
			<tr>
				<td>시험 날짜  </td>
				<td><input type="date" name="testDate"></td>
			</tr>
		</table><br>
		<button type="submit">시험 등록</button>
	</form>
	
	<!-- 차트 -->
	<canvas id="myChart" style="width:100%;max-width:600px"></canvas>
	
</body>

<!-- 차트 모델 값을 가져오는 코드 -->
<script>
	//모델 데이터를 가져온 후에 아래 차트가 그려져야한다 -> 동기로 처리해야한다
	//async 값을 false로 변경
	let xModel = []; //키 배열
	let yModel = []; //값 배열
	let barColorsModel = ['#F29661','#E5D85C','#86E57F','#6799FF'];//갯수가 모자르면 회색으로 채움 
	$.ajax({
		async:false //동기처리
		,url : '/online_test/teacher/teacherTestAvgScore'
		,type : 'get'
		,success : function(model){ //모델: /restApi/monthData 백엔드에서 객체로 변환 -> 변환이 필요
			for(let attr in model)//attr에는 키(속성)값 {1:500, 2:400 ...}
				{
					xModel.push(attr); //1,2, ...
					yModel.push(model[attr]); //500, 400, ...
				}
		}
	});
</script>

<!-- 차트를 그리는 코드 -->
<script>
	var xValues = xModel;
	var yValues = yModel;
	var barColors = barColorsModel;
	
	new Chart("myChart", {
	  type: "bar",
	  data: {
	    labels: xValues,
	    datasets: [{
	      backgroundColor: barColors,
	      data: yValues
	    }]
	  },
	  options: {
	    legend: {display: false},
	    title: {
	      display: true,
	      text: "시험별 평균"
	    },
	    
	    scales : {
			yAxes : [ {
				ticks : {
					beginAtZero : true, // 0부터 시작하게 합니다.
					stepSize: 10,   // 1 씩 증가하도록 설정합니다.
					max:50
				}
			} ]
		}


	  }
	});
</script>
</html>