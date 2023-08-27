<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<article class="col-9">
		<div class="row row-cols-1 row-cols-md-3 g-4">

			<c:forEach var="item" items="${items }">

				<div class="col">
					<div class="card p-3 rounded-0 border border-warning"
						style="border: 2.5px solid #666666 !important;">
						<a class="text-decoration-none"
							href="/PS22219_Thanhtp_ASM2/detail?id=${item.masp}">
							<div class="card-title text-center fw-bold text-dark" style="">${item.tensp }</div>
							<img src="views/list/images/${item.hinh}"
							class="card-img-top p-3 rounded-0 border border-warning"
							alt="..." style="border: 2.5px solid #EFEFEF !important;">
						</a>

						<div class="card-body p-1" style="">

							<p class="card-text text-center text-dark fw-bold ">
								<fmt:formatNumber value="${item.giasp} "></fmt:formatNumber>
								VNĐ
							</p>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<!-- Phần chuyển trang -->

		<div aria-label="Page navigation example"
			class="mt-5 d-flex justify-content-center">
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					href="?list=${currentPage - 1}" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
				<c:forEach var="i" begin="0" end="${totalPages -1}">
					<li class="page-item ${currentPage == i ? 'active' : ''}"><a
						class="page-link" href="?page=${i}">${i+1}</a></li>
				</c:forEach>
				<li class="page-item"><a class="page-link"
					href="?list=${currentPage + 1}" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span>
				</a></li>

				<!-- <div aria-label="Page navigation example"
					class="mt-5 d-flex justify-content-center">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</div> -->
	</article>
</body>
</html>