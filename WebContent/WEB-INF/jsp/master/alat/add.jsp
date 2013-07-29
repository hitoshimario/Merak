<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alat</title>
<link type="text/css" href='<c:url value = "/resources/css/validasi.css"/>' rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery.validate.js"/>'></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#tambahData').validate({
			rules : {
				namaAlat : "required",
				jmlAlat: {
					required: true,
					number:true
				},
				satuan :{
					required: true
				}
			},
			
			messages : {
				namaAlat: {
					required: 'Nama Alat Harus Diisi'
				},
				jmlAlat: {
					required: 'Jumlah Alat Harus Diisi',
					number: 'Jumlah Alat Harus Angka'
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
		<legend>Add Alat</legend>
		<form class="form-horizontal" id="tambahData" name="form" action="<c:url value="add"/>" method="post">
			<div class="control-group">
				<label class="control-label">Nama Alat</label>
				<div class="controls">
					  <input type="text" id="namaAlat" name="namaAlat" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Jumlah Alat</label>
				<div class="controls">
					  <input type="text" id="jmlAlat" name="jmlAlat" />
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
				<div class="controls">
					<button class="btn btn-small" type="submit">Add Alat</button>
				</div>
			</div>
		</form>
	</fieldset>
</body>
</html>