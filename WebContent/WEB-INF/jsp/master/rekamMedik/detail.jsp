<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rekam Medik</title>
<link type="text/css" href='<c:url value = "/resources/css/validasi.css"/>' rel="stylesheet" />
<link type="text/css" href='<c:url value = "/resources/css/ui.all.css"/>' rel="stylesheet" />

<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery.validate.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-ui-1.9.2.custom.js.js"/>'></script>

</head>
<body>
	<form class="form-horizontal" id="tambahData" name="form" action="<c:url value="add"/>" method="post">
		<fieldset>
			<legend>Rekam Medik</legend>
				<div class="control-group">
					<label class="control-label">Id</label>
					<div class="controls">
						  <input type="text" id="id" name="id" value="${rekamMedik.id}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Progress</label>
					<div class="controls">
						  <input type="text" id="progress" name="progress" value="${rekamMedik.progress}" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Catatan</label>
					<div class="controls">
						  <input type="text" id="catatan" name="catatan" value="${rekamMedik.catatan}" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Id Perawatan</label>
					<div class="controls">
						  <input type="text" id="perawatan" name="perawatan" value="${rekamMedik.perawatan.getId()}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button class="btn btn-small" type="submit">Update Perawatan</button>
					</div>
				</div>
		</fieldset>
	</form>
</body>
</html>