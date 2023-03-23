<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Le tue transazioni</title>
</head>
<body>
<h1>Lista transazioni</h1>
<c:forEach items="${transazioni}" var="transazione">
	<c:out value="transazione.nome"></c:out>
	<a href="elimina?id=${transazione.id}&pagina=listaTransazioni">Elimina</a>
</c:forEach>
</body>
</html>