<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dokter</title>
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
		<legend>Dokter</legend>
		<a href="<c:url value="/master/dokter/add"/>">
			<button class="btn btn-small" type="button">Add Dokter</button>
		</a>
		<div style="margin:15px 0;"></div>
		<table class="display" id="example">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nip Dokter</th>
					<th>Nama Dokter</th>
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
				<c:forEach var="dokter" items="${dokter}">
					<tr class="gradeB">
						<td>${dokter.id}</td>
						<td>${dokter.nipDokter}</td>
						<td>${dokter.namaAwal} ${dokter.namaAkhir}</td>
						<td><c:out value = "${dokter.jnsKelamin == 0 ? 'Laki-laki' : 'Perempuan'}"/></td>
						<td>${dokter.tmpLahir}</td>
						<td>${dokter.tglLahir}</td>
						<td>${dokter.alamat}</td>
						<td>${dokter.telepon}</td>
						<td>${dokter.email}</td>
						<td align="center"><a href="<c:url value="/master/dokter/detail?id=${dokter.id}"/>"><i class="icon-pencil"></i></a></td>
						<td align="center"><a href="<c:url value="/master/dokter/delete?id=${dokter.id}"/>" onClick="return confirmDelete()"><i class="icon-remove"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</body>
</html>