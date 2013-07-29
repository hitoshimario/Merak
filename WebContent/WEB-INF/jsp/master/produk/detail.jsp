<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Produk</title>
</head>
<body>
	<fieldset>
		<legend>Detail Produk</legend>
		<form class="form-horizontal" name="form" action="<c:url value="detail"/>" method="post">
			<div class="control-group">
				<label class="control-label">Id</label>
				<div class="controls">
					<input type="text" id="id" name="id" value="${produk.id}" readonly="readonly" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nama Produk</label>
				<div class="controls">
					<input type="text" id="namaProduk" name="namaProduk" value="${produk.namaProduk}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Jumlah Produk</label>
				<div class="controls">
					<input type="text" id="jmlProduk" name="jmlProduk" value="${produk.jmlProduk}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Harga</label>
				<div class="controls">
					<input type="text" id="harga" name="harga" value="${produk.harga}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Satuan</label>
				<div class="controls">
					<select id="satuan" name="satuan" >
						<option value="">--Pilih Satuan--</option>
							<c:forEach var="satuan" items="${satuan}">
								<option value="${satuan.id}" ${satuan.id == produk.satuan.getId() ? 'selected' : ''}>${satuan.namaSatuan}</option>
							</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Kategori</label>
				<div class="controls">
					<select id="kategori" name="kategori" >
						<option value="">--Pilih Kategori--</option>
							<c:forEach var="kategori" items="${kategori}">
								<option value="${kategori.id}" ${kategori.id == produk.kategori.getId() ? 'selected' : ''}>${kategori.namaKategori}</option>
							</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button class="btn btn-small" type="submit">Update Produk</button>
				</div>
			</div>
		</form>
	</fieldset>
</body>
</html>