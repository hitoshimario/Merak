<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detail Suster</title>
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
	<form class="form-horizontal" id="tambahData" name="form" action="<c:url value="detail"/>" method="post">
		<fieldset>
			<legend>Detail Suster</legend>
				<div class="control-group">
					<label class="control-label">Id</label>
					<div class="controls">
						  <input type="text" id="id" name="id" value="${suster.id}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Nip Suster</label>
					<div class="controls">
						  <input type="text" id="nipSuster" name="nipSuster" value="${suster.nipSuster}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Nama Awal</label>
					<div class="controls">
						  <input type="text" id="namaAwal" name="namaAwal" value="${suster.namaAwal}" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Nama Akhir</label>
					<div class="controls">
						  <input type="text" id="namaAkhir" name="namaAkhir" value="${suster.namaAkhir}" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Jenis Kelamin</label>
					<div class="controls">
						  <input type="radio" id="jnsKelamin" name="jnsKelamin" value="0" ${suster.jnsKelamin == 0 ? 'checked' : ''} />Laki-laki
						  <input type="radio" id="jnsKelamin" name="jnsKelamin" value="1" ${suster.jnsKelamin == 1 ? 'checked' : ''} />Perempuan
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Tempat Lahir</label>
					<div class="controls">
						  <input type="text" id="tmpLahir" name="tmpLahir" value="${suster.tmpLahir}" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Tanggal Lahir</label>
					<div class="controls">
						  <input type="text" id="tglLahir" name="tglLahir" value="${suster.tglLahir}" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Alamat</label>
					<div class="controls">
						  <input type="text" id="alamat" name="alamat" value="${suster.alamat}" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Telepon</label>
					<div class="controls">
						  <input type="text" id="telepon" name="telepon" value="${suster.telepon}" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Email</label>
					<div class="controls">
						  <input type="text" id="email" name="email" value="${suster.email}" />
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button class="btn btn-small" type="submit">Update Suster</button>
					</div>
				</div>
		</fieldset>
	</form>
</body>
</html>