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

<title>Modify Student PW</title>
</head>
<body>
<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<h4 class="mb-2">${loginStudent.studentName }님 비밀번호 수정</h4><br>
						<!-- 로그인 선택 메뉴 -->
						<a href="${pageContext.request.contextPath }/student/studentTestList">[ 시험목록으로 ]</a><br><br>		
						<form action="${pageContext.request.contextPath}/student/studentModifyPw" method="post" class="mb-3" >
							<div class="mb-3">
								<label for="email" class="form-label">이전 비밀번호</label>
								<input
									class="form-control"
									placeholder="Enter your oldPw"
									type="password" name="oldPw" 
								/>
							</div>
							<div class="mb-3 form-password-toggle">
								<div class="d-flex justify-content-between">
									<label class="form-label" for="password">Password</label>
								</div>
								<div class="input-group input-group-merge">
									<input
										class="form-control"
										type="password" name="newPw"
										placeholder="Enter your newPw"
									/>
								</div>
							</div>
							<div class="mb-3">
								<button class="btn btn-primary d-grid w-100" type="submit">변경</button><br>
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