<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase Order</title>
</head>
<link type="text/css" href='<c:url value = "/resources/css/validasi.css"/>' rel="stylesheet" />
<link type="text/css" href='<c:url value = "/resources/css/ui.all.css"/>' rel="stylesheet" />

<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery.validate.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-ui-1.9.2.custom.js.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/ui.core.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/ui.datepicker.js"/>'></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#tglPo").datepicker({dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true});
	});
</script>
<body>
	<form class="form-horizontal" name="form" id="tambahData" action="<c:url value="add"/>" method="post">
		<fieldset>
			<legend><b>Input Purchase Order</b></legend>
				<div class="control-group">
					<label class="control-label">Nomor PO</label>
					<div class="controls">
						<input type="text" name="nmrPo" />
					</div>
					</div>
				<div class="control-group">
					<label class="control-label">Tanggal</label>
					<div class="controls">
						<input type="text" id="tglPo" name="tglPo" />
					</div>
				</div>				
				<div class="control-group">
					<label class="control-label">Distributro</label>
					<div class="controls">
						<select name="distributor">
							<option value="">pilihan</option>
							<c:forEach var="distributor" items="${distributor}">
							<option value="${distributor.id}">${distributor.namaDistributor}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button class="btn btn-small" type="submit">SAVE</button>
					</div>		
				</div>
			</fieldset>
		</form>
	</body>
</html>