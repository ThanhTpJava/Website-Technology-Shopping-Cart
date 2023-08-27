<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

</head>
<body
	style="background-image: linear-gradient(to top, white, rgb(191, 185, 185));">
	<fmt:setLocale value="${sessionScope.lang}" scope="request" />
	<div class="row">
		<img data-href="/PS22219_Thanhtp_ASM2/list"
			class="col-1 navbar navbar-expand-lg navbar-light bg-light ps-4"
			alt="" src="views/list/images/logo2.png">
		<nav class="col-11 navbar navbar-expand-lg navbar-light bg-light ">
			<div class="container-fluid">
				<a class="navbar-brand" href="/PS22219_Thanhtp_ASM2/list"><fmt:message
						key="navbar.home" /></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav text-capitalize">
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="bi bi-cup-hot-fill"> </i> <fmt:message
									key="navbar.hot-deals" /></a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <i
								class="bi bi-telephone-fill"></i> <fmt:message
									key="navbar.customer-service" />
						</a></li>

						<li class="nav-item"><a class="nav-link" href="#"><i
								class="bi bi-credit-card-2-front-fill"></i> <fmt:message
									key="navbar.gift-card" /></a></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="bi bi-shop-window fw-blod"></i> <fmt:message
									key="navbar.sell" /></a></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="bi bi-list-task"></i> <fmt:message
									key="navbar.product-category" />
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">><fmt:message
											key="navbar.phone" /></a></li>
								<li><a class="dropdown-item" href="#"><fmt:message
											key="navbar.laptop" /></a></li>
								<li><a class="dropdown-item" href="#"><fmt:message
											key="navbar.accessories" /></a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#"><fmt:message
											key="navbar.allproduct" /></a></li>
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdown2"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="bi bi-list-task"></i> <fmt:message
									key="navbar.account" />
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown2">
								<li><a class="dropdown-item" href="account/sign-out"><fmt:message
											key="navbar.sign-out" /></a></li>
								<li><a class="dropdown-item" href="account/sign-up"><fmt:message
											key="navbar.sign-up" /></a></li>
								<li><a class="dropdown-item" href="account/sign-in"><fmt:message
											key="navbar.sign-out" /></a></li>
								<li><a class="dropdown-item" href="account/forgot-password"><fmt:message
											key="navbar.forgot-password" /></a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#"><fmt:message
											key="navbar.learn" /></a></li>
							</ul></li>
						<li class="nav-item"><a id="view" class="nav-link"
							href="/PS22219_Thanhtp_ASM2/cart?action=view"><i
								class="bi bi-cart-fill"></i> <span
								class="position-absolute top-3 start-93 translate-middle badge rounded-pill bg-danger">
									${sessionScope.cart.tongsl} <span class="visually-hidden">unread
										messages</span>
							</span> </a></li>
					</ul>

				</div>
			</div>
		</nav>
	</div>

	<a class="text-decoration-none ms-3" href="?lang=vi">Tieng Viet</a>
	<a class="text-decoration-none ms-3" href="?lang=en">English</a>
	<p class="nav-link d-flex text-danger justify-content-end fw-bold">
		<c:choose>
			<c:when test="${empty sessionScope.user}">
Xin chào bạn! Mời bạn đăng nhập
</c:when>
			<c:otherwise>
Xin chào bạn: ${sessionScope.user.fullname}
				<a class="text-decoration-none ms-3"
					href="/PS22219_Thanhtp_ASM2/account/sign-out">Đăng xuất</a>
				<c:if test="${sessionScope.user.role == 1}">
					<a class="text-decoration-none ms-3"
						href="/PS22219_Thanhtp_ASM2/account/edit-profile">Quản trị</a>
				</c:if>
			</c:otherwise>
		</c:choose>
	</p>
</body>

</html>