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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/home.css">
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
                <img class="logo" src="../img/logo.png">
                <ul>
                    <li><a class="active" href="index.jsp">Deconnexion</a> </li>
                </ul>
            </nav>
	<nav class="navbar navbar-light bg-light">
			Resultats des votes
	</nav>
<div class="container">
		<table class="table">
			<tr>
<% GestionBd bd = new GestionBd();
   int nbrVotes;
   ArrayList<String> list = bd.getCandidats();
   for(String candidat : list){
%>
	   <th><%=candidat%></th>
<%
   }
%>
</tr>
<tr>
<%
   for(String candidat : list){
	   nbrVotes = bd.getNbrVotes(candidat);
%>
	   <td><%=nbrVotes%></td>
<%
   }
%>
</tr>
</table>
</div>
</body>
</html>