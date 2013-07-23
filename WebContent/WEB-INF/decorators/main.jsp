<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Merak</title>
	<link type="text/css" href='<c:url value = "/resources/css/style.css"/>' rel="stylesheet" />
	<link type="text/css" href='<c:url value = "/resources/css/bootstrap.css"/>' rel="stylesheet" />
	<link type="text/css" href='<c:url value = "/resources/menu_assets/styles.css"/>' rel="stylesheet" />
	<decorator:head/>
</head>
<body>
	<div id="container">
		<div id="header">
        	<div id="logo"></div>
		</div>
		<div id='cssmenu'>
			<ul>
				<li class='active '><a href="<c:url value="/"/>"><span>Home</span></a></li>
			   	<li class='has-sub '><a href='#'><span>Master</span></a>
					<ul>
						<li><a href="<c:url value="/master/kategori/list"/>"><span>Kategori</span></a></li>
					 	<li><a href="<c:url value="/master/satuan/list"/>"><span>Satuan</span></a></li>
					 	<li><a href="<c:url value="/master/alat/list"/>"><span>Alat</span></a></li>
					 	<li><a href="<c:url value="/master/produk/list"/>"><span>Produk</span></a></li>
				  	</ul>
				</li>
			   	<li class='has-sub '><a href='#'><span>Master User</span></a>
					<ul>
					 	<li><a href="<c:url value="/master/pelanggan/list"/>"><span>Pelanggan</span></a></li>
					 	<li><a href="<c:url value="/master/dokter/list"/>"><span>Dokter</span></a></li>
					 	<li><a href="<c:url value="/master/suster/list"/>"><span>Suster</span></a></li>
					 	<li><a href="<c:url value="/master/distributor/list"/>"><span>Distributor</span></a></li>
					</ul>
				<li class='has-sub '><a href='#'><span>Perawatan</span></a>
					<ul>
					 	<li><a href="<c:url value="/master/paketPerawatan/list"/>"><span>Paket Perawatan</span></a></li>
					 	<li><a href="<c:url value="/master/perawatan/list"/>"><span>Perawatan</span></a></li>
					</ul>
				<li class='has-sub '><a href='#'><span>Transaksi</span></a>
					<ul>
					 	<li><a href="<c:url value="/master/po/list"/>"><span>PO</span></a></li>
					 	<li><a href="<c:url value="/master/poHistori/list"/>"><span>PO. Histori</span></a></li>
					</ul>
			</ul>
		</div>
		<div id="content">
			<decorator:body/>
			<!-- <form class="form-horizontal">
			  <div class="control-group">
				<label class="control-label" for="inputEmail">Email</label>
				<div class="controls">
				  <input type="text" id="inputEmail">
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="inputPassword">Password</label>
				<div class="controls">
				  <input type="password" id="inputPassword">
				</div>
			  </div>
			  <div class="control-group">
				<div class="controls">
				  <button class="btn btn-small" type="button">Add Kategori</button>
				</div>
			  </div>
			</form> -->
		</div>
        <div id="sFoot"></div>
		<div id="footer">
			Copyright © Bootcamp30, 2013
		</div>
	</div>
</body>
</html>