<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alat</title>
</head>
<body>
	<fieldset>
		<legend>Add Alat</legend>
		<form class="form-horizontal" name="form" action="<c:url value="add"/>" method="post">
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