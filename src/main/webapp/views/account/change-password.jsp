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

		<h5 class="card-title text-center fw-bolder">Đổi mật khẩu</h5>
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto ">
			<div class="card border-0 shadow rounded-3 my-5">
				<div class="card-body p-4 p-sm-5 bg-info-subtle">
					<form name="frmUser" class="was-validated m-auto " action="/PS22219_Thanhtp_ASM2/account/change-password"
						method="post">
						<div class="mb-3">
							<label for="validationTextarea" class="form-label">Username</label>
							<input type="text" name="id" value="${user.username }" class="form-control"
								id="validationTextarea" readonly="readonly"></input>
						</div>
						<div class="mb-3">
							<label for="validationTextarea" class="form-label">Email</label>
							<input type="email" name="email" value="${user.email }" class="form-control"
								id="validationTextarea" readonly="readonly"></input>
						</div>

						<div class="mb-3">
							<label for="validationTextarea" class="form-label">Mật khẩu mới của bạn</label>
							<input name="password" minlength="3" maxlength="50" type="password" id="floatingPassword"
								ng-model="password1" class="form-control" placeholder="Nhập mật khẩu của bạn ở đây"
								required min="3"></input>
							<div ng-hide="frmUser.password.$valid" class="invalid-feedback text-danger">
								Vui lòng nhập mật khẩu trên 3 ký tự!
							</div>
						</div>
						<div class="mb-3">
							<label for="validationTextarea" class="form-label">Nhập lại mật khẩu mới của bạn</label>
							<input name="password2" value="${user.password }" minlength="3" maxlength="50" type="password" id="floatingPassword"
								ng-model="password2" class="form-control" placeholder="Nhập mật khẩu của bạn ở đây"
								required min="3" validate-equal-to="password1"></input>

							<div ng-hide="frmUser.password2.$valid" class="invalid-feedback text-danger">
								Vui lòng nhập mật khẩu trên 3 ký tự và phải trùng với mật khẩu đã nhập ở trên!
							</div>
						</div>

						<div class="mb-3 text-center">
							<button class="btn btn-primary" formaction="/PS22219_Thanhtp_ASM2/account/change-password" type="submit">Xác nhận đổi mật khẩu</button>
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

		app.controller('myController', function ($scope) {
			$scope.password1 = '';
			$scope.password2 = '';
		});

		app.directive('validateEqualTo', function () {
			return {
				require: 'ngModel',
				link: function (scope, element, attrs, ngModelCtrl) {
					var validateEqual = function (value) {
						var valid = (value === scope.$eval(attrs.validateEqualTo));
						ngModelCtrl.$setValidity('equalTo', valid);
						return valid ? value : undefined;
					};

					ngModelCtrl.$parsers.push(validateEqual);
					ngModelCtrl.$formatters.push(validateEqual);

					scope.$watch(attrs.validateEqualTo, function () {
						ngModelCtrl.$setViewValue(ngModelCtrl.$viewValue);
					});
				}
			};
		});
	</script>

	</html>