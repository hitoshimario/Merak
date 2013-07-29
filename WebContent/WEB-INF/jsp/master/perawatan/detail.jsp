<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detail Paket Perawatan</title>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script> 
<script type="text/javascript" src='<c:url value="/resources/js/jquery-ui-1.9.2.custom.js.js"/>'></script>
</head>
<body>
	<fieldset>
		<legend>Detail Perawatan</legend>
		<form class="form-horizontal" name="form" action="<c:url value="detail"/>" method="post">
			<div class="control-group">
				<label class="control-label">Id</label>
				<div class="controls">
					  <input type="text" id="id" name="id" value="${perawatan.id}" readonly="readonly" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Tgl Perawatan</label>
				<div class="controls">
					<input type="text" id="tglPerawatan" name="tglPerawatan" value="${perawatan.tglPerawatan}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Jam Mulai</label>
				<div class="controls">
					  <input type="text" id="jamMulai" name="jamMulai" value="${perawatan.jamMulai}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Jam Akhir</label>
				<div class="controls">
					  <input type="text" id="jamAkhir" name="jamAkhir" value="${perawatan.jamAkhir}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Visit Ke</label>
				<div class="controls">
					  <input type="text" id="visitKe" name="visitKe" value="${perawatan.visitKe}" readonly="readonly"/>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button class="btn btn-small" type="submit">Update Perawatan</button>
				</div>
			</div>
		</form>
	</fieldset>
</body>
</html>