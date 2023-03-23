<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Dashboard</title>
	</head>
	<body>

		<h1>Benvenuto <c:out value="${conto.utente.nome}"/>  <c:out value="${conto.utente.cognome}"/></h1>
		<!--  Prova stampa oggetto Conto -->
		<c:out value="${conto}"/>
		<a href="/logout">Logout</a>
	</body>
</html>