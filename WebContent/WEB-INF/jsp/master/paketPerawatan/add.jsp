<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Paket Perawatan</title>
<link type="text/css" href='<c:url value = "/resources/css/validasi.css"/>' rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery.validate.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-ui-1.9.2.custom.js.js"/>'></script>
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
<script type="text/javascript">
	var counter=0;
	$(document).ready(function(){
		$("#addProduk").click(function(){
			$("#produkAppend").append("<br/><select id='produk' name='produk'>"+
					"<option value=''>--Pilih Produk--</option>"+renderOptions()+"</select>");
			counter++;
		});
		
		function renderOptions(){
			var options = "";
			<c:forEach var="produk" items="${produk}">
				options += "<option value='${produk.id}'>${produk.namaProduk}</option>";
			</c:forEach>
			return options;
		}
	});
</script>
<script type="text/javascript">
	var counter=0;
	$(document).ready(function(){
		$("#addAlat").click(function(){
			$("#alatAppend").append("<br/><select id='alat' name='alat'>"+
					"<option value=''>--Pilih Alat--</option>"+renderOptions()+"</select>");
			counter++;
		});
		
		function renderOptions(){
			var options = "";
			<c:forEach var="alat" items="${alat}">
				options += "<option value='${alat.id}'>${alat.namaAlat}</option>";
			</c:forEach>
			return options;
		}
	});
</script>
</head>
<body>
	<fieldset>
		<legend>Add Paket Perawatan</legend>
		<form class="form-horizontal" id="tambahData" name="form" action="<c:url value="add"/>" method="post">
			<div class="control-group">
				<label class="control-label">Nama Paket</label>
				<div class="controls">
					  <input type="text" id="namaPaketPerawatan" name="namaPaketPerawatan" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Produk</label>
				<div id="produkAppend" class="controls">
					<div ></div>
					<select id="produk" name="produk" >
						<option value="">--Pilih Produk--</option>
							<c:forEach var="produk" items="${produk}">
								<option value="${produk.id}">${produk.namaProduk}</option>
							</c:forEach>
					</select>
					<button id="addProduk" class="btn btn-small" type="button">Add Produk</button>
					<label for="produk" class="error" style="display:none;">Produk Harus dipilih</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Alat</label>
				<div id="alatAppend" class="controls">
					<select id="alat" name="alat" >
						<option value="">--Pilih Alat--</option>
							<c:forEach var="alat" items="${alat}">
								<option value="${alat.id}">${alat.namaAlat}</option>
							</c:forEach>
					</select>
					<button id="addAlat" class="btn btn-small" type="button">Add Alat</button>
					<label for="alat" class="error" style="display:none;">Alat Harus dipilih</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Harga</label>
				<div class="controls">
					  <input type="text" id="harga" name="harga" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Durasi</label>
				<div class="controls">
					  <input type="text" id="durasi" name="durasi" />
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button class="btn btn-small" type="submit">Add Paket Perawatan</button>
				</div>
			</div>
		</form>
	</fieldset>
</body>
</html>