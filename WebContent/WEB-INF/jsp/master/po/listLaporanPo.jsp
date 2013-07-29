<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" href='<c:url value="/resources/css/demo_table.css"/>' rel="stylesheet">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery.dataTables.js"/>'></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function(){
		$('#contoh').dataTable({
			"sPaginationType" : "full_numbers"
		});
	});
</script>	

</head>
<body>
	<fieldset>
						<legend><b>Laporan Purchase Order</b></legend>
							<table class="display"  id="contoh">
						 	<thead> 
						 		<tr>
										<th>No PO</th>
										<th>Tanggal</th>
										<th>Distributor</th>
										<th>Produk</th>
										<th>Jumlah</th>
										<th>Harga</th>
										<th>Total</th></tr>	
							</thead>
							<tbody>
								<c:forEach items="${poDetail}" var="ci">									
									<tr>
								    	<th><c:out value="${ci[5]}" /></th>
										<th><c:out value="${ci[7]}" /></th>
										<th><c:out value="${ci[6]}" /></th>
								        <th><c:out value="${ci[3]}" /></th>
										<th><c:out value="${ci[0]}" /><span> (<c:out value="${ci[4]}" />)</span></th>
										<th><c:out value="${ci[1]}" /></th>
										<th><c:out value="${ci[2]}" /></th>										 
									</tr>
								</c:forEach>
						 	 </tbody>
							</table>
							</fieldset>
</body>
</html>