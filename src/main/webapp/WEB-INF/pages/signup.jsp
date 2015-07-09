<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title><spring:message code="label.signup_title"/></title>
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
		
		<div id="signupbox" style="margin-top: 50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading" style="background-color: #5BC0DE">
					<div class="panel-title" style="color: #FFF">
						<spring:message code="label.title_signup_form" />
					</div>
				</div>

				<div class="panel-body" style="background-color: #2E3338">

					<!-- onsubmit=""  -->
					<form id="signupform" class="form-horizontal" role="form" method="POST" action="signup" name="user">

						<div class="form-group" style="color: #C8C8C8">
							<label for="email" class="col-md-3 control-label"><spring:message code="label.email" /></label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="email" placeholder="${emailHolder}" required>
							</div>
						</div>

						<div class="form-group" style="color: #C8C8C8">
							<label for="firstName" class="col-md-3 control-label"><spring:message code="label.firstname" /></label>
							<div class="col-md-9">
								<spring:message code="label.fname_placeholder" var="fnameHolder"></spring:message>
								<input type="text" class="form-control" name="firstName" placeholder="${fnameHolder}" required>
							</div>
						</div>

						<div class="form-group" style="color: #C8C8C8">
							<label for="lastName" class="col-md-3 control-label"><spring:message code="label.lastname" /></label>
							<div class="col-md-9">
								<spring:message code="label.lname_placeholder" var="lnameHolder"></spring:message>
								<input type="text" class="form-control" name="lastName" placeholder="${lnameHolder}" required>
							</div>
						</div>

						<div class="form-group" style="color: #C8C8C8">
							<label for="password" class="col-md-3 control-label"><spring:message code="label.password" /></label>
							<div class="col-md-9">
								<input type="password" class="form-control" name="password" placeholder="${passHolder}" required>
							</div>
						</div>

						<div class="form-group" style="color: #C8C8C8">
							<!-- Button -->
							<div class="col-md-offset-3 col-md-9">
								<button id="btn-signup" type="submit" value="Submit" class="btn btn-info">
									<i class="icon-hand-right"></i>
									<spring:message code="label.signup_button" />
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
								<div style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%; color: #888">
									<a id="signinlink" href="login" style="color: #FFF">
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
