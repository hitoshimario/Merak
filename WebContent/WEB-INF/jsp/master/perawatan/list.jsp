<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Perawatan</title>
<link type="text/css" href='<c:url value = "/resources/css/demo_table.css"/>' rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery.dataTables.js"/>'></script>
<!-- Paging Table -->
<!-- <script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#example').dataTable( {
					"sPaginationType": "full_numbers"
				} );
			} );
		</script> -->
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
		<a href="<c:url value="/master/perawatan/add"/>">
			<button class="btn btn-small" type="button">Add Perawatan</button>
		</a>
		<div style="margin:15px 0;"></div>
		<table class="display"><!--  id="example" -->
				<tr>
					<td>
					<table>
						<tr>
							<td>Nama Pelanggan :  ${pelanggan.namaAwal} ${pelanggan.namaAkhir}</td>
						<tr>
						<tr>
							<td>Nama Paket : ${paketPerawatan.namaPaketPerawatan}</td>
						</tr>
					</table>
					</td>
				</tr>			
			<tr>
			<td>tanggal</td>
			<td>Mulai</td>
			<td>Selesai</td>
			<td>Dokter</td>
			<td>Suster</td>
			</tr>
			<c:forEach var="perawatan" items="${perawatan}">
			<tr>
				<td>${perawatan.tglPerawatan}</td>
				<td>${perawatan.jamMulai}</td>
				<td>${perawatan.jamAkhir}</td>
				<td>
				<ul>
				<c:forEach var="dokter" items="${dokter}">
				<li>${dokter.namaAwal}</li>
				</c:forEach>
				</ul>
				</td>
				<td>
				<ul>
				<c:forEach var="suster" items="${suster}">
				<li>${suster.namaAwal}</li>
				</c:forEach>
				</ul>
				</td>
			</tr>
			</c:forEach>
		</table>
	</fieldset>
</body>
</html>