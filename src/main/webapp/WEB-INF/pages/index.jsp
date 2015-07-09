<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- TODO: provide js/jquery validation on client side -->
<html>
<head>
<title><spring:message code="label.title_page"/></title>
<%@ page isELIgnored="false"%>
<meta charset="utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #2E3338">
	<div class="container">
		<span style="float: right; border-bottom: thin solid #FFF;">
			<a href="?lang=en">en</a> | <a href="?lang=ru">ru</a>
		</span>
		<div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading" style="background-color: #5BC0DE">
					<div class="panel-title" style="color: #FFF">
						<spring:message code="label.title_form" />
					</div>
					<div style="float: right; font-size: 80%; position: relative; top: -10px">
						<a href="#" style="color: #FFF"><spring:message code="label.restore_link" /></a>
					</div>
				</div>

				<div style="padding-top: 30px; background-color: #2E3338" class="panel-body">
					
					<form id="loginform" class="form-horizontal" role="form" method="POST" action="login" name="user">

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i>@</i></span>
							<spring:message code="label.email_placeholder" var="emailHolder"></spring:message>
							<input id="login-username" type="text" class="form-control" name="email" placeholder="${emailHolder}">
						</div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
							<spring:message code="label.pass_placeholder" var="passHolder"></spring:message>
							<input id="login-password" type="password" class="form-control" name="password" placeholder="${passHolder}">
						</div>

						<div class="input-group">
							<div class="checkbox" style="color: #888">
								<label> <input id="login-remember" type="checkbox" name="remember-me" value="1">
									<spring:message code="label.remember_check" />
								</label>
							</div>
						</div>
						
						<div style="margin-top: 10px" class="form-group">
							<!-- Button -->
							<div class="col-sm-12 controls">
								<button id="btn-login" type="submit" value="Submit" class="btn btn-success">
									<spring:message code="label.login_button" />
								</button>
							</div>
						</div>
												
						<!-- Errors and info -->
						<c:if test="${not empty success}">
							<div id="login-alert" class="alert alert-success">
								<spring:message code="label.signup_msg_success"/>
							</div>
						</c:if>
						
						<c:if test="${not empty error}">
							<div id="login-alert" class="alert alert-danger">
								<spring:message code="label.auth_error_message"/>
							</div>
						</c:if>
						
						<c:if test="${not empty logout}">
							<div id="login-alert" class="alert alert-info">
								<spring:message code="label.logged_out_message"/>
							</div>
						</c:if>

						<div class="form-group">
							<div class="col-md-12 control">
								<div style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%; color: #888">
									<a href="signup" style="color: #C8C8C8">
										<spring:message code="label.signup_link" />
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
