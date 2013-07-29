<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Perawatan</title>
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
		<legend>Perawatan</legend>
		<a href="<c:url value="/master/perawatan/add?id=${pelangganPaketPerawatan.id}"/>">
			<button class="btn btn-small" type="button">Add Perawatan</button>
		</a>
		<div style="margin:15px 0;"></div>
		<h5>Nama Pelanggan : ${pelangganPaketPerawatan.pelanggan.getNamaAwal()} ${pelangganPaketPerawatan.pelanggan.getNamaAkhir()}</h5>
		<h5>Paket Perawatan : ${pelangganPaketPerawatan.paketPerawatan.getNamaPaketPerawatan()}</h5>
		<div style="margin:15px 0;"></div>
		<table class="display" id="example">
			<thead>
				<tr>
					<th>Id</th>
					<th>Tanggal</th>
					<th>Dokter</th>
					<th>Suster</th>
					<th>Mulai</th>
					<th>Selesai</th>
					<th>Visit</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="perawatan" items="${perawatan}">
				<tr class="gradeB">
					<td align="center">${perawatan.id}</td>
					<td align="center"><a href="<c:url value="/master/rekamMedik/list?id=${perawatan.id}"/>">${perawatan.tglPerawatan}</a></td>
					<td>
						<ul>
						<c:forEach var="dokter" items="${perawatan.dokter}">
							<li>${dokter.namaAwal}</li>
						</c:forEach>
						</ul>
					</td>
					<td>
						<ul>
						<c:forEach var="suster" items="${perawatan.suster}">
							<li>${suster.namaAwal}</li>
						</c:forEach>
						</ul>
					</td>
					<td align="center">${perawatan.jamMulai}</td>
					<td align="center">${perawatan.jamAkhir}</td>
					<td align="center">${perawatan.visitKe}</td>
					<td align="center"><a href="<c:url value="/master/perawatan/detail?id=${perawatan.id}"/>"><i class="icon-pencil"></i></a></td>
					<td align="center"><a href="<c:url value="/master/perawatan/delete?id=${perawatan.id}&idPpp=${pelangganPaketPerawatan.id}"/>" onClick="return confirmDelete()"><i class="icon-remove"></i></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</body>
</html>