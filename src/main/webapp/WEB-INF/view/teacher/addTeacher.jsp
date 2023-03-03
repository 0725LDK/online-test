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
<title> </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<h4 class="mb-2">학생 추가</h4><br>
						<!-- 로그인 선택 메뉴 -->
						<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import><br>
					
						<form action="${pageContext.request.contextPath}/employee/teacher/addTeacher" method="post" class="mb-3" >
							<div class="mb-3">
								<label for="email" class="form-label">강사 ID 중복 체크</label>
								<input
									class="form-control"
									placeholder="Enter use ID"
									id="id" type="text" 
								/><br>
								<div class="mb-3">
									<button class="btn btn-primary d-grid w-100" type="button" id="ckBtn">중복검사</button><br>
								</div>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">강사 ID</label>
								<input
									class="form-control"
									id="teacherId" name="teacherId" readonly="readonly"
								/>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">강사 PW</label>
								<input
									class="form-control"
									placeholder="Enter your PW"
									id="teacherPw" name="teacherPw"
								/>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">강사 이름</label>
								<input
									class="form-control"
									placeholder="Enter your Name"
									id="teacherName" name="teacherName"
								/>
							</div>
							
							<div class="mb-3">
								<button class="btn btn-primary d-grid w-100" type="submit">강사 추가</button><br>
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
<script>
	$('#ckBtn').click(function(){
		$.ajax({
			url:'teacherIdck'
			, type:'get'
			, data : {teacherId:$('#id').val()}
			, success:function(model){
				if(model =='YES')//사용가능
					{
						$('#teacherId').val($('#id').val());
					}
				else //사용불가
					{
						alert($('#id').val()+'는 사용중인 아이디입니다.');
					}
			}
		});
		
	});

</script>
</html>