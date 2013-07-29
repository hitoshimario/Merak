<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detail Paket Perawatan</title>
<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery-1.8.3.js"/>'></script> 
<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery-ui-1.9.2.custom.js.js"/>'></script>
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
		
		$("#removeAlat").click(function(){
			$("#alatAppend").append("<br/><select id='alat' name='alat'>"+
					"<option value=''>--Pilih Alat--</option>"+renderOptions()+"</select>");
			counter--;
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
		<legend>Detail Paket Perawatan</legend>
		<form class="form-horizontal" name="form" action="<c:url value="detail"/>" method="post">
			<div class="control-group">
				<label class="control-label">Id Paket</label>
				<div class="controls">
					  <input type="text" id="id" name="id" value="${paketPerawatan.id}" readonly="readonly" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nama Paket</label>
				<div class="controls">
					  <input type="text" id="namaPaketPerawatan" name="namaPaketPerawatan" value="${paketPerawatan.namaPaketPerawatan}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Produk</label>
				<c:forEach var="paketPerawatanProduk" items="${paketPerawatan.produk}">
				<div id="produkAppend" class="controls">
					<select id="produk" name="produk" >
						<option value="">--Pilih Produk--</option>
							<c:forEach var="produk" items="${produk}">
								<option value="${produk.id}" ${produk.id == paketPerawatanProduk.id ? 'selected' : ''}>${produk.namaProduk}</option>
							</c:forEach>
					</select>
					<button id="addProduk" class="btn btn-small" type="button">Add Produk</button>
				</div>
				</c:forEach>
			</div>
			<div class="control-group">
				<label class="control-label">Alat</label>
				<c:forEach var="paketPerawatanAlat" items="${paketPerawatan.alat}">
				<div id="alatAppend" class="controls">
					<select id="alat" name="alat" >
						<option value="">--Pilih Alat--</option>
							<c:forEach var="alat" items="${alat}">
								<option value="${alat.id}" ${alat.id == paketPerawatanAlat.id ? 'selected' : ''}>${alat.namaAlat}</option>
							</c:forEach>
					</select>
					<button id="addAlat" class="btn btn-small" type="button">Add Alat</button>
				</div>
				</c:forEach>
			</div>
			<div class="control-group">
				<label class="control-label">Harga</label>
				<div class="controls">
					  <input type="text" id="harga" name="harga" value="${paketPerawatan.harga}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Durasi</label>
				<div class="controls">
					  <input type="text" id="durasi" name="durasi" value="${paketPerawatan.durasi}" />
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button class="btn btn-small" type="submit">Update Paket</button>
				</div>
			</div>
		</form>
	</fieldset>
</body>
</html>