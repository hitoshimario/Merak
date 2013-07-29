<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Satuan</title>
</head>
<body>
	<fieldset>
		<legend>Detail Satuan</legend>
		<form class="form-horizontal" name="form" action="<c:url value="detail"/>" method="post">
			<div class="control-group">
				<label class="control-label">Id</label>
				<div class="controls">
					  <input type="text" id="id" name="id" value="${satuan.id}" readonly="readonly" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nama Satuan</label>
				<div class="controls">
					  <input type="text" id="namaSatuan" name="namaSatuan" value="${satuan.namaSatuan}" />
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button class="btn btn-small" type="submit">Update Satuan</button>
				</div>
			</div>
		</form>
	</fieldset>
</body>
</html>