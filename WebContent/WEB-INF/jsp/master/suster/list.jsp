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
		<legend>Suster</legend>
		<a href="<c:url value="/master/suster/add"/>">
			<button class="btn btn-small" type="button">Add Suster</button>
		</a>
		<div style="margin:15px 0;"></div>
		<table class="display" id="example">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nip Suster</th>
					<th>Nama Suster</th>
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
				<c:forEach var="suster" items="${suster}">
					<tr class="gradeB">
						<td>${suster.id}</td>
						<td>${suster.nipSuster}</td>
						<td>${suster.namaAwal} ${suster.namaAkhir}</td>
						<td><c:out value = "${suster.jnsKelamin == 0 ? 'Laki-laki' : 'Perempuan'}"/></td>
						<td>${suster.tmpLahir}</td>
						<td>${suster.tglLahir}</td>
						<td>${suster.alamat}</td>
						<td>${suster.telepon}</td>
						<td>${suster.email}</td>
						<td align="center"><a href="<c:url value="/master/suster/detail?id=${suster.id}"/>"><i class="icon-pencil"></i></a></td>
						<td align="center"><a href="<c:url value="/master/suster/delete?id=${suster.id}"/>" onClick="return confirmDelete()"><i class="icon-remove"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</body>
</html>