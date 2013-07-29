<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distributor</title>
</head>
<body>
	<fieldset>
	<legend><b>Form Edit</b></legend>
		<form action="<c:url value="add" />" method="post">		
		<table >
			<tr>  <!-- update harus masuk semua datanya sampai id nya nanti tinggal di hiiden -->
			<td><input type="hidden" name="id"  value="${distributor.id}" ></td></tr><tr>
			<td>Nama Distributor</td><td> <input type="text" name="namaDistributor"  value="${distributor.namaDistributor}"></td></tr><tr>
				<td>Alamat </td><td> <input type="text" name="alamat" value="${distributor.alamat}"></td></tr><tr>
				<td>Telepon </td><td> <input type="text" name="telepon" value="${distributor.telepon }"></td></tr><tr>
				<td>Email </td><td> <input type="text" name="email" value="${distributor.email}"></td></tr><tr>
				<td class="tombo"> <input type="submit" value="update" name="submit"></td></tr>
		</table>
	</form>
	</fieldset>
</body>
</html>