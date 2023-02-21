<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>LOGIN</title>
</head>
<body>

	<!-- 로그인 전 -->
	<c:if test="${loginTeacher == null}">
		<div class="container-xxl">
			<div class="authentication-wrapper authentication-basic container-p-y">
				<div class="authentication-inner">
					<!-- Register -->
					<div class="card">
						<div class="card-body">
							<h4 class="mb-2">LOGIN</h4><br>
							<!-- 로그인 선택 메뉴 -->
							<c:import url="/WEB-INF/view/employee/inc/loginMenu.jsp"></c:import><br>
						
							<form action="${pageContext.request.contextPath}/loginTeacher" method="post" class="mb-3" >
								<div class="mb-3">
									<label for="email" class="form-label">ID</label>
									<input
										class="form-control"
										placeholder="Enter your ID"
										id="teacherId" type="text" name="teacherId" value="t1"
									/>
								</div>
								<div class="mb-3 form-password-toggle">
									<div class="d-flex justify-content-between">
										<label class="form-label" for="password">Password</label>
									</div>
									<div class="input-group input-group-merge">
										<input
											class="form-control"
											id="teacherPw" type="password" name="teacherPw"
											placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
											value="1234"
										/>
									</div>
								</div>
								<div class="mb-3">
									<button class="btn btn-primary d-grid w-100" id="loginFormBtn" type="submit">Login</button><br>
								</div>
	
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	
	<!-- 로그인 되어 있으면 -->
	<c:if test="${loginTeacher != null}">
		<div class="container-xxl">
			<div class="authentication-wrapper authentication-basic container-p-y">
				<div class="authentication-inner">
					<!-- Register -->
					<div class="card">
						<div class="card-body">
							<h4 class="mb-2">	${loginTeacher.teacherName} 님 반갑습니다.</h4><br>
							<div>
								<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	
	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<jsp:include page="/inc/coreJS.jsp"></jsp:include>
</body>
</html>
