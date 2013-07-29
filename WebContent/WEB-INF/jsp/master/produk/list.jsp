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
		<legend>Table Produk</legend>
		<a href="<c:url value="/master/produk/add"/>">
			<button class="btn btn-small" type="button">Add Produk</button>
		</a>
		<div style="margin:15px 0;"></div>
		<table class="display" id="example">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nama Produk</th>
					<th>Jumlah Produk</th>
					<th>Satuan</th>
					<th>Kategori</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="produk" items="${produk}">
				<tr>
					<td align="center">${produk.id}</td>
					<td align="center">${produk.namaProduk}</td>
					<td align="center">${produk.jmlProduk}</td>
					<td align="center">${produk.satuan}</td>
					<td align="center">${produk.kategori}</td>
					<td align="center"><a href="<c:url value="/master/produk/detail?id=${produk.id}"/>"><i class="icon-pencil"></i></a></td>
					<td align="center"><a href="<c:url value="/master/produk/delete?id=${produk.id}"/>" onClick="return confirmDelete()"><i class="icon-remove"></i></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</body>
</html>