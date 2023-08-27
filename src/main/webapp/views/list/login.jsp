<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/PS22219_Thanhtp_ASM2/list">
		<div class="mt-2 p-5 bg-white"
			style="border: 2.5px solid #666666 !important;">
			<!-- login small -->
			<input value="${form.username }" type="text" name="username"
				class="form-control mb-2" placeholder="Username?"> <input
				value="${form.password }" type="text" name="password"
				class="form-control mb-2" placeholder="Password" id="">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value=""
					id="flexCheckDefault"> <label class="form-check-label"
					for="flexCheckDefault"> Remember me? </label>
			</div>
			<button class="btn btn-primary float-end">Login</button>
		</div>
	</form>

</body>
</html>