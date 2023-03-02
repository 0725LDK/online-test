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
<meta charset="UTF-8">
<title>Add Emp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	
			<div class="container-xxl">
			<div class="authentication-wrapper authentication-basic container-p-y">
				<div class="authentication-inner">
					<!-- Register -->
					<div class="card">
						<div class="card-body">
							<h4 class="mb-2">사원추가</h4><br>
							<!-- 로그인 선택 메뉴 -->
							<c:import url="/WEB-INF/view/employee/inc/loginMenu.jsp"></c:import><br>
						
							<form action="${pageContext.request.contextPath}/employee/addEmp" method="post" class="mb-3" >
								<div class="mb-3">
									<label for="email" class="form-label">직원 ID 중복 체크</label>
									<input
										class="form-control"
										placeholder="Enter use ID"
										id="id" type="text" 
									/><br>
									<div class="mb-3">
										<button class="btn btn-primary d-grid w-100" type="submit" id="ckBtn">중복검사</button><br>
									</div>
								</div>
								<div class="mb-3">
									<label for="email" class="form-label">직원 ID</label>
									<input
										class="form-control"
										id="empId" type="text" name="empId" readonly="readonly"
									/>
								</div>
								<div class="mb-3">
									<label for="email" class="form-label">직원 PW</label>
									<input
										class="form-control"
										placeholder="Enter your PW"
										id="empPw" type="password" name="empPw" 
									/>
								</div>
								<div class="mb-3">
									<label for="email" class="form-label">직원 이름</label>
									<input
										class="form-control"
										placeholder="Enter your Name"
										id="empName" type="text" name="empName"
									/>
								</div>
								
								<div class="mb-3">
									<button class="btn btn-primary d-grid w-100" type="submit">직원 추가</button><br>
								</div>
	
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<h1>사원 추가</h1>
	<div>${errorMsg}</div>
	<!-- Id 중복 검사 -->
	<div>
		<input type="text" id="id">
		<button type="button" id="ckBtn">중복검사</button>
	</div>
	
	<form action="${pageContext.request.contextPath}/employee/addEmp" method="post" >
		<table>
			<tr>
				<td>직원 ID : </td>
				<td><input type="text" id="empId" name="empId" readonly="readonly"></td>
			</tr>
			<tr>
				<td>직원 PW : </td>
				<td><input type="password" id="empPw" name="empPw"></td>
			</tr>
			<tr>
				<td>직원 이름 : </td>
				<td><input type="text" id="empName" name="empName"></td>
			</tr>
		</table>
		<button type="submit" id="addEmpBtn">추가</button>
	</form>
</body>
<script>
	$('#ckBtn').click(function(){
		$.ajax({
			url:'empIdck'
			, type:'get'
			, data : {empId:$('#id').val()}
			, success:function(model){
				if(model =='YES')//사용가능
					{
						$('#empId').val($('#id').val());
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