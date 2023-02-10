<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	<h1>학생 추가</h1>
	<div>
		<input type="text" id="id">
		<button type="button" id="ckBtn">중복검사</button>
	</div>
	<div>${errorMsg}</div>
	<form action="${pageContext.request.contextPath}/employee/student/addStudent" method="post" id="addStudentForm">
		<table>
			<tr>
				<td>학생 ID : </td>
				<td><input type="text" id="studentId" name="studentId" readonly="readonly"></td>
			</tr>
			<tr>
				<td>학생 PW : </td>
				<td><input type="password" id="studentPw" name="studentPw"></td>
			</tr>
			<tr>
				<td>학생 이름 : </td>
				<td><input type="text" id="studentName" name="studentName"></td>
			</tr>
		</table>
		<button type="submit">추가</button>
	</form>
</body>
<script>
	$('#ckBtn').click(function(){
		$.ajax({
			url:'studentIdck'
			, type:'get'
			, data : {studentId:$('#id').val()}
			, success:function(model){
				if(model =='YES')//사용가능
					{
						$('#studentId').val($('#id').val());
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