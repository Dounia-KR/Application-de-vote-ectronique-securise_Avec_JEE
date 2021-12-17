<%@page import="com.app.dao.Covotant"%>
<%@page import="java.util.Collection"%>
<%@page import="com.app.dao.GestionBd"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Centre de comptage CO</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar" style="background-color:#B7BFC4">
                <img class="logo" src="img/logo.png">
                <ul>
                    <li><a class="active" href="vues/index.jsp">Deconnexion</a> </li>
                </ul>
            </nav>
	<nav class="navbar navbar-light bg-light">
			centre de comptage CO
	</nav>
	<div class="container">
		<table class="table">
			<tr>
				<th>id</th>
				<th>Nom</th>
				<th>Prenom</th>
				<th>Date Naissance</th>
				<th>Identificateur</th>
				<th>Bulltin Vote</th>
			</tr>
			<%
				GestionBd bd = new GestionBd();
				Collection<Covotant> covotants = bd.getAllCo();
					for (Covotant covotant : covotants) {
			%>

			<tr>
				<td><%=covotant.getId()%></td>
				<td><%=covotant.getNom()%></td>
				<td><%=covotant.getPrenom()%></td>
				<td><%=covotant.getDatenaissance()%></td>
				<td><%=covotant.getIdentification()%></td>
				<td><%=covotant.getBulltinvote()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>