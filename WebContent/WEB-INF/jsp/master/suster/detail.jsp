<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detail Dokter</title>

<link type="text/css" href='<c:url value="/resources/css/ui.all.css"/>' rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery-1.8.3.js"/>'></script>

<!-- JQUERY for Date -->
<script type="text/javascript" src='<c:url value="/resources/script/jquery/ui.core.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/script/jquery/ui.datepicker.js"/>'></script>
<!--  <link type="text/css" href="calendar.css" rel="stylesheet" />
<script language="javaScript" type="text/javascript" src="calendar.js"> </script> -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#tgl_lahir").datepicker({dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true});
	});
</script>
<!-- End For Date -->

<!-- Validasi -->
<link type="text/css" href='<c:url value = "/resources/css/validasi.css"/>' rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/script/jquery/jquery.validate.js"/>'></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#tambahData').validate({
			rules : {
				nip_dokter:{
					required : true,
					minlength: 5
				},
				nama_awal : "required",
				nama_akhir: "required",
				jns_kelamin: {
					required: true
				},
				tmp_lahir: "required",
				tgl_lahir: "required",
				alamat: "required",
				telepon: {
					required: true,
					number:true
				},
				email: {
					required: true,
					email:true
				}
			},
			
			messages : {
				nip_dokter: {
					required: '   NIP Dokter Harus Diisi',
					minlength: '   NIP Dokter minimal 5 karakter'
				},
				
				nama_awal: {
					required: '   Nama Depan Harus Diisi'
				},
				
				nama_akhir: {
					required: '   Nama Belakang Harus Diisi'
				},
				
				jns_kelamin: {
					required: '	  Jenis Kelamin Harus Diisi'
				},
				
				tmp_lahir: {
					required: '   Tempat Lahir Harus Diisi'
				},
				tgl_lahir: {
					required: '   Tanggal Lahir Harus Diisi'
				},
				alamat: {
					required: '   Alamat Harus Diisi'
				},
				telepon: {
					required: '   Nomor Telepon Harus Diisi',
					number: '   Hanya boleh diisi angka'
				},
				email:{
					required: '   Email Harus Diisi',
					email: '   Email harus valid'
				}
			},
			
			success : function(label) {
				label.text('OK!').addClass('valid');
			}
		});
	});
</script>
<!-- End Validasi -->
<style>
body{
		//font-family: sans-serif;
		//font-size: 11px; 	
	}
	
</style>	
</head>

<body>
<div>
	<fieldset><legend>Data Suster</legend>
		
		<form id="tambahData" name="form" action="<c:url value="/master/suster/saveSuster"/>" method="post">
	
		<table>
			<tr>
				
				<td></td><td><input type="hidden" id="id" name="id" value="${suster.id}" /></td> 
			</tr><tr>
				<td>NIP</td>
				<td><input type="text" class="input" id="nip_dokter" name="nip_dokter" value="${suster.nipSuster}" />
				</td>
			</tr><tr>	
				<td>Nama Depan</td><td><input type="text" id="nama_awal" name="nama_awal" value="${suster.namaAwal}" /></td>
			</tr><tr>	
				<td>Nama Belakang</td><td><input type="text" id="nama_akhir" name="nama_akhir" value="${suster.namaAkhir}" /></td>	
			</tr><tr>	
				<td>Jenis Kelamin</td>
				<td>
					<input type="radio" id="jns_kelamin_laki-laki" name="jns_kelamin" value="0" <c:if test="${suster.jns_kelamin == '0'}">checked="checked"</c:if> />
					<label for="jns_kelamin_laki-laki">Pria</label>
					<input type="radio" id="jns_kelamin_perempuan" name="jns_kelamin" value="1" <c:if test="${suster.jns_kelamin == '1'}">checked="checked"</c:if>/>
					<label for="jns_kelamin_perempuan">Wanita</label>
				</td>
			</tr><tr>	
				<td>Tempat Lahir</td><td><input type="text" id="tmp_lahir" name="tmp_lahir" value="${dokter.tmp_lahir}" /></td>
			</tr><tr>	
				<td >Tanggal Lahir</td><td><input type="text" id="tgl_lahir" name="tgl_lahir" value="${dokter.tgl_lahir}"/></td>
				<!--  <td>Tanggal Lahir</td><td><input type="text" id="input datepicker" name="tgl_lahir" value="<fmt:formatDate value="${dokter.tgl_lahir}" pattern="dd-MM-yyyy"/>"/>-->
				<!--  <td>Tanggal Lahir</td><td><input type="text" id="datepicker" /><td> -->
			</tr><tr>	
				<!-- <td>Alamat</td><td><input type="text" id="alamat" name="alamat" value="${dokter.alamat}" /></td>-->
				<td id="td_alamat">Alamat</td><td><textarea id="alamat" name="alamat" rows="5" cols="30" id="alamat" name="alamat"><c:out value="${dokter.alamat}"/></textarea></td>
			</tr><tr>	
				<td>Telepon</td><td><input type="text" id="telepon" name="telepon" value="${dokter.telepon}" /></td>
			</tr><tr>	
				<td>Email</td><td><input type="text" id="email" name="email" value="${dokter.email}" /></td>
			</tr><tr>	
				<td><input type="submit" value="Simpan" class="button"/></td>
				<!--  <td><input type="submit" value="Update" class="button"/></td> -->
			</tr><tr>
				<td><a class="back" href="<c:url value="/master/dokter/list"/>">Kembali ke Daftar Dokter</a></td>
			</tr>
									
				<!--
				<td><c:out value="${dokter.id}" /></td>
				<td><c:out value="${dokter.nip_dokter}" /></td>
				<td><c:out value="${dokter.nama_awal}" /></td>
				<td><c:out value="${dokter.nama_akhir}" /></td>
				<td><c:out value="${dokter.tgl_lahir}" /></td>
				<td><c:out value="${dokter.tmp_lahir}" /></td>
				<td><c:out value="${dokter.alamat}" /></td>
				<td><c:out value="${dokter.telepon}" /></td>
				<td><c:out value="${dokter.email}" /></td>  -->
			
		</table>
		</form>
	</fieldset>
</div>

</body>
</html>