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
<!-- Link & script -->
	<jsp:include page="/inc/HTMLHead.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Teacher Test Modify</title>
</head>
<body>
	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<h4 class="mb-2">시험 수정</h4><br>
					
						<form action="${pageContext.request.contextPath }/teacher/teacherModifyTest"  method="post" class="mb-3" >
							
							<div class="mb-3">
								<label for="email" class="form-label">시험 번호</label>
								<input
									class="form-control"
									type="text" 
									name="testNo" value="${testNo }"  readonly="readonly"
								/>
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">시험 제목</label>
								<input
									class="form-control"
									type="text"  
									name="testTitle" value="${testTitle }"
								/>
							</div>
							
							<div class="mb-3">
								<label for="email" class="form-label">시험 날짜</label>
								<input
									class="form-control"
									type="text"  
									name="testDate" value="${testDate }"
								/>
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