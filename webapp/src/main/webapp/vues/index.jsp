<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Welcome</title>
        <link rel="stylesheet" type="text/css" href="css/home.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="wrapper">
            <nav class="navbar">
                <img class="logo" src="img/logo.png">
                <ul>
                    <li><a class="active" href="#">Accueil</a> </li>
                    <li><a href="#About">A propos</a> </li>
                </ul>
            </nav>
            <div class='center'>
                <h1>Bienvenue sur SMD</h1>
                <h2>Technologies</h2>
                <div class="buttons">
                    <a href="vues/register.jsp"><button>Votant</button></a>
                    <a href="vues/authCO.jsp"><button class="btn">Centre de Comptage</button></a><br>
                    <a href="vues/authDE.jsp"><button class="pro">Centre de Depouillement</button></a>
                </div>
            </div>
        </div>
        <div id="About" class="abt">
                <img class="logo" src="img/logo.png">
                <h2>Nous envisageons un monde où n'importe quel employé dans SMD Technologies,</h2>
                <h2>n'importe où, peut partager son opinion en</h2>
                <h2>accédant à la meilleure expérience de votage</h2>
                <h2>en ligne.</h2>
                <hr>
                <div class="abts">
                    <h1>Qui sommes-nous ?</h1>
                    <p>Une application web de vote éléctronique entre les personnelles de SMD Technologies<br>
                        pour élire un nouveau président-directeur général<br>
                    </p>
                </div>
        </div>
    </body>
</html>