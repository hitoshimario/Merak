<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Kategori</title>
<link type="text/css" href='<c:url value = "/resources/css/demo_table.css"/>' rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery-1.10.2.js"/>'></script>
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
<script type="text/javascript">
	function confirmDelete(){
		return confirm('Anda yakin ingin menghapus data ini ?');
	}
</script>
</head>
<body>
	<fieldset>
		<legend>Table Kategori</legend>
		<a href="<c:url value="/master/kategori/add"/>">
			<button class="btn btn-small" type="button">Add Kategori</button>
		</a>
		<div style="margin:15px 0;"></div>
		<table class="display" id="example">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nama Kategori</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="kategori" items="${kategori}">
				<tr class="gradeB">
					<td align="center">${kategori.id}</td>
					<td align="center">${kategori.namaKategori}</td>
					<td align="center"><a href="<c:url value="/master/kategori/detail?id=${kategori.id}"/>"><i class="icon-pencil"></i></a></td>
					<td align="center"><a href="<c:url value="/master/kategori/delete?id=${kategori.id}"/>" onClick="return confirmDelete()"><i class="icon-remove"></i></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</body>
</html>