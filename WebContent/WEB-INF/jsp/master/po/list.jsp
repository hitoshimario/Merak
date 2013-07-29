<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase Order</title>
<link type="text/css" href='<c:url value = "/resources/css/demo_page.css"/>' rel="stylesheet" />
<link type="text/css" href='<c:url value="/resources/css/demo_table.css"/>' rel="stylesheet"/>
<link type="text/css" href='<c:url value = "/resources/css/ui.all.css"/>' rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.3.2.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery.dataTables.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/ui.core.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/ui.datepicker.js"/>'></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#tgl_lahir").datepicker({dateFormat: 'yy-mm-dd', changeMonth: true,
		      changeYear: true});
	});
</script>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function(){
		$('#example').dataTable({
			"sPaginationType": "full_numbers"
		});
	});
</script>
</head>
<body>
		<fieldset>
		<a href="<c:url value="/master/po/add"/>">
			<button class="btn btn-small" type="button">Add PO</button>
		</a>
		<div style="margin:15px 0;"></div>
		<table class="display" id="example" >	
			<thead>	
				<tr>
					<th>No PO</th>
					<th>Tanggal</th>
					<th>Distributor</th>
					<th>action</th>
				</tr>
			</thead>
		<tbody>
			<c:forEach var="po" items="${po}">
			<input type="hidden" value="${po.id}">
				<tr>									    
						<td align="center">${po.nmrPo}</td>
						<td align="center">${po.tglPo}</td>
						<td align="center">${po.distributor}</td>
						<th><a href="<c:url value="/master/po/addDetail?id=${po.id}"/>">NEXT</a></th>
				</tr>							
			</c:forEach>	
		</tbody>	
		</table>	
		</fieldset>
		</body>
</html>