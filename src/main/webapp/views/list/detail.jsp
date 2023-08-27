<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<meta charset="UTF-8">
<title>PS22219_Thanhtp_ASM2</title>
<style type="text/css">
.col-2>img {
	width: 200px;
	height: 200px;
	padding: 5px;
}
</style>
</head>
<body>

	<div class="container">
		<%@include file="menu.jsp"%>
		<div class="row mt-5">
			<div class="col-sm-4 ms-10">
				<div class="card p-3 rounded-0 border border-warning"
					style="border: 2.5px solid #666666 !important;">
					<div class="card-title">
						<h5 class="card-text text-center fw-bold">${item.tensp}</h5>
					</div>
					<img class="card-img-top rounded-0 border border-warning p-5"
						alt="..." style="border: 2.5px solid #EFEFEF !important;"
						height="400px" width="400px" src="views/list/images/${item.hinh }">

				</div>


			</div>

			<div class="col-sm-5">
				<div class="card p-3 rounded-0 border border-warning"
					style="border: 2.5px solid #EFEFEF !important;">
					<div class="card-body p-1">
						<!-- <h5 class="card-title">Card title</h5> -->
						<input type="hidden" id="maSP" value="${item.masp}"/>
						<input type="hidden" id="soLuongTrongKho" value="${item.soluong}"/>
						<li class="card-text h5 lh-lg">Tên sản phẩm: ${item.tensp}</strike>
						</li>
						<li class="card-text h5 lh-lg">Giá sản phẩm: <fmt:formatNumber
								value="${item.giasp}"></fmt:formatNumber> VND
						</li>
						<li class="card-text h5 lh-lg">Hàng tồn: ${item.soluong }</li>
						<p class="card-text h5 lh-lg">${item.mota }</p>
						<div class="row">
							<label class="form-control" >Số lượng: <input id="soLuongMua" type="number"
								class="form-control text-center"></label>

							<button class="btn btn-success mt-3" type="button" id="addToCart">Thêm vào giỏ
								hàng</button>
						</div>
						<%-- 						<li class="card-text fw-bold h5 lh-lg">Giá mới: <c:set
								var="newprice" value="${item.price*(1-item.discount)}" /> <fmt:formatNumber
								value="${newprice}" />VND
						</li> --%>

						<%-- 						<li class="card-text fw-bold h5 lh-lg">Mức giá <c:choose>
								<c:when test="${newprice < 10}">Giá thấp</c:when>
								<c:when test="${newprice> 100}">Giá cao</c:when>
								<c:otherwise>Bình thường</c:otherwise>
							</c:choose>
						</li> --%>
					</div>
				</div>
			</div>

			<div class="col-sm-3">
				<%@include file="slice.jsp"%>
				<%@include file="login.jsp"%>
				<%@include file="category.jsp"%>
			</div>

			<div class="container">
				<h2 class="text-danger fs-3 fw-bold ms-2">Các sản phẩm khác</h2>
				<div class="row mt-3">
					<div class="col-2">
						<a href="/PS22219_Thanhtp_ASM2/list"><img
							src="views/list/images/1.jpg" class="img-fluid"></a>
					</div>
					<div class="col-2">
						<a href="/PS22219_Thanhtp_ASM2/list"><img
							src="views/list/images/2.jpg" class="img-fluid"></a>
					</div>
					<div class="col-2">
						<a href="/PS22219_Thanhtp_ASM2/list"><img
							src="views/list/images/3.jpg" class="img-fluid"></a>
					</div>
				</div>
			</div>

			<%@include file="footer.jsp"%>
		</div>
		<%-- 	</div>
	Tên sản phẩm: ${item.name} Giá gốc:
	<strike>${item.price}</strike> Giá mới:
	<c:set var="newprice" value="${item.price*(1-item.discount)}" />
	<fmt:formatNumber value="${newprice}" />
	Mức giá
	<c:choose>
		<c:when test="${newprice < 10}">Giá thấp</c:when>
		<c:when test="${newprice> 100}">Giá cao</c:when>
		<c:otherwise>Bình thường</c:otherwise>
	</c:choose> --%>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
			crossorigin="anonymous"></script>
		<script type="text/javascript">
			const img = document.querySelector('img[data-href]');
			img.addEventListener('click', function() {
				window.location.href = this.dataset.href;
			});
		</script>
</body>
 <script>
    	$('#addToCart').click(function() {
    		var maSP = $('#maSP').val();
    		var soLuongMua = parseInt($('#soLuongMua').val());
    		var soLuongTrongKho = parseInt($('#soLuongTrongKho').val());
    		
    		if (soLuongMua > soLuongTrongKho || soLuongMua < 1) {
    			alert('Kiểm tra lại số lượng');
    		} else {
    			$.ajax({
        	        url: 'cart?action=add&masp=' + maSP + '&soluong=' + soLuongMua + '&isUpdate=0',
        	        dataType : 'json'
        	    }).then(function(data) {
        	    	alert('Thêm thành công vào giỏ hàng!');
        	    	$('#countTotal').text(data.tongsl);
        	    }).fail(function(error) {
        	    	alert('Thêm thất bại, vui lòng thử lại!'+ error);
        	    });
    		}
    	})

    </script>
</html>