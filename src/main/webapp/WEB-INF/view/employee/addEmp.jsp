<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h1>사원 추가</h1>
	<div>${errorMsg}</div>
	<!-- Id 중복 검사 -->
	<div>
		<input type="text" id="id">
		<button type="button" id="ckBtn">중복검사</button>
	</div>
	
	<form action="${pageContext.request.contextPath}/employee/addEmp" method="post" id="addEmpForm">
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
	
	
	$('#addBtn').click(function(){
		//폼 유효성검사	
		//폼액션전송	
	})
	
</script>

</html>