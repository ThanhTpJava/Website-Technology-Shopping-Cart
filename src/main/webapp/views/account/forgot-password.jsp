<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!doctype html>

	<head>
		<meta charset="utf-8">
		<title>FPT Polytechnic</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
		<style>
			body {
				background: #11468F;
				background: linear-gradient(to bottom, #c1dae4, aqua);

			}
		</style>
	</head>

	<body ng-app="myApp" ng-controller="myController" class="">

		<h5 class="card-title text-center fw-bolder">Đăng Nhập</h5>
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto ">
			<div class="card border-0 shadow rounded-3 my-5">
				<div class="card-body p-4 p-sm-5 bg-info-subtle">
					<form name="frmUser" class="was-validated m-auto " action="/PS22219_Thanhtp_ASM2/account/forgot-password"
						method="post">
						<div class="mb-3">
							<label for="validationTextarea" class="form-label">Email</label>
							<input type="email" minlength="3" maxlength="50" name="email" class="form-control"
								id="validationTextarea" placeholder="Nhập tên đăng nhập ở đây" required></input>
							<div ng-hide="frmUser.email.$valid" class="invalid-feedback text-danger">
								Vui lòng nhập tên đăng nhập trên 3 ký tự!
							</div>
						</div>
						<mark>${message }</mark>
						<div class="mb-3 text-center">
							<button class="btn btn-primary " type="submit">Lấy lại mật khẩu</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		</div>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
			crossorigin="anonymous"></script>
	</body>
	<script>
		var app = angular.module('myApp', []);
		app.controller('myController', function ($scope, $http) {
			$http.get('countries.js').then(
				function (r) {
					$scope.listCountries = r.data;
				}
			);
		});

	</script>

	</html>