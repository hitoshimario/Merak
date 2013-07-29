<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stok</title>
<link type="text/css" href='<c:url value="/resources/css/demo_table.css"/>' rel="stylesheet"/>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery.dataTables.js"/>'></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function(){
		$('#example').dataTable({
			"sPaginationType":"full_numbers"
		});
	});
</script>
</head>
<body>
	<fieldset>
		<legend><b>Stok Barang Masuk</b></legend>
		<div style="margin:15px 0;"></div>
		<div>
		<table class="display" id="example">
		<thead>
		<tr>
			<th>Tanggal</th>
			<th>produk</th>
			<th>Stok</th></tr>
		</thead>
		<tbody>
			<c:forEach var="stok" items="${stok}">
				<input type="hidden" name="id" value="${stok.id_stok}">
				<tr class="gradeB">
					<td align="center">${stok.tglStok}</td>
					<td align="center">${stok.produk}</td>
					<td align="center">${stok.stok}</td></tr>
												
			</c:forEach>
			</tbody>
			</table>
			</div>
	</fieldset>
</body>
</html>