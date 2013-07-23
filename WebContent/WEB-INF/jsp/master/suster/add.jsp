<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Dokter</title>
<link type="text/css" href='<c:url value = "/resources/css/validasi.css"/>' rel="stylesheet" />
<link type="text/css" href='<c:url value = "/resources/css/ui.all.css"/>' rel="stylesheet" />

<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery.validate.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery-ui-1.9.2.custom.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/script/jquery/ui.core.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/script/jquery/ui.datepicker.js"/>'></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#tglLahir").datepicker({dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true});
	});
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#tambahData').validate({
			rules : {
				namaPaketPerawatan : "required",
				produk :{
					required: true
				},
				alat :{
					required: true
				},
				harga: {
					required: true,
					number:true
				},
				durasi : "required"
			},
			
			messages : {
				namaPaketPerawatan: {
					required: 'Nama Paket Perawatan Harus Diisi'
				},
				harga: {
					required: 'Harga Harus Diisi',
					number: 'Harga Harus Angka'
				},
				durasi: {
					required: 'Durasi Harus Diisi'
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
	<form class="form-horizontal" id="tambahData" name="form" action="<c:url value="add"/>" method="post">
		<fieldset>
			<legend>Add Suster</legend>
				<div class="control-group">
					<label class="control-label">Nomor Suster</label>
					<div class="controls">
						  <input type="text" id="nipSuster" name="nipSuster" /><%-- value="${idGenerator}" --%> <!-- readonly="readonly" -->
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Nama Awal</label>
					<div class="controls">
						  <input type="text" id="namaAwal" name="namaAwal" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Nama Akhir</label>
					<div class="controls">
						  <input type="text" id="namaAkhir" name="namaAkhir" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Jenis Kelamin</label>
					<div class="controls">
						  <input type="radio" id="jnsKelamin" name="jnsKelamin" value="0" />Laki-laki
						  <input type="radio" id="jnsKelamin" name="jnsKelamin" value="1" />Perempuan
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Tempat Lahir</label>
					<div class="controls">
						  <input type="text" id="tmpLahir" name="tmpLahir" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Tanggal Lahir</label>
					<div class="controls">
						  <input type="text" id="tglLahir" name="tglLahir" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Alamat</label>
					<div class="controls">
						  <input type="text" id="alamat" name="alamat" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Telepon</label>
					<div class="controls">
						  <input type="text" id="telepon" name="telepon" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Email</label>
					<div class="controls">
						  <input type="text" id="email" name="email" />
					</div>
				</div>
		</fieldset>
	</form>
</body>
</html>