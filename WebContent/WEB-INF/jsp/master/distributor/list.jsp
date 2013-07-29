<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distributor</title>
<link type="text/css" href='<c:url value="/resources/css/demo_table.css"/>' rel="stylesheet">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery.dataTables.js"/>'></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#example').dataTable({
			"sPaginationType":"full_numbers"
		});
	});
</script>
<script type="text/javascript">
	function confirmDelete(){
		return confirm('Anda yakin ingin menghapus data ini ?');
	}
</script>
</head>
<body>
	<fieldset >
	<legend><b>Distributor</b></legend>
		<a href="<c:url value="/master/distributor/add"/>">
			<button class="btn btn-small" type="button">Add Distributor</button>
		</a>
		<div style="margin:15px 0;"></div>
		<table class="display" id="example">
		<thead>
			<tr>
			<th>Nama Distributor</th>
			<th>Alamat</th>
			<th>Telepon</th>
			<th>Email</th>
			<th>action</th>
			<th>action</th></tr>
		</thead>
		<tbody>
				<c:forEach var="distributor" items="${distributor}">
				<tr>
					<th>${distributor.namaDistributor}</th>
					<th>${distributor.alamat}</th>
					<th>${distributor.telepon}</th>
					<th>${distributor.email}</th>
																              	<!-- untuk ngelink dan memberikan nilai ID -->
					<th><a href="<c:url value="/master/distributor/detail?id=${distributor.id}"/>" ><i class="icon-pencil"></i></a></th>
					<th><a href="<c:url value="/master/distributor/delete?id=${distributor.id}"/>" onClick="return confirmDelete()"><i class="icon-remove"></i></a></th>
				</tr>
				</c:forEach>
		</tbody>
		</table>
	</fieldset>
	<div>
	</div>
</body>
</html>