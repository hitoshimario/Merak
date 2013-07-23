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
		<legend>Add Produk</legend>
		<form class="form-horizontal" name="form" action="<c:url value="add"/>" method="post">
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
				<label class="control-label">Satuan</label>
				<div class="controls">
					<select id="satuan" name="satuan" >
						<option value="">--Pilih Satuan--</option>
							<c:forEach var="satuan" items="${satuan}">
								<option value="${satuan.id}">${satuan.namaSatuan}</option>
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
								<option value="${kategori.id}">${kategori.namaKategori}</option>
							</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button class="btn btn-small" type="submit">Add Produk</button>
				</div>
			</div>
		</form>
		<%-- <form name="form" action="<c:url value="add"/>" method="post">
			<table>
				<tr>
					<td>Nama Produk</td><td><input type="text" id="namaProduk" name="namaProduk" /></td>
				</tr>
				<tr>
					<td>Jumlah Produk</td><td><input type="text" id="jmlProduk" name="jmlProduk" /></td>
				</tr>
				<tr>
					<td>Satuan</td>
					<td>
						<select id="satuan" name="satuan" >
							<option value="">--Pilih Satuan--</option>
							<c:forEach var="satuan" items="${satuan}">
								<option value="${satuan.id}">${satuan.namaSatuan}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>Kategori</td>
					<td>
						<select id="kategori" name="kategori" >
							<option value="">--Pilih Kategori--</option>
							<c:forEach var="kategori" items="${kategori}">
								<option value="${kategori.id}">${kategori.namaKategori}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="tombol"><input type="submit" name="submit" value="Save" /></td>
				</tr>
			</table>
		</form> --%>
	</fieldset>
</body>
</html>