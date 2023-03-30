<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">My Smart Wallet <!-- <img id="logo" src="./logo.png" alt="logo"> --></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">

			<ul class="navbar-nav mb-2 mb-lg-0">
				<li class="nav-item">
					<div id="userCont">

						<a href="#">
							<h6>Ciao, <br>
								<c:out value="${conto.utente.nome}" />
							</h6>
						</a>
						<div id="userImg">
							<!-- implementare immagine utente -->
							<a href="#"><img alt="" src="/imgs/gianpiero.jpeg"></a>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>