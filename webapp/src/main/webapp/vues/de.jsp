<%@page import="com.app.dao.Devotant"%>
<%@page import="java.util.Collection"%>
<%@page import="com.app.dao.GestionBd"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Centre de Depouillement</title>
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
                	<li><a class="active" href="vues/result.jsp">Resultat</a> </li>
                    <li><a class="active" href="vues/index.jsp">Deconnexion</a> </li>
                </ul>
            </nav>
	<nav class="navbar navbar-light bg-light">
			centre de Depouillement
	</nav>
	<div class="container">
		<table class="table">
			<tr>
				<th>id</th>
				<th>Identificateur</th>
				<th>Bulltin Vote</th>
			</tr>
			<%
				GestionBd bd = new GestionBd();
				Collection<Devotant> devotants = bd.getAllDe();
					for (Devotant devotant : devotants) {
			%>

			<tr>
				<td><%=devotant.getId()%></td>
				<td><%=devotant.getIdentification()%></td>
				<td><%=devotant.getBulltinvote()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>