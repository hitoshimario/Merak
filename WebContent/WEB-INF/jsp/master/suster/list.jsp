<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Data Dokter</title>
<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery-1.8.3.js"/>'></script>

<!-- Paging Table -->
	<link type="text/css" href='<c:url value = "/resources/css/demo_page.css"/>' rel="stylesheet" />
	<link type="text/css" href='<c:url value = "/resources/css/demo_table.css"/>' rel="stylesheet" />
	<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery.dataTables.js"/>'></script>
	<script type="text/javascript" charset="utf-8">
				$(document).ready(function() {
					$('#pagination').dataTable( {
						"sPaginationType": "full_numbers"
					} );
				} );
			</script>
<!-- EndPagging -->
</head>
<body>
<!-- INDEX: 1). CONTENT 2). FOOTER   -->
<div id="content">
<fieldset><legend>Data Suster</legend>
	<table class="display" class="table1" id="pagination" >
		<thead class="thead1">
		<tr class="gradeC">
			<th>NIP</th><th>NAMA AWAL</th><th>NAMA AKHIR</th><th>JENIS KELAMIN</th><th>TEMPAT LAHIR</th><th>TANGGAL LAHIR</th><th>ALAMAT</th><th>TELEPON</th><th>EMAIL</th><th>EDIT</th><th>DELETE</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${suster}" var="suster">  <!-- keynya, dan awalnya dokter --> 		
		<tr >
			<!--  <td><c:out value="${dokter.id}" /></td>    <!-- id tidak ditampilkan --> 
			<!--  <td><a class="view" href="<c:url value="/master/dokter/detailDokter?id=${dokter.id}"/>">${dokter.nip_dokter}</a></td> -->
			<td><c:out value="${suster.nip_suster}" /></td>
			<td><c:out value="${suster.nama_awal}" /></td>
			<td><c:out value="${suster.nama_akhir}" /></td>
			<td><c:out value="${suster.jns_kelamin eq '0' ?'Laki-laki':'Perempuan' }" /></td>
			<td><c:out value="${suster.tmp_lahir}" /></td>
			<td><c:out value="${suster.tgl_lahir}" /></td>
			<td><c:out value="${suster.alamat}" /></td>
			<td><c:out value="${suster.telepon}" /></td>
			<td><c:out value="${suster.email}" /></td>
			<td width=20> <a class="back" href="<c:url value="/master/suster/detail?id=${suster.id}"/>"><i class="icon-pencil"> </i></a></td>
			<td><a class="back" href="<c:url value="/master/suster/deleteSuster?id=${suster.id}"/>"><i class="icon-remove"> </i></a></td>
				
		</tr>
		</c:forEach>
		</tbody>
	</table>
	<a class="button" href="<c:url value="/master/suster/add"/>"><BUTTON>Tambah Suster</BUTTON></a>
	</fieldset>
</div>
<div id="footer"></div>
</body>
</html>