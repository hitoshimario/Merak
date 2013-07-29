<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Satuan</title>
<link type="text/css" href='<c:url value = "/resources/css/validasi.css"/>' rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery.validate.js"/>'></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#tambahData').validate({
			rules : {
				namaSatuan : "required",
			},
			
			messages : {
				namaSatuan: {
					required: 'Nama Satuan Harus Diisi'
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
		<legend>Add Satuan</legend>
		<form class="form-horizontal" id="tambahData" name="form" action="<c:url value="add"/>" method="post">
			<div class="control-group">
				<label class="control-label">Nama Satuan</label>
				<div class="controls">
					  <input type="text" id="namaSatuan" name="namaSatuan" />
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button class="btn btn-small" type="submit">Add Satuan</button>
				</div>
			</div>
		</form>
	</fieldset>
</body>
</html>