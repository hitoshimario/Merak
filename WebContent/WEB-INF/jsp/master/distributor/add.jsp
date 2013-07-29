<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distributor</title>
</head>
<link type="text/css" href='<c:url value = "/resources/css/validasi.css"/>' rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery.validate.js"/>'></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#tambahData').validate({
			rules : {
				namaDistributor : "required",
				alamat: {
					required: true
			    },
				telepon :{
					required: true,
					number:true
				},
			     email :{
					required: true					
				}
			},
			
			messages : {
				namaDistributor: {
					required: 'Nama Distributor Harus Diisi'
				},
				alamat: {
					required: 'Alamat Harus Diisi'
				},
				telepon: {
					required: 'Telepon Harus Diisi',
					number: 'Nomor Telepon Harus Angka'
				},
				email :{
					required: 'Email Harus Diisi'
				}
			},
			
			success : function(label) {
				label.text('OK!').addClass('valid');
			}
		});
	});
</script>
<body>
	<form class="form-horizontal" id="tambahData" name="form" action="<c:url value="add"/>" method="post">
		<fieldset>
			<legend><b>Add Input</b></legend>
			<div class="control-group">
				<label class="control-label">Nama Distributor</label>
				<div class="controls">
					  <input type="text" id="namaDistributor" name="namaDistributor" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Alamat</label>
				<div class="controls">
					  <input type="text" id="alamat" name="alamat" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Telepon</label>
				<div class="controls">
					  <input type="text" id="telepon" name="telepon" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Email</label>
				<div class="controls">
					  <input type="text" id="email" name="email" />
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button class="btn btn-small" type="submit">Add Distributor</button>
				</div>
			</div>
		</fieldset>
		</form>
</body>
</html>