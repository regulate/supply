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
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${pageContext.request.userPrincipal.name != null}">
					        <li class="dropdown">
					        	<a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					            	<span class="glyphicon glyphicon-user" aria-hidden="true"></span> ${pageContext.request.userPrincipal.name}
					              	<span class="caret"></span>
					          	</a>
					          	<ul class="dropdown-menu">
						          	<li>
						          		<a href="main/">
					           	  			<span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home
					           	  		</a>
						          	</li>
						          	<li role="separator" class="divider"></li>
					           	  	<li>
					           	  		<a href="logout">
					           	  			<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Log out
					           	  		</a>
					           	  	</li>
					          	</ul>
					        </li>
				        </c:if>
				    </ul>
				    <a class="navbar-brand">SUPPLY | <small>Profile's page</small></a>
				</div>
			</nav>

			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">Profile information</h3>
				</div>
				<div class="panel-body">
					<div class="container-fluid">

						<h3>Main information</h3>

						<div class="row top-divider">
							<label for="email-well" class="col-md-2 control-label">Email:</label>
							<div class="col-md-6">
								<div id="email-well" class="well well-sm">${profile.getEmail()}</div>
							</div>
						</div>

						<div class="row">
							<label for="regd-well" class="col-md-2 control-label">Registration date:</label>
							<div class="col-md-6">
								<div id="regd-well" class="well well-sm">${profile.getRegDate()}</div>
							</div>
						</div>

						<div class="row">
							<label for="role-well" class="col-md-2 control-label">Role:</label>
							<div class="col-md-6">
								<div id="role-well" class="well well-sm">${profile.getRole().getRoleName()}</div>
							</div>
						</div>

						<div class="row">
							<label for="status-well" class="col-md-2 control-label">Status:</label>
							<div class="col-md-6">
								<div id="status-well" class="well well-sm">${profile.isBanned() == true ? "Banned" : "Not banned"}</div>
							</div>
						</div>

						<h3>Additional information</h3>
						<div class="row top-divider">
							<label for="rm-well" class="col-md-2 control-label">Remember me session:</label>
							<div class="col-md-6">
								<div id="rm-well" class="well well-sm">
									<sec:authorize access="isRememberMe()" var="rememberStatus"></sec:authorize>
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

						<h3>Changable information</h3>

						<form id="profile-update" class="form-horizontal" role="form" method="POST" action="profile/details/change" name="user">
							<div class="form-group top-divider">
								<label for="pass-btn" class="col-md-2 control-label">Password:</label>
								<div class="col-md-6">
									<button id="pass-btn" type="button" class="btn btn-danger" data-toggle="modal" data-target="#update-password">
										<span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Change
									</button>
								</div>
							</div>

							<div class="form-group">
								<label for="fname-input" class="col-md-2 control-label">First name:</label>
								<div class="col-md-6">
									<input id="fname-input" type="text" class="form-control" name="fName" value="${profile.getFirstName()}" required>
								</div>
							</div>

							<div class="form-group">
								<label for="lname-input" class="col-md-2 control-label">Last name:</label>
								<div class="col-md-6">
									<input id="lname-input" type="text" class="form-control" name="lName" value="${profile.getLastName()}" required>
								</div>
							</div>
							
							<div class="form-group">
	    						<div class="col-md-offset-2 col-md-6">
	      							<button type="submit" value="Submit" class="btn btn-success">
										<span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Update
									</button>
	    						</div>
	  						</div>
						</form>
					</div>
				</div>

				<!-- Generates footer only if there is some error or success msg -->
				<c:if test="${not empty success or not empty error}">
					<div class="panel-footer">
						<div class="container">
							<div class="row">
								
								<c:if test="${not empty success}">
									<div class="alert alert-success text-center col-md-6 col-md-offset-3">
										<c:choose>
											<c:when test="${success eq 'pass'}">
												<spring:message code="label.profile_pass_ch_success" />
											</c:when>
											<c:otherwise>
												<spring:message code="label.profile_details_ch_success" />
											</c:otherwise>
										</c:choose>
									</div>
								</c:if>
								
								<%-- <c:when test="${success eq 'details'}">
										<spring:message code="label.profile_details_ch_success" />
								</c:when> --%>

								<c:if test="${not empty error}">
									<div class="alert alert-danger text-center col-md-6 col-md-offset-3">
										<c:choose>
											<c:when test="${error eq 'invalid_input'}">
												<spring:message code="label.profile_field_ch_invalid" />
											</c:when>
											<c:when test="${error eq 'incorrect_password'}">
												<spring:message code="label.profile_pass_ch_incorect" />
											</c:when>
										</c:choose>
									</div>
								</c:if>

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
										<span class="label label-info">Current password:</span> 
										<input id="cur-pass" class="form-control" type="password" name="curPass" placeholder="" required>
									</div>
									<div class="form-group">
										<span class="label label-info">New password:</span> 
										<input id="new-pass" class="form-control" type="password" name="newPass" placeholder="" required>
									</div>
									<div class="form-group">
										<span class="label label-info">Repeat new password:</span> 
										<input id="new-pass-rep" class="form-control" type="password" name="passToCompare" placeholder="" required>
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