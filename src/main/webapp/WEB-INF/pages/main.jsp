<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Main page</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../static/css/main_style.css">
<script src="../static/js/main_script.js"></script>
<%@ page isELIgnored="false"%>
</head>
<body>

	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<a href="../logout" class="btn btn-primary navbar-btn navbar-right">Log out</a>
					<p class="navbar-text navbar-left">
						Signed in as <a href="../profile" class="navbar-link">${pageContext.request.userPrincipal.name}</a>
					</p>
				</c:if>
			</div>
		</nav>

		<div id="product-panel" class="panel panel-default">
			<div class="panel-heading">Products</div>
			<!--panel body-->
			<div class="panel-body">
				<button type="button" class="btn btn-success" data-toggle="modal" data-target="#add-product">
					<span class="glyphicon glyphicon-plus-sign"></span> Add New&hellip;
				</button>
			</div>

			<div class="panel-table">
				<!-- Table of products-->
				<table id="product-table" data-toggle="table" class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Serial</th>
							<th>Name</th>
							<th>Price</th>
							<th>Weight</th>
							<th>Dimensions</th>
							<th>Manufactured</th>
							<th>Expiration Date</th>
							<th class="sm-clmn">Options</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products}" var="product">
							<tr>
								<td id="product-serial">${product.getSerial()}</td>
								<td id="product-name">${product.getName()}</td>
								<td id="product-price">${product.getPrice()}</td>
								<td id="product-weight">${product.getWeight()}</td>
								<td id="product-dimensions">${product.getDimensions()}</td>
								<td id="product-mdate">${product.getManufDate()}</td>
								<td id="product-edate">${product.getExpDate()}</td>
								<td class="sm-clmn"><a id="edit-product" href="" data-product-id="${product.getId()}" data-product-serial="${product.getSerial()}" data-product-name="${product.getName()}"
									data-product-price="${product.getPrice()}" data-product-weight="${product.getWeight()}" data-product-dimensions="${product.getDimensions()}" data-product-mdate="${product.getManufDate()}"
									data-product-edate="${product.getExpDate()}" data-toggle="modal" data-target="#confirm-edit" title="Edit"><i class="glyphicon glyphicon-edit"></i></a> <a id="delete-product" href=""
									data-product-name="${product.getName()}" data-product-id="${product.getId()}" data-toggle="modal" data-target="#confirm-delete" title="Remove"><i class="glyphicon glyphicon-remove"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
                
        <!-- Edit product dialog -->
		<div class="modal fade" id="confirm-edit" tabindex="-1" role="dialog" aria-labelledby="edit-product" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title">
							Edit product <span id="data-from-main"></span>
						</h4>
					</div>
					<form id="product-edit-form" class="form-horizontal" role="form" method="POST" name="product">
						<div class="modal-body">
							<div class="container-fluid">
								<div class="form-group">
									<span class="label label-info">Serial:</span> <input id="edit-product-serial" class="form-control" type="text" name="serial" placeholder="">
								</div>
								<div class="form-group">
									<span class="label label-info">Name:</span> <input id="edit-product-name" class="form-control" type="text" name="name" placeholder="">
								</div>
								<div class="form-group">
									<span class="label label-info">Price($):</span> <input id="edit-product-price" class="form-control" type="number" min="0" max="99999999.99" step="1" name="price">
								</div>
								<div class="form-group">
									<span class="label label-info">Weight(kg):</span> <input id="edit-product-weight" class="form-control" type="number" min="0" max="999.99" step="0.5" name="weight">
								</div>
								<div class="form-group">
									<span class="label label-info">Dimensions(LxWxH, cm):</span> <input id="edit-product-dimensions" class="form-control" type="text" name="dimensions" placeholder="">
								</div>
								<div class="form-group">
									<span class="label label-info">Manufactured Date(yyyy-dd-mm):</span> <input id="edit-product-mdate" class="form-control" type="text" maxlength="10" name="manufDate" placeholder="">
								</div>
								<div class="form-group">
									<span class="label label-info">Expiration Date(yyyy-dd-mm):</span> <input id="edit-product-edate" class="form-control" type="text" maxlength="10" name="expDate" placeholder="">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div class="container-fluid">
								<div class="form-group">
									<button id="edit-btn" type="submit" value="Submit" class="btn btn-primary btn-lg" formaction="">
										<span class="glyphicon glyphicon-edit"></span> Edit
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
                
        <!-- Confirmation of product removing -->
		<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="delete-product" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title">Confirmation of deleting</h4>
					</div>
					<div class="modal-body">
						<h4 class="text-warning">
							Are you sure you want to delete product <span id="name-from-main"></span>?
						</h4>
					</div>
					<div class="modal-footer">
						<form role="form" action="" method="post">
							<button id="dlt-btn" type="submit" class="btn btn-success" formaction="">
								<span class="glyphicon glyphicon-ok-circle"></span> Yes
							</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">
								<span class="glyphicon glyphicon-ban-circle"></span> No
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Adding a new product dialog -->
		<div class="modal fade" id="add-product" tabindex="-1" role="dialog" aria-labelledby="add-product" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title">Add New Product</h4>
					</div>
					<form id="product-add-form" class="form-horizontal" role="form" method="POST" action="product/add" name="product">
						<div class="modal-body">
							<div class="container-fluid">
								<div class="form-group">
									<span class="label label-info">Serial:</span> <input class="form-control" type="text" name="serial" placeholder="Product Serial">
								</div>
								<div class="form-group">
									<span class="label label-info">Name:</span> <input class="form-control" type="text" name="name" placeholder="Product Name">
								</div>
								<div class="form-group">
									<span class="label label-info">Price($):</span> <input class="form-control" type="number" min="0" value="1.0" max="99999999.99" step="1" name="price">
								</div>
								<div class="form-group">
									<span class="label label-info">Weight(kg):</span> <input class="form-control" type="number" min="0" value="0.5" max="999.99" step="0.5" name="weight">
								</div>
								<div class="form-group">
									<span class="label label-info">Dimensions(LxWxH, cm):</span> <input class="form-control" type="text" name="dimensions" placeholder="Product Dimensions (LengthxWidthxHeight)">
								</div>
								<div class="form-group">
									<span class="label label-info">Manufactured Date(yyyy-dd-mm):</span> <input class="form-control" type="text" maxlength="10" name="manufDate" placeholder="Product Manufactured Date (yyyy-dd-mm)">
								</div>
								<div class="form-group">
									<span class="label label-info">Expiration Date(yyyy-dd-mm):</span> <input class="form-control" type="text" maxlength="10" name="expDate" placeholder="Product Expiration Date (yyyy-dd-mm)">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div class="container-fluid">
								<div class="form-group">
									<button type="submit" value="Submit" class="btn btn-success btn-lg">
										<span class="glyphicon glyphicon-plus-sign"></span> Add
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>

