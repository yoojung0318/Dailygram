<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<title>로그인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="content d-flex justify-content-center">
			<div class="col-4">
				<img src="https://images.pexels.com/photos/1267291/pexels-photo-1267291.jpeg" class="mainImg" width="300">
			</div>
			<div>
				<div class="login-box d-flex justify-content-center align-items-start bg-white  border rounded">		
					<div class="w-100 p-5">			
						<h2 class="text-center dailygram">dailygram</h2>
						<br>
						<form id="loginForm">
							<input type="text" id="loginIdInput" class="form-control mt-3" placeholder="아이디">
							<input type="password" id="passwordInput" class="form-control mt-3" placeholder="패스워드">
							<button id="loginBtn" type="submit" class="btn btn-primary btn-block mt-3">로그인</button>
							<hr/>
							<div class="mt-4 p-3 d-flex justify-content-center align-items-start bg-white  border rounded">
								<a href="/user/signup/view">가입하기</a>
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$("#loginForm").on("submit", function(e) {
				// 해당 이벤트가 가지고 있는 기능을 비활성화 
				e.preventDefault();
				
				// loginId 와 password 를 통해서 로그인 진행
				// 로그인 api 호출
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				
				if(loginId == "") {
					
					alert("아이디를 입력하세요");
					return ;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/signin",
					data:{"loginId":loginId, "password":password},
					success:function(data) {
						
						if(data.result == "success") {
							location.href = "/post/timeline/view";
						} else {
							alert("아이디/비밀번호를 확인하세요!!");
						}
						
					},
					error:function() {
						alert("로그인 에러");
					}
				});
				
				
				
			});
			
			
		});
	
	</script>

</body>
</html>