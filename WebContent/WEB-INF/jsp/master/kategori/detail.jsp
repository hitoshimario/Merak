<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Kategori</title>
</head>
<body>
	<fieldset>
		<legend>Detail Kategori</legend>
		<form class="form-horizontal" name="form" action="<c:url value="detail"/>" method="post">
			<div class="control-group">
				<label class="control-label">Id</label>
				<div class="controls">
					  <input type="text" id="id" name="id" value="${kategori.id}" readonly="readonly" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nama Kategori</label>
				<div class="controls">
					  <input type="text" id="namaKategori" name="namaKategori" value="${kategori.namaKategori}" />
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button class="btn btn-small" type="submit">Update Kategori</button>
				</div>
			</div>
		</form>
	</fieldset>
</body>
</html>