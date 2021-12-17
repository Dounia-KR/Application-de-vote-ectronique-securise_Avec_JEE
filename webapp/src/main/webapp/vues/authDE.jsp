<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Centre de Depouillement</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
html, body {
	height: 100%;
}
body {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
	background-repeat: no-repeat;
	background-size: cover;
}
.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}
.form-signin .checkbox {
	font-weight: 400;
}
.form-signin .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
	font-weight: bold;
}
.form-signin .form-control:focus {
	z-index: 2;
	
	
}
.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
.back {
	background-color: #000000;
	opacity: 0.6;
	width: 500px;
	height: auto;
	border-radius: 50px;
	zoom:80%;
	color: white;
	font-weight: bold;
	
}
</style>
<!-- Custom styles for this template -->
</head>
<body background="../img/background.jpg">
	<div class="container">
		<center>
			<div class="back">
				<form class="form-signin" method="post"
					action="/webapp/TraiterAuthoDe">
					<h1 class="h3 mb-3 font-weight-normal">Connexion</h1>
					<label>Email</label>
                    <input type="text" id="inputEmail"class="form-control" name="email" placeholder="Entrez Email" required
						autofocus>
				     <label>Mot de Passe</label> 
				     <input type="password" id="inputEmail" class="form-control" name="password" placeholder="Entrez Mot de Passe " required autofocus>
					<label></label>
					<button class="btn btn-lg btn-primary btn-block" type="submit"
						name="env">Connexion</button>
				</form>
			</div>
		</center>
	</div>
</body>
</html>