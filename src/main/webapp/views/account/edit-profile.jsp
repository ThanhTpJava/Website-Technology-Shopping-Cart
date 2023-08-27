<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Form and Table Example</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css">
<style>
body {
	background: #11468F;
	background: linear-gradient(to bottom, #c1dae4, aqua);
}

table {
	background-color: #f5f5f5;
	/* Change background color */
	border-color: #ABC9FF !important;
	/* Change border color */
}

thead {
	background-color: rgba(0, 0, 0, 0.731);
	color: white;
}
</style>
</head>
<body class="fs-3">
	<p class="nav-link d-flex text-danger justify-content-end fw-bold col-10">
		<c:choose>
			<c:when test="${empty sessionScope.user}">
Xin chào bạn! Mời bạn đăng nhập
</c:when>
			<c:otherwise>
Xin chào bạn: ${sessionScope.user.fullname}
				<a class="text-decoration-none ms-3" href="/PS22219_Thanhtp_ASM2/account/sign-out">Đăng xuất</a>
				<c:if test="${sessionScope.user.role == 1}">
					<a class="text-decoration-none ms-3" href="/PS22219_Thanhtp_ASM2/account/edit-profile">Quản trị</a>
				</c:if>
			</c:otherwise>
		</c:choose>
	</p>

	<form
		class="col-md-8 m-auto mb-5 mt-3 was-validated border border-primary rounded-1 p-3"
		style="border: solid #ABC9FF 3px !important;"
		action="/PS22219_Thanhtp_ASM2/account/edit-profile" method="post">
		<h2>Form</h2>
		<div class="mb-3">
			<label for="username" class="form-label">Username</label> <input
				type="text" class="form-control" id="username" name="id"
				placeholder="Enter username" value="${user.id}">
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">Password</label> <input
				type="password" class="form-control" id="password" name="password"
				placeholder="Enter password" value="${user.password}">
		</div>
		<div class="mb-3">
			<label for="fullname" class="form-label">Fullname</label> <input
				type="text" class="form-control" id="fullname" name="fullname"
				placeholder="Enter fullname" value="${user.fullname}">
		</div>
		<div class="mb-3">
			<label for="email" class="form-label">Email Address</label> <input
				type="email" class="form-control" id="email" name="email"
				placeholder="Enter email" value="${user.email}">
		</div>
		<div class="mb-3">
			<label for="role" class="form-label">Role</label>
			<div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="role"
						id="role" value="1" ${user.role == 1?'checked':''}> <label
						class="form-check-label" for="role">Admin</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="role" id="user"
						value="0" ${user.role == 0?'checked':''}> <label
						class="form-check-label" for="user">User</label>
				</div>
			</div>
		</div>
		<mark>${message}</mark>
		<div class="text-center">
			<button formaction="/PS22219_Thanhtp_ASM2/create" type="submit"
				class="btn btn-primary fs-3">Create</button>
			<button formaction="/PS22219_Thanhtp_ASM2/update" type="submit"
				class="btn btn-secondary fs-3">Update</button>
			<button formaction="/PS22219_Thanhtp_ASM2/delete" type="submit"
				class="btn btn-danger fs-3">Delete</button>
			<button formaction="/PS22219_Thanhtp_ASM2/account/sign-out"
				type="submit" class="btn btn-danger fs-3">Log out</button>
			<button type="submit" class="btn btn-warning fs-3">Reset</button>
		</div>

	</form>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		function deleteUser(idtable) {
			if (confirm("Are you sure you want to delete this user?")) {
				var xhr = new XMLHttpRequest();
				xhr.open("POST", "deleteUser", true);
				xhr.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						window.location.reload();
					}
				}
				console.log(idtable);
				xhr.send(idtable);
			}
		}
	</script>


</body>
</html>
