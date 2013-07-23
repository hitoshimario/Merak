<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Produk</title>
<link type="text/css" href='<c:url value = "/resources/css/demo_table.css"/>' rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery.dataTables.js"/>'></script>
<!-- Paging Table -->
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#example').dataTable( {
			"sPaginationType": "full_numbers"
		} );
	} );
</script>
<!-- ConfirmationDelete -->
<script type="text/javascript">
	function confirmDelete(){
		return confirm('Anda yakin ingin menghapus data ini ?');
	}
</script>
<!-- END Confirmation -->
</head>
<body>
	<fieldset>
		<legend>Table Alat</legend>
		<a href="<c:url value="/master/alat/add"/>">
			<button class="btn btn-small" type="button">Add Alat</button>
		</a>
		<div style="margin:15px 0;"></div>
		<table class="display" id="example">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nama Alat</th>
					<th>Jumlah Alat</th>
					<th>Satuan</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="alat" items="${alat}">
				<tr>
					<td align="center">${alat.id}</td>
					<td align="center">${alat.namaAlat}</td>
					<td align="center">${alat.jmlAlat}</td>
					<td align="center">${alat.satuan}</td>
					<td align="center"><a href="<c:url value="/master/alat/detail?id=${alat.id}"/>"><i class="icon-pencil"></i></a></td>
					<td align="center"><a href="<c:url value="/master/alat/delete?id=${alat.id}"/>" onClick="return confirmDelete()"><i class="icon-remove"></i></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</body>
</html>