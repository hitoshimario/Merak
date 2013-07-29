<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form PO</title>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.8.3.js"/>'></script> 
<script type="text/javascript" src='<c:url value="/resources/js/jquery-ui-1.9.2.custom.js"/>'></script>
<script type="text/javascript">
	var counter=0;
	$ (document).ready(function(){
			$("#addProduk").click(function(){
				$("#produkAppend").append("<br/><select id='produk' name='produk'"+
						"<option value=''>pilihan</option>"+ renderOptions() +"</select>");
				counter++;
			});
			
			function renderOptions(){
				var options = "";
				<c:forEach var="produk" items="${produk}">
					options += "<option value='${produk.id}'>${produk.namaProduk}</option>";
				</c:forEach>
				return options;
			}
	});
</script>
<script type="text/javascript">
	var counter=0;
	$(document).ready(function(){
		$("#addPo").click(function(){
			$("#poAppend").append("<br/><select id='po' name='po'"+
					"<option value=''>pilihan</option>"+ renderOptions() +"</select>");
			counter++;
		});
		
		function renderOptions(){
			var options = "";
			<c:forEach var="poo" items="${poo}">
				options += "<option value='${poo.id}'>${poo.nmrPo}</option>";
			</c:forEach>
				return options;
		}
	});
</script>
<script type="text/javascript">
	var counter=0;
	$(document).ready(function(){
		$("#addStok").click(function(){
			$("#stokAppend").append("<br/>"+test()+"</th>");
			counter++
		});
		function test(){
			var  text ="";
			text += "<input type='text' name='stok'>";
			return text;
		}
	})
</script>
<script type="text/javascript">
	var counter=0;
	$(document).ready(function(){
		$("#addHarga").click(function(){
			$("#hargaAppend").append("<br/>"+test()+"</th>");
			counter++
		});
		function test(){
			var  text ="";
			text += "<input type='text' name='harga'>";
			return text;
		}
	})
</script>
<script type="text/javascript">
	var counter=0;
	$(document).ready(function(){
		$("#addTotal").click(function(){
			$("#totalAppend").append("<br/>"+test()+"</th>");
			counter++
		});
		function test(){
			var  text ="";
			text += "<input type='text' name='total'>";
			return text;
		}
	})
</script>
</head>
<body>
		<fieldset>		
		  <legend><b>Form Purchase Order</b></legend>
			<table class="display">
					<input type="hidden" name="id" value="${po.id}">
				<tr>
					<td>No Po</td><td><input type="text" name="nmrPo" value="${po.nmrPo}" readonly="readonly"></td></tr>
				<tr>
					<td>Tanggal</td><td><input type="text" name="tglPo" value="${po.tglPo}" readonly="readonly"></td></tr>
				<tr>
					<td>Distributor</td><td><input type="text" name="distributor" value="${po.distributor}" readonly="readonly"></td></tr>
			</table>
		</fieldset>
		<div>
		<fieldset>		
			<legend><b>Input</b></legend>
			<form action="<c:url value="addDetail"/>" method="post">
				<table class="display" border="1px">				
					<tr>
							<th>No Po</th>
							<th>Produk</th>
							<th>Jumlah</th>
					</tr>
						<tr>
							<th id="poAppend"><select id="po" name="po">
								<option value="">pilihan</option>
								<c:forEach var="poo" items="${poo}">
								<option value="${poo.id}">${poo.nmrPo}</option>
								</c:forEach>
								</select>
								<label id="addPo">add</label>
							<th id="produkAppend">
								<select id="produk" name="produk">
									<option value="">pilihan</option>
										<c:forEach var="produk" items="${produk}">
											<option value="${produk.id}">${produk.namaProduk}</option>
										</c:forEach>
								</select>
								<label id="addProduk">add</label>
								</th>
							<th id="stokAppend"><input type="text" name="stok">
								<label id="addStok">add</label></th>
				<!-- 			<th id="hargaAppend"><input type="text" name="harga">
								<label id="addHarga">add</label></th>
							<th id="totalAppend"><input type="text" name="total">
								<label id="addTotal">add</label></th> -->
							</tr>
					<tr>
					<td class="tombol"><input type="submit" name="submit" value="SAVE"></td></tr>
					</table>
			</form>
			</fieldset>
		</div>
</body>
</html>