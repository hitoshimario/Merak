<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Perawatan</title>
<link type="text/css"
	href='<c:url value = "/resources/css/validasi.css"/>' rel="stylesheet" />
<link type="text/css"
	href='<c:url value = "/resources/css/ui.all.css"/>' rel="stylesheet" />

<script type="text/javascript"
	src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript"
	src='<c:url value="/resources/js/jquery.validate.js"/>'></script>
<script type="text/javascript"
	src='<c:url value="/resources/js/jquery-ui-1.9.2.custom.js.js"/>'></script>
<script type="text/javascript"
	src='<c:url value="/resources/js/ui.core.js"/>'></script>
<script type="text/javascript"
	src='<c:url value="/resources/js/ui.datepicker.js"/>'></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#tglPerawatan").datepicker({
			dateFormat : 'yy-mm-dd',
			changeMonth : true,
			changeYear : true
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#tambahData').validate({
			rules : {
				namaPaketPerawatan : "required",
				produk : {
					required : true
				},
				alat : {
					required : true
				},
				harga : {
					required : true,
					number : true
				},
				durasi : "required"
			},

			messages : {
				tglPerawatan : {
					required : 'Tanggal Perawatan Harus Diisi'
				},
				jamMulai : {
					required : 'Jam Mulai Harus Diisi',
					number : 'Contoh 12:00:00'
				},
				jamAkhir : {
					required : 'Jam Akhir Harus Diisi',
					number : 'Contoh 13:00:00'
				},
				visitKe : {
					required : 'Visit Ke Harus Diisi',
					number : 'Visit Ke Diisi Dengan Angka'
				}
			},

			success : function(label) {
				label.text('OK!').addClass('valid');
			}
		});
	});
</script>
<script type="text/javascript">
	var counter = 0;
	$(document)
			.ready(
					function() {
						$("#addDokter")
								.click(
										function() {
											$("#dokterAppend")
													.append(
															"<br/><select id='dokter' name='dokter'>"
																	+ "<option value=''>--Pilih Dokter--</option>"
																	+ renderOptions()
																	+ "</select>");
											counter++;
										});

						function renderOptions() {
							var options = "";
							<c:forEach var="dokter" items="${dokter}">
							options += "<option value='${dokter.id}'>${dokter.namaAwal}</option>";
							</c:forEach>
							return options;
						}
					});
</script>
<script type="text/javascript">
	var counter = 0;
	$(document)
			.ready(
					function() {
						$("#addSuster")
								.click(
										function() {
											$("#susterAppend")
													.append(
															"<br/><select id='suster' name='suster'>"
																	+ "<option value=''>--Pilih Suster--</option>"
																	+ renderOptions()
																	+ "</select>");
											counter++;
										});

						function renderOptions() {
							var options = "";
							<c:forEach var="suster" items="${suster}">
							options += "<option value='${suster.id}'>${alat.namaAwal}</option>";
							</c:forEach>
							return options;
						}
					});
</script>
</head>
<body>
	<form class="form-horizontal" id="tambahData" name="form"
		action="<c:url value="add"/>" method="post">
		<fieldset>
			<legend>Perawatan</legend>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<input type="hidden" id="id" name="id" value="${perawatan.id}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Tgl Perawatan</label>
				<div class="controls">
					<input type="text" id="tglPerawatan" name="tglPerawatan"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Dokter</label>
				<div id="dokterAppend" class="controls">
					<div></div>
					<select id="dokter" name="dokter">
						<option value="">--Pilih Dokter--</option>
						<c:forEach var="dokter" items="${dokter}">
							<option value="${dokter.id}">${dokter.namaAwal}</option>
						</c:forEach>
					</select>
					<button id="addDokter" class="btn btn-small" type="button">Add
						Dokter</button>
					<label for="dokter" class="error" style="display: none;">Dokter
						Harus dipilih</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Suster</label>
				<div id="susterAppend" class="controls">
					<div></div>
					<select id="suster" name="suster">
						<option value="">--Pilih Suster--</option>
						<c:forEach var="suster" items="${suster}">
							<option value="${suster.id}">${suster.namaAwal}</option>
						</c:forEach>
					</select>
					<button id="addSuster" class="btn btn-small" type="button">Add
						Suster</button>
					<label for="suster" class="error" style="display: none;">Suster
						Harus dipilih</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Jam Mulai</label>
				<div class="controls">
					<input type="text" id="jamMulai" name="jamMulai"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Jam Akhir</label>
				<div class="controls">
					<input type="text" id="jamAkhir" name="jamAkhir"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Visit Ke</label>
				<div class="controls">
					<input type="text" id="visitKe" name="visitKe"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Pelanggan Paket ID</label>
				<div class="controls">
					<input type="text" id="pelangganPaketPerawatan" name="pelangganPaketPerawatan"/>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button class="btn btn-small" type="submit">Add Perawatan</button>
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>