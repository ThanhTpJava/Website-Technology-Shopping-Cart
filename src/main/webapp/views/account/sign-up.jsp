<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>

<head>
<meta charset="utf-8">
<title>FPT Polytechnic</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<style>
body {
	background: #11468F;
	background: linear-gradient(to bottom, #c1dae4, aqua);
}
</style>
</head>

<body ng-app="myApp" ng-controller="myController" class="">

	<h5 class="card-title text-center fw-bolder">Đăng Ký</h5>
	<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
		<div class="card border-0 shadow rounded-3 my-5">
			<div class="card-body p-4 p-sm-5 bg-info-subtle">
				<form name="frmUser" class="was-validated m-auto "
					action="/PS22219_Thanhtp_ASM2/account/sign-up" method="post">
					<div class="mb-3">
						<label for="validationTextarea" class="form-label">Tên
							đăng nhập</label> <input minlength="3" maxlength="50" name="username"
							class="form-control" id="validationTextarea"
							placeholder="Nhập tên đăng nhập ở đây" required></input>
						<div ng-hide="frmUser.username.$valid"
							class="invalid-feedback text-danger">Vui lòng nhập tên đăng
							nhập trên 3 ký tự!</div>
					</div>

					<div class="mb-3">
						<label for="validationTextarea" class="form-label">Mật
							khẩu</label> <input name="password" minlength="3" maxlength="50"
							type="password" id="floatingPassword" name="password"
							class="form-control" placeholder="Nhập mật khẩu của bạn ở đây"
							required min="3"></input>
						<div ng-hide="frmUser.password.$valid"
							class="invalid-feedback text-danger">Vui lòng nhập mật khẩu
							trên 3 ký tự!</div>
					</div>

					<div class="mb-3">
						<label for="validationTextarea" class="form-label">Điện thoại</label> <input minlength="3" maxlength="50" name="phone"
							class="form-control" id="validationTextarea"
							placeholder="Nhập tên đăng nhập ở đây" required></input>
						<div ng-hide="frmUser.username.$valid"
							class="invalid-feedback text-danger">Vui lòng nhập tên đăng
							nhập trên 3 ký tự!</div>
					</div>
<div class="mb-3">
						<label for="validationTextarea" class="form-label">Tên
							đăng nhập</label> <input minlength="3" maxlength="50" name="username"
							class="form-control" id="validationTextarea"
							placeholder="Nhập tên đăng nhập ở đây" required></input>
						<div ng-hide="frmUser.username.$valid"
							class="invalid-feedback text-danger">Vui lòng nhập tên đăng
							nhập trên 3 ký tự!</div>
					</div>

					<div class="mb-3">
						<label for="validationTextarea" class="form-label">Email</label> <input
							type="email" minlength="3" maxlength="50" name="email"
							class="form-control" id="validationTextarea"
							placeholder="Nhập tên đăng nhập ở đây" required></input>
						<div ng-hide="frmUser.username.$valid"
							class="invalid-feedback text-danger">Vui lòng nhập email</div>
					</div>



					<div class="mb-3">
						<label for="role" class="form-label">Role</label>
						<div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="role"
									id="admin" value="1" ${user.role == 1?'checked':''}> <label
									class="form-check-label" for="admin">Admin</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="role"
									id="user" value="0" ${user.role == 0?'checked':''}> <label
									class="form-check-label" for="user">User</label>
							</div>
						</div>
					</div>

					<div class="form-check mb-3">
						<input type="checkbox" name="married" class="form-check-input"
							id="validationFormCheck1"> <label
							class="form-check-label" for="validationFormCheck1">Đã có
							gia đình?</label>
						<!-- <div class="invalid-feedback">Example invalid feedback text</div> -->
					</div>

					<label for="validationTextarea" class="form-label">Giới
						tính</label>

					<div class="row">
						<div class="form-check col-auto">
							<input type="radio" class="form-check-input"
								id="validationFormCheck2" name="gender" value="true" checked
								required> <label class="form-check-label"
								for="validationFormCheck2">Nam</label>
						</div>
						<div class="form-check col-auto">
							<input type="radio" class="form-check-input"
								id="validationFormCheck3" name="gender" value="true" required>
							<label class="form-check-label" for="validationFormCheck3">Nữ</label>
						</div>
					</div>

					<label for="validationTextarea" class="form-label">Sở thích</label>
					<div class="row mb-3">
						<div class="form-check col-3">
							<input name="hobbies" class="form-check-input" type="checkbox"
								value="T" id="travelCheckbox"> <label
								class="form-check-label" for="travelCheckbox"> Du lịch </label>
						</div>
						<div class="form-check col-3">
							<input name="hobbies" class="form-check-input" type="checkbox"
								value="R" id="musicCheckbox"> <label
								class="form-check-label" for="musicCheckbox"> Đọc sách </label>
						</div>
						<div class="form-check col-3">
							<input name="hobbies" class="form-check-input" type="checkbox"
								value="M" id="soccerCheckbox"> <label
								class="form-check-label" for="soccerCheckbox"> Âm nhạc </label>
						</div>
						<div class="form-check col-3">
							<input name="hobbies" class="form-check-input" type="checkbox"
								value="O" id="otherCheckbox"> <label
								class="form-check-label" for="otherCheckbox"> Khác </label>
						</div>
					</div>


					<label for="validationTextarea" class="form-label">Quốc
						tịch</label>
					<div class="mb-3">
						<select class="form-select" aria-label="select example">
							<option value="">Mời chọn địa chỉ</option>
							<option value="VN">Việt Nam</option>
							<option value="US">Mỹ</option>
						</select>
						<div class="invalid-feedback text-danger">Mời chọn địa chỉ</div>
					</div>

					<div class="mb-3">
						<label for="validationTextarea" class="validationTextarea">Ghi
							chú</label>
						<textarea name="notes" class="form-control"
							placeholder="Nhập ghi chú ở đây"></textarea>
					</div>
					<!-- <div class="mb-3">
							<input type="file" class="form-control" aria-label="file example" required>
							<div class="invalid-feedback">Example invalid form file feedback</div>
						</div> -->
					<mark>${message}</mark>
					<div class="mb-3 text-center">
						<button class="btn btn-primary " type="submit">Xác nhận
							đăng ký</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
<script>
	var app = angular.module('myApp', []);
	app.controller('myController', function($scope, $http) {
		$http.get('countries.js').then(function(r) {
			$scope.listCountries = r.data;
		});
	});
</script>

</html>