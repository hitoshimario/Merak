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
		<legend>Add Satuan</legend>
		<form class="form-horizontal" name="form" action="<c:url value="add"/>" method="post">
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
		<%-- <form name="form" action="<c:url value="add"/>" method="post">
			<table>
				<tr>
					<td>Nama Satuan</td><td><input type="text" id="namaSatuan" name="namaSatuan" /></td>
				</tr>
				<tr>
					<td class="tombol"><input type="submit" name="submit" value="Save" /></td>
				</tr>
			</table>
		</form> --%>
	</fieldset>
</body>
</html>