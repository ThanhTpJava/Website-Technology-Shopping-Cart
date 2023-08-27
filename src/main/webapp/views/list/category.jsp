<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="accordion mt-3 fw-bolder"
		style="border: 2.5px solid #666666 !important;" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingOne">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="true" aria-controls="collapseOne">Danh mục</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse show"
				aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul class="list-group">
						<c:forEach var="dm" items="${dm }">
							<a class="text-decoration-none" href="list?madm=${dm.madm }">
								<li class="list-group-item d-flex justify-content-between align-items-center">
									${dm.tendanhmuc } <span class="badge bg-danger rounded-pill">14</span>
							</li>
							</a>

						</c:forEach>


					</ul>
				</div>
			</div>
		</div>
		<!-- <div class="accordion-item">
			<h2 class="accordion-header" id="headingTwo">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseTwo"
					aria-expanded="false" aria-controls="collapseTwo">Máy tính
					xách tay</button>
			</h2>
			<div id="collapseTwo" class="accordion-collapse collapse"
				aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul class="list-group">
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							LenoVo <span class="badge bg-danger rounded-pill">14</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							Acer <span class="badge bg-danger rounded-pill">2</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							Asus <span class="badge bg-danger rounded-pill">1</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingThree">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseThree"
					aria-expanded="false" aria-controls="collapseThree">Phụ
					kiện Điện thoại + Laptop</button>
			</h2>
			<div id="collapseThree" class="accordion-collapse collapse"
				aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul class="list-group">
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							Tay nghe <span class="badge bg-danger rounded-pill">14</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							Dây sạc <span class="badge bg-danger rounded-pill">2</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							Keo tản nhiệt <span class="badge bg-danger rounded-pill">1</span>
						</li>
					</ul>
				</div>
			</div>
		</div>


		<div class="accordion-item">
			<h2 class="accordion-header" id="headingThree">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapse4"
					aria-expanded="false" aria-controls="collapseThree">Đồng hồ</button>
			</h2>
			<div id="collapse4" class="accordion-collapse collapse"
				aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul class="list-group">
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							Treo tường <span class="badge bg-danger rounded-pill">14</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							Đeo tay<span class="badge bg-danger rounded-pill">2</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							Mạ kim loại <span class="badge bg-danger rounded-pill">1</span>
						</li>
					</ul>
				</div>
			</div>
		</div> -->

	</div>
</body>
</html>