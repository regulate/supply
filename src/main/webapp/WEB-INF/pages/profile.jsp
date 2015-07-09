<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<%@ page isELIgnored="false"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<link rel="stylesheet" href="static/css/main_style.css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<title>Profile</title>
</head>
<body>
	<div class="container">

		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<a href="logout" class="btn btn-primary navbar-btn navbar-right">Log out</a>
					<p class="navbar-text navbar-left">
						<a href="main/" class="navbar-link">Main page</a>
					</p>
				</c:if>
			</div>
		</nav>

		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Profile information</h3>
			</div>
			<div class="panel-body">
				<div class="container">
					<div class="row">
						<div class="col-md-2">Email:</div>
						<div class="col-md-6 col-md-offset-1">
							<div class="well well-sm">${profile.getEmail()}</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">First Name:</div>
						<div class="col-md-6 col-md-offset-1">
							<div class="well well-sm">${profile.getFirstName()}</div>
						</div>
						<div class="col-md-1">
							<a type="button" tabindex="0" data-user-fname="${profile.getFirstName()}" data-toggle="modal" data-target="#update-fname" title="Change First Name">
								<i class="glyphicon glyphicon-edit"></i>
							</a>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">Last Name:</div>
						<div class="col-md-6 col-md-offset-1">
							<div class="well well-sm">${profile.getLastName()}</div>
						</div>
						<div class="col-md-1">
							<a type="button" tabindex="0" data-user-lname="${profile.getLastName()}" data-toggle="modal" data-target="#update-lname" title="Change Last Name">
								<i class="glyphicon glyphicon-edit"></i>
							</a>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">Password:</div>
						<div class="col-md-6 col-md-offset-1">
							<div class="well well-sm">${profile.getPassword()}</div>
						</div>
						<div class="col-md-1">
							<a id="ch-pass-btn" type="button" tabindex="0" data-toggle="modal" data-target="#update-password" title="Change Password">
								<i class="glyphicon glyphicon-edit"></i>
							</a>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">Registration Date:</div>
						<div class="col-md-6 col-md-offset-1">
							<div class="well well-sm">${profile.getRegDate()}</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">Role:</div>
						<div class="col-md-6 col-md-offset-1">
							<div class="well well-sm">${profile.getRole().getRoleName()}</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">Status:</div>
						<div class="col-md-6 col-md-offset-1">
							<div class="well well-sm">${profile.isBanned() == true ? "Banned" : "Active"}</div>
						</div>
					</div>
					<!-- Used to indicate if user uses remember me -->
					<div class="row">
						<div class="col-md-2">Remember me session:</div>
						<div class="col-md-6 col-md-offset-1">
							<div class="well well-sm">
								<sec:authorize access="isRememberMe()" var="rememberStatus"/>
								<c:choose>
									<c:when test="${rememberStatus == true}">
										Active
									</c:when>
									<c:otherwise>
										Not active
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Generates footer only if there is some error or success msg -->
			<c:if test="${not empty success or not empty error}">
				<div class="panel-footer">
					<div class="container">
						<div class="row">
							<c:if test="${not empty success}">
								<div id="login-alert" class="alert alert-success text-center col-md-6 col-md-offset-3">
									<spring:message code="label.profile_pass_ch_success" />
								</div>
							</c:if>
	
							<c:choose>
								<c:when test="${error eq 'invalid_input'}">
									<div id="login-alert" class="alert alert-danger text-center col-md-6 col-md-offset-3">
										<spring:message code="label.profile_pass_ch_invalid" />
									</div>
								</c:when>
								<c:when test="${error eq 'incorrect_password'}">
									<div id="login-alert" class="alert alert-danger text-center col-md-6 col-md-offset-3">
										<spring:message code="label.profile_pass_ch_incorect" />
									</div>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</c:if>
		</div>

		<div class="modal fade" id="update-password" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title">Changing your password</h4>
					</div>
					<form id="product-edit-form" class="form-horizontal" role="form" method="POST" action="profile/pass/change">
						<div class="modal-body">
							<div class="container-fluid">
								<div class="form-group">
									<span class="label label-info">Current password:</span> <input id="cur-pass" class="form-control" type="text" name="curPass" placeholder="">
								</div>
								<div class="form-group">
									<span class="label label-info">New password:</span> <input id="new-pass" class="form-control" type="text" name="newPass" placeholder="">
								</div>
								<div class="form-group">
									<span class="label label-info">Repeat new password:</span> <input id="new-pass-rep" class="form-control" type="text" name="passToCompare" placeholder="">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div class="container-fluid">
								<div class="form-group">
									<button id="conf-pass-ch-btn" type="submit" value="Submit" class="btn btn-success">
										<span class="glyphicon glyphicon-edit"></span> Change
									</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal">
										<span class="glyphicon glyphicon-ban-circle"></span> Dismiss
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