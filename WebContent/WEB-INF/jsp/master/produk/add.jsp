<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Produk</title>
<link type="text/css" href='<c:url value = "/resources/css/validasi.css"/>' rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery.validate.js"/>'></script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#tambahData').validate({
			rules : {
				namaProduk : "required",
				jmlProduk: {
					required: true,
					number:true
				},
				harga: {
					required: true,
					number:true
				},
				satuan :{
					required: true
				},
				kategori :{
					required: true
				}
			},
			
			messages : {
				namaProduk: {
					required: 'Nama Produk Harus Diisi'
				},
				jmlProduk: {
					required: 'Jumlah Produk Harus Diisi',
					number: 'Jumlah Produk Harus Angka'
				},
				harga: {
					required: 'Harga Harus Diisi',
					number: 'Harga Harus Angka'
				}
			},
			
			success : function(label) {
				label.text('OK!').addClass('valid');
			}
		});
	});
</script>
</head>
<body>
	<fieldset>
		<legend>Add Produk</legend>
		<form class="form-horizontal" id="tambahData" name="form" action="<c:url value="add"/>" method="post">
			<div class="control-group">
				<label class="control-label">Nama Produk</label>
				<div class="controls">
					  <input type="text" id="namaProduk" name="namaProduk" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Jumlah Produk</label>
				<div class="controls">
					  <input type="text" id="jmlProduk" name="jmlProduk" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Harga</label>
				<div class="controls">
					  <input type="text" id="harga" name="harga" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Satuan</label>
				<div class="controls">
					<select id="satuan" name="satuan" >
						<option value="">--Pilih Satuan--</option>
							<c:forEach var="satuan" items="${satuan}">
								<option value="${satuan.id}">${satuan.namaSatuan}</option>
							</c:forEach>
					</select>
					<label for="satuan" class="error" style="display:none;">Satuan Harus dipilih</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Kategori</label>
				<div class="controls">
					<select id="kategori" name="kategori" >
						<option value="">--Pilih Kategori--</option>
							<c:forEach var="kategori" items="${kategori}">
								<option value="${kategori.id}">${kategori.namaKategori}</option>
							</c:forEach>
					</select>
					<label for="kategori" class="error" style="display:none;">Kategori Harus dipilih</label>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button class="btn btn-small" type="submit">Add Produk</button>
				</div>
			</div>
		</form>
	</fieldset>
</body>
</html>