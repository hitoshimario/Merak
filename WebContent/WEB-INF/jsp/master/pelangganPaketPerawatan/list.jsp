<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pelanggan Paket Perawatan</title>
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
		<legend>Paket Pilihan ${pelanggan.namaAwal} ${pelanggan.namaAkhir}</legend>
		<a href="<c:url value="/master/pelangganPaketPerawatan/add?id=${pelanggan.id}"/>">
			<button class="btn btn-small" type="button">Add Paket</button>
		</a>
		<div style="margin:15px 0;"></div>
		<table class="display" id="example">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nama Paket</th>
					<th>Durasi</th>
					<th>Harga</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pelangganPaketPerawatan" items="${pelangganPaketPerawatan}">
				<tr class="gradeB">
					<td align="center">${pelangganPaketPerawatan.getId()}</td>
					<td align="center"><a href="<c:url value="/master/perawatan/list?id=${pelangganPaketPerawatan.getId()}"/>">${pelangganPaketPerawatan.paketPerawatan.getNamaPaketPerawatan()}</a></td>
					<td align="center">${pelangganPaketPerawatan.paketPerawatan.getDurasi()}</td>
					<td align="center">${pelangganPaketPerawatan.paketPerawatan.getHarga()}</td>
					<td align="center"><a href="<c:url value="/master/pelangganPaketPerawatan/delete?id=${pelangganPaketPerawatan.id}&idPlg=${pelanggan.id}"/>" onClick="return confirmDelete()"><i class="icon-remove"></i></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</body>
</html>