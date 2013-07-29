<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Paket Perawatan</title>
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
<!-- EndPagging -->
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
		<legend>Paket Perawatan</legend>
		<a href="<c:url value="/master/paketPerawatan/add"/>">
			<button class="btn btn-small" type="button">Add Paket Perawatan</button>
		</a>
		<div style="margin:15px 0;"></div>
		<table class="display" id="example">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nama Paket Perawatan</th>
					<th>Produk</th>
					<th>Alat</th>
					<th>Harga</th>
					<th>Durasi</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="paketPerawatan" items="${paketPerawatan}">
					<tr class="gradeB">
						<td>${paketPerawatan.id}</td>
						<td>${paketPerawatan.namaPaketPerawatan}</td>
						<td>
							<ul>
							<c:forEach var="produk" items="${paketPerawatan.produk}">
								<li>${produk.namaProduk}</li>
							</c:forEach>
							</ul>
						</td>
						<td>
							<ul>
							<c:forEach var="alat" items="${paketPerawatan.alat}">
								<li>${alat.namaAlat}</li>
							</c:forEach>
							</ul>
						</td>
						<td align="center">${paketPerawatan.harga}</td>
						<td align="center">${paketPerawatan.durasi}</td>
						<td align="center"><a href="<c:url value="/master/paketPerawatan/detail?id=${paketPerawatan.id}"/>"><i class="icon-pencil"></i></a></td>
						<td align="center"><a href="<c:url value="/master/paketPerawatan/delete?id=${paketPerawatan.id}"/>" onClick="return confirmDelete()"><i class="icon-remove"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</body>
</html>