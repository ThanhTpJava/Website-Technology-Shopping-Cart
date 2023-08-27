<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script src="app.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.col-2>img {
	width: 200px;
	height: 200px;
	padding: 5px;
}

th, td {
	text-align: center;
}

td {
	margin-top: 20px !important;
}
</style>
</head>
<body>

	<div class="container">
		<%@include file="menu.jsp"%>

		<table class="table table-hover table-borered">
			<tr>
				<th>Tên sản phẩm</th>
				<th>Hình</th>
				<th>Số lượng</th>
				<th>Giá</th>
				<th>Thành tiền</th>
				<th>Xóa</th>
			</tr>
			<tbody>
				<c:forEach var="cartDetail" items="${sessionScope.cart.detail}">
					<tr id="tr-${cartDetail.value.masp}">
						<td class="align-middle">${cartDetail.value.tensp}</td>
						<td><img style="height: 100px;" class="img-fluid"
							src="views/list/images/${cartDetail.value.hinh}"></td>
						<td class="align-middle"><input
							id="slMua-${cartDetail.value.masp}"
							onchange="updateCart('${cartDetail.value.masp}')" type="number"
							class="form-control-sm text-center"
							value="${cartDetail.value.slMua}"></td>
						<td class="align-middle"><fmt:formatNumber type="number"
								maxFractionDigits="3" value="${cartDetail.value.giasp}" /></td>
						<td class="align-middle"><span
							id="totalSP-${cartDetail.value.masp}"> <fmt:formatNumber
									type="number" maxFractionDigits="3"
									value="${cartDetail.value.giasp * cartDetail.value.slMua}" />
						</span></td>
						<td class="align-middle"><button
								onclick="removeSP('${cartDetail.value.masp}')"
								class="btn btn-danger" type="button">X</button></td>
					</tr>
					<input type="hidden" id="giaSP-${cartDetail.value.masp}"
						value="${cartDetail.value.giasp}" />
				</c:forEach>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td><strong id="countTotal">
							${sessionScope.cart.tongsl}</strong></td>
					<td>&nbsp;</td>
					<td><strong id="tongTien"><fmt:formatNumber
								type="number" maxFractionDigits="3"
								value="${sessionScope.cart.tongtien}" /></strong></td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>

		<%@include file="footer.jsp"%>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
	<script>
 		function removeSP(maSP) {
			$.ajax({
				url : 'cart?action=add&masp=' + maSP + '&soluong=0&isUpdate=0',
				dataType : 'json'
			}).then(function(data) {
				$('#tongTien').text(numberWithDot(data.tongtien));
				$('#countTotal').text(data.tongsl);
				var idRemoveTag = '#tr-' + maSP;
				$(idRemoveTag).remove();
			}).fail(function(error) {
				alert('Xóa thất bại, vui lòng thử lại!');
			});
		} 

/* 		function removeSP(maSP) {
			  $.ajax({
			    url: 'cart?action=add&masp=' + maSP + '&soluong=0&isUpdate=0',
			    dataType: 'json'
			  }).then(function (data) {
			    $('#tongTien').text(numberWithDot(data.tongtien));
			    $('#countTotal').text(data.tongsl);

			    var cartDetail = ${sessionScope.cart.detail};
			    for (var i = 0; i < cartDetail.length; i++) {
			      if (cartDetail[i].masp === maSP) {
			        cartDetail.splice(i, 1);
			        break;
			      }
			    }
			    $('#tr-' + maSP).remove();
			  }).fail(function (error) {
			    alert('Xóa thất bại, vui lòng thử lại!');
			  });
			} */

		
		function updateCart(maSP) {
			var idInputSL = '#slMua-' + maSP;
			var slUpdate = $(idInputSL).val();
			var idInputGiaSP = '#giaSP-' + maSP;
			var giaSP = parseFloat($(idInputGiaSP).val());
			if (parseInt(slUpdate) < 1) {
				removeSP(maSP);
			} else {
				$.ajax(
						{
							url : 'cart?action=add&masp=' + maSP + '&soluong='
									+ slUpdate + '&isUpdate=1',
							dataType : 'json'
						}).then(
						function(data) {
							$('#tongTien').text(numberWithDot(data.tongtien));
							$('#countTotal').text(data.tongsl);
							var tongTienSPUpdate = parseFloat(giaSP
									* parseInt(slUpdate));
							let idTongGiaSP = '#totalSP-' + maSP;
							$(idTongGiaSP)
									.text(numberWithDot(tongTienSPUpdate));
						}).fail(function(error) {
					alert('Cập nhật thất bại, vui lòng thử lại!');
				});
			}
		}

	/* 	$('#payNow').click(
				function() {
					var checkUserLogin = $('#checkUserLogin').val();
					if (checkUserLogin.length == 0) {
						window.location.href = "login";
						return;
					}

					var phone = $('#phoneNumber').val();
					var address = $('#address').val();
					if (phone.length == 0) {
						alert('Vui lòng nhập sdt');
						$('#phoneNumber').focus();
						return;
					}
					;
					if (address.length == 0) {
						alert('Vui lòng nhập địa chỉ');
						$('#address').focus();
						return;
					}

					$.ajax(
							{
								url : 'cart?action=paying&phone=' + phone
										+ '&address=' + address,
								dataType : 'json'
							}).then(function(data) {
						alert('Thanh toán thành công!');
						window.location.href = "index";
					}).fail(function(error) {
						alert('Thanh toán thất bại, vui lòng thử lại!');
					});
				})
 */
		function numberWithDot(x) {
			return x.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ".");
		}
	</script>
</body>
</html>