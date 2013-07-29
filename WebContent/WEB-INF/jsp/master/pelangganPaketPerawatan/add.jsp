<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Paket Pelanggan</title>
<link type="text/css" href='<c:url value = "/resources/css/validasi.css"/>' rel="stylesheet" />
<link type="text/css" href='<c:url value = "/resources/css/ui.all.css"/>' rel="stylesheet" />

<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery.validate.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-ui-1.9.2.custom.js.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/ui.core.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/ui.datepicker.js"/>'></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#tglLahir").datepicker({dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true});
	});
</script>

</head>
<body>
	<form class="form-horizontal" id="tambahData" name="form" action="<c:url value="add"/>" method="post">
		<fieldset>
			<legend>Paket Pelanggan</legend>
				<div class="control-group">
					<label class="control-label">Nomor Pelanggan</label>
					<div class="controls">
						  <input type="text" id="pelanggan" name="pelanggan" value="${pelanggan.id}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Nomor Pelanggan</label>
					<div class="controls">
						  <input type="text" id="nomorPelanggan" name="nomorPelanggan" value="${pelanggan.nomorPelanggan}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Nama Awal</label>
					<div class="controls">
						  <input type="text" id="namaAwal" name="namaAwal" value="${pelanggan.namaAwal}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Nama Akhir</label>
					<div class="controls">
						  <input type="text" id="namaAkhir" name="namaAkhir" value="${pelanggan.namaAkhir}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Jenis Kelamin</label>
					<div class="controls">
						  <input type="radio" id="jnsKelamin" name="jnsKelamin" value="0" ${pelanggan.jnsKelamin == 0 ? 'checked' : ''} disabled="disabled" />Laki-laki
						  <input type="radio" id="jnsKelamin" name="jnsKelamin" value="1" ${pelanggan.jnsKelamin == 1 ? 'checked' : ''} disabled="disabled" />Perempuan
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Tempat Lahir</label>
					<div class="controls">
						  <input type="text" id="tmpLahir" name="tmpLahir" value="${pelanggan.tmpLahir}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Tanggal Lahir</label>
					<div class="controls">
						  <input type="text" id="tglLahir" name="tglLahir" value="${pelanggan.tglLahir}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Alamat</label>
					<div class="controls">
						  <input type="text" id="alamat" name="alamat" value="${pelanggan.alamat}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Telepon</label>
					<div class="controls">
						  <input type="text" id="telepon" name="telepon" value="${pelanggan.telepon}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Email</label>
					<div class="controls">
						  <input type="text" id="email" name="email" value="${pelanggan.email}" readonly="readonly" />
					</div>
				</div>
		</fieldset>
		<fieldset>
			<legend>Paket Perawatan</legend>
				<c:forEach var="paketPerawatan" items="${paketPerawatan}">
					<div class="control-group">
						<div class="controls">
							<input type="radio" id="paketPerawatan" name="paketPerawatan" value="${paketPerawatan.id}" />${paketPerawatan.namaPaketPerawatan}
						</div>
					</div>
				</c:forEach>
				<div class="control-group">
					<div class="controls">
						<button class="btn btn-small" type="submit">Add Paket</button>
					</div>
				</div>
		</fieldset>
	</form>
</body>
</html>