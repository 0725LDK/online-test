<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html
  lang="en"
  class="light-style customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${pageContext.request.contextPath}/resource/assets/"
  data-template="vertical-menu-template-free"
>
<head>
<meta charset="UTF-8">
<!-- Link & script -->
	<jsp:include page="/inc/HTMLHead.jsp"></jsp:include>
<title> Teacher Example Modify </title>
</head>
<body>
	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<h4 class="mb-2">보기 수정</h4><br>
					
						<form action="${pageContext.request.contextPath }/teacher/teacherModifyExample" method="post" class="mb-3" >
							<input type="hidden" name="testNo" value="${testNo }">
							<input type="hidden" name="exampleNo" value="${exampleNo }">
							
							<div class="mb-3">
								<label for="email" class="form-label">문제 번호</label>
								<input
									class="form-control"
									type="text" 
									name="questionNo" value="${questionNo}" readonly="readonly"
								/>
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">보기 번호</label>
								<input
									class="form-control"
									type="text"  
									name="exampleIdx" value="${exampleIdx}" readonly="readonly"
								/>
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">보기 내용</label>
								<input
									class="form-control"
									type="text"  
									name="exampleTitle" value="${exampleTitle}"
								/>
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">정답 / 오답</label>
								<select name="exampleOx">
									<option value="정답">정답</option>
									<option value="오답">오답</option>
								</select>
							</div>
							
							<div class="mb-3">
								<button class="btn btn-primary d-grid w-100" type="submit">보기 수정</button><br>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<jsp:include page="/inc/coreJS.jsp"></jsp:include>


</body>
</html>