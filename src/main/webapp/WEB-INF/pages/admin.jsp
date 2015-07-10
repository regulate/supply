
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ page isELIgnored="false"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="../static/css/main_style.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
		<title>Admin's page</title>
	</head>
	<body>
		<div class="container">
			<nav class="navbar navbar-default navbar-fixed-top">
				<div class="container">
					<button type="button" class="btn btn-primary navbar-btn navbar-right">Log out</button>
					<p class="navbar-text navbar-left">
						Signed in as 
						<a href="#" class="navbar-link">Admin</a>
					</p>
				</div>
			</nav>

			<div class="jumbotron">
				<div class="container">
					<h1>Hello, this is an admin's page!</h1>
				</div>
			</div>

			<div id="users-panel" class="panel panel-default">
				<div class="panel-heading">Manage users</div>
				<!--panel body-->
				<div class="panel-body">
					<button type="button" class="btn btn-success" data-toggle="modal" data-target="#add-admin">
						<span class="glyphicon glyphicon-plus-sign"></span> 
						Add New Admin&hellip;
					</button>
				</div>

				<!-- Table of users-->
				<table id="users-table" data-toggle="table" class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Email</th>
							<th>F.Name</th>
							<th>L.Name</th>
							<th>Password</th>
							<th>Date Registered</th>
							<th>Role</th>
							<th>Options</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="user">
							<tr>
								<td id="">${user.getEmail()}</td>
								<td id="">${user.getFirstName()}</td>
								<td id="">${user.getLastName()}</td>
								<td id="">${user.getPassword()}</td>
								<td id="">${user.getRegDate()}</td>
								<td>${user.getRole().getRoleName()}</td>
								<td>
									<!-- TODO: ban, change role options, delete account -->
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- Adding a new admin dialog -->
			<div class="modal fade" id="add-admin" tabindex="-1" role="dialog" aria-labelledby="add-admin" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							</button>
							<h4 class="modal-title">Add New Administrator</h4>
						</div>
						<form id="admin-add-form" class="form-horizontal" role="form" method="POST" action="new" name="admin">
							<div class="modal-body">
								<div class="container-fluid">
									<div class="form-group">
										<span class="label label-info">Email:</span> 
										<input class="form-control" type="text" name="email">
									</div>
									<div class="form-group">
										<span class="label label-info">First Name:</span> 
										<input class="form-control" type="text" name="firstName">
									</div>
									<div class="form-group">
										<span class="label label-info">Last Name:</span> 
										<input class="form-control" type="text" name="lastName">
									</div>
									<div class="form-group">
										<span class="label label-info">Password:</span> 
										<input class="form-control" type="password" name="password">
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