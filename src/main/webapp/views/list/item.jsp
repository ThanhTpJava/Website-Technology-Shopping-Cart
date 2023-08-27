<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- card -->
		<div class="col-sm-8">
			<div class="card p-3 rounded-0 border border-warning"
				style="border: 2.5px solid #53D397 !important;">
				<img src="images/${param.hinh }"
					class="card-img-top p-3 rounded-0 border border-warning" alt="..."
					style="border: 2.5px solid #AFFFDF !important;">
				<div class="card-body p-1" style="background-color: #AFFFDF;">
					<!-- <h5 class="card-title">Card title</h5> -->
					<p class="card-text text-center fw-bold">${param.name }</p>
				</div>
			</div>
		</div>
</body>
</html>