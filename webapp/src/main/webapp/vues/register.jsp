<%@page import="java.util.ArrayList"%>
<%@page import="com.app.dao.Devotant"%>
<%@page import="java.util.Collection"%>
<%@page import="com.app.dao.GestionBd"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page de Vote</title>
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
					action="/webapp/TraiterVotant">
					<h1 class="h3 mb-3 font-weight-normal">Vote</h1>
					<label>Nom</label>
                    <input type="text" id="inputEmail"class="form-control" name="nom" placeholder="Enter nom" required
						autofocus>
				     <label>Prenom</label> 
				     <input type="text" id="inputEmail" class="form-control" name="prenom" placeholder="Enter prenom" required autofocus> <label>Date
						Naissance</label> 
					<input type="date" id="inputEmail" class="form-control" name="datenaissance" placeholder="Enter date naissance" required
						autofocus> 
					<label>Identifiant</label> 
					<input type="text" name="identification" id="inputEmail" class="form-control"
						placeholder="Enter identification" required autofocus> 
						<label>Choix Condidate</label> 
					<select class="custom-select" name="bulltinvote">
					<% GestionBd bd = new GestionBd();
   					int nbrVotes;
   					ArrayList<String> list = bd.getCandidats();
   					for(String candidat : list){
					%>
						<option value="<%=candidat%>"><%=candidat%></option>
					<%
   					}
					%>
					</select> 
					<label></label>
					<button class="btn btn-lg btn-primary btn-block" type="submit"
						name="env">Envoyer</button>
				</form>
			</div>
		</center>
	</div>
</body>
</html>