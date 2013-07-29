<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pelanggan</title>
<link type="text/css" href='<c:url value = "/resources/css/demo_table.css"/>' rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery.dataTables.js"/>'></script>
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
		<legend>Pelanggan</legend>
		<a href="<c:url value="/master/pelanggan/add"/>">
			<button class="btn btn-small" type="button">Add Pelanggan</button>
		</a>
		<div style="margin:15px 0;"></div>
		<table class="display" id="example">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nomor Pelanggan</th>
					<th>Nama Pelanggan</th>
					<th>Jenis Kelamin</th>
					<th>Tempat Lahir</th>
					<th>Tanggal Lahir</th>
					<th>Alamat</th>
					<th>Telepon</th>
					<th>Email</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pelanggan" items="${pelanggan}">
					<tr class="gradeB">
						<td>${pelanggan.id}</td>
						<td>${pelanggan.nomorPelanggan}</td>
						<td><a href="<c:url value="/master/pelangganPaketPerawatan/list?id=${pelanggan.id}"/>">${pelanggan.namaAwal} ${pelanggan.namaAkhir}</a></td>
						<td><c:out value = "${pelanggan.jnsKelamin == 0 ? 'Laki-laki' : 'Perempuan'}"/></td>
						<td>${pelanggan.tmpLahir}</td>
						<td>${pelanggan.tglLahir}</td>
						<td>${pelanggan.alamat}</td>
						<td>${pelanggan.telepon}</td>
						<td>${pelanggan.email}</td>
						<td align="center"><a href="<c:url value="/master/pelanggan/detail?id=${pelanggan.id}"/>"><i class="icon-pencil"></i></a></td>
						<td align="center"><a href="<c:url value="/master/pelanggan/delete?id=${pelanggan.id}"/>" onClick="return confirmDelete()"><i class="icon-remove"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</body>
</html>