<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>
			<spring:message code="label.signup_title"/>
		</title>
		<%@ page isELIgnored="false"%>
		<meta charset="utf-8">
		<link rel="stylesheet" href="static/css/main_style.css" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	</head>

	<body>
		<div class="container">
			<nav class="navbar navbar-default navbar-fixed-top">
				<div class="container">
					<ul class="nav navbar-nav navbar-right">
					    <li class="dropdown">
					        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					            <span class="glyphicon glyphicon-globe" aria-hidden="true"></span> Language
					            <span class="caret"></span>
					        </a>
					        <ul class="dropdown-menu">
						        <li>
						          	<a href="?lang=en">English</a>
						        </li>
						        <li role="separator" class="divider"></li>
						        <li>
						          	<a href="?lang=ru">Russian</a>
						        </li>
					        </ul>
					    </li>
				    </ul>
				    <a class="navbar-brand">SUPPLY | <small>Sign up page</small></a>
				</div>
			</nav>
			
			<div id="signupbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">
							<spring:message code="label.title_signup_form" />
						</div>
					</div>

					<div class="panel-body">

						<form id="signupform" class="form-horizontal" role="form" method="POST" action="signup" name="user">

							<div class="form-group">
								<label for="email" class="col-md-3 control-label">
									<spring:message code="label.email" />
								</label>
								<div class="col-md-9">
									<spring:message code="label.email_placeholder" var="emailHolder"/>
									<input type="text" class="form-control" name="email" placeholder="${emailHolder}" required>
								</div>
							</div>

							<div class="form-group">
								<label for="firstName" class="col-md-3 control-label">
									<spring:message code="label.firstname" />
								</label>
								<div class="col-md-9">
									<spring:message code="label.fname_placeholder" var="fnameHolder"/>
									<input type="text" class="form-control" name="firstName" placeholder="${fnameHolder}" required>
								</div>
							</div>

							<div class="form-group">
								<label for="lastName" class="col-md-3 control-label">
									<spring:message code="label.lastname" />
								</label>
								<div class="col-md-9">
									<spring:message code="label.lname_placeholder" var="lnameHolder"/>
									<input type="text" class="form-control" name="lastName" placeholder="${lnameHolder}" required>
								</div>
							</div>

							<div class="form-group">
								<label for="password" class="col-md-3 control-label">
									<spring:message code="label.password" />
								</label>
								<div class="col-md-9">
									<spring:message code="label.pass_placeholder" var="passHolder"/>
									<input type="password" class="form-control" name="password" placeholder="${passHolder}" required>
								</div>
							</div>

							<div class="form-group">
								<!-- Button -->
								<div class="col-md-offset-3 col-md-9">
									<button id="btn-signup" type="submit" value="Submit" class="btn btn-info">
										<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> <spring:message code="label.signup_button" />
									</button>
								</div>
							</div>
							
							<!-- Errors -->
							<c:if test="${error eq 'user_exists'}">
								<div id="login-alert" class="alert alert-danger">
									<spring:message code="label.signup_msg_duplicate" />
								</div>
							</c:if>
							
							<c:if test="${error eq 'invalid_input'}">
								<div id="login-alert" class="alert alert-danger">
									<spring:message code="label.signup_msg_invalid" />
								</div>
							</c:if>

							<div class="form-group">
								<div class="col-md-12 control">
									<div style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%;">
										<a id="signinlink" href="login">
											<spring:message code="label.signin_link" />
										</a>
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
