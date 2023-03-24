<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Dashboard</title>
		<link rel="stylesheet" type="text/css" href="/css/style.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
     	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
	
		
	</head>

	<body>
		
		
		
		<div class="mainCont">
	        <div class="side">
				
				<div class="icon-container">
					<a href="#"><i class="fa-sharp fa-solid fa-house-chimney iconColor"></i></a>
					<span class="icon-label">Home</span>
				</div>
				
				
				<div class="icon-container">
				  <a href="#"><i class="fa-solid fa-right-left"></i></a>
				  <span class="icon-label">Transizioni</span>
				</div>
				
				<div class="icon-container">
					<a href="#"><i class="fa-solid fa-bullseye"></i></a>
					<span class="icon-label">Obiettivi</span>
				</div>
				
				
				<div class="icon-container">
				  <a href="#"><i class="fa-solid fa-wallet iconColor"></i></a>
				  <span class="icon-label">Budget</span>
				</div>
				
				
				<a href="/logout"><i class="fa-sharp fa-solid fa-right-from-bracket" title="logout"></i></a>
				
			</div>
			<div class="main-content">
	            <nav class="navbar navbar-expand-lg bg-body-tertiary">
	                <div class="container-fluid">
	                    <a class="navbar-brand" href="#">My Smart Wallet <!-- <img id="logo" src="./logo.png" alt="logo"> --></a>
	                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	                    <span class="navbar-toggler-icon"></span>
	                    </button>
	                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		                    <form class="d-flex" role="search">
		                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		                        <button class="btn btn-outline-success" type="submit">Search</button>
		                    </form>
	                    	<ul class="navbar-nav mb-2 mb-lg-0">
								<li class="nav-item">
									<a class="nav-link active" aria-current="page" href="/">Home</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">Link</a>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="#">Action</a></li>
										<li><a class="dropdown-item" href="#">Another action</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="#">Something else here</a></li>
									</ul>
								</li>
								<li class="nav-item">
									<div id="userCont">
										
										<a href="#"><h6>ciao, <br><c:out value="${sessionScope.user.nome}"/></h6></a>
										<div id="userImg">
											<a href="#"><img alt="" src="imgs/gianpiero.jpeg"></a>
										</div>
									</div>
								</li>
	                    	</ul>
	                    </div>
	                </div>
	            </nav>

				<h1>Benvenuto <c:out value="${sessionScope.user.nome}"/></h1>
				
				
				<div id="bilanciContainer">
				
					<div id="recapMensile">
						<div id="recapImg">
											
							<div id="recaph4">
								<h4>testo</h4>
							</div>
							
							<div id="freccia">
							</div>
							
						</div>
						
						<div id="bilanciMens">
						
							<div class="bilancioCont">
								<h4>Bilancio mensile</h4>
								<h6>300 €</h6>
							</div>
							<div class="bilancioCont">
								<h4>Uscite</h4>
								<h6>300 €</h6>
							</div>
							<div class="bilancioCont">
								<h4>Entrate</h4>
								<h6>300 €</h6>
							</div>
						</div>
					</div>
					
					<div id="bilanciMens2">
					
						<div id="bilancioCol1">
							
							<table class="table_obiett">
								<h5>obiettivi  <a href=""><i class="fa-sharp fa-solid fa-plus verde"></i></a></h5>

								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">Totale</th>
										<th scope="col">Risparmiato</th>
										<th scope="col">ogni mese</th>
										<th scope="col">Scadenza</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="td_center">
											<h6>Auto nuova</h6>
										</td>
										<td>14.000.00</td>
										<td>3500.00</td>
										<td>354.00</td>
										<td>21/02/2024</td>
									</tr>
										
								</tbody>
							</table>

						</div >
						<div id="bilancioCol2">
							<div class="bilTot">
								<h4>BILANCIO TOTALE</h4>
							</div>
							<div class="bilTot">
								<h2>-153,000.56€</h2>
							</div>
						</div >
					</div>


					
					<div id="importiTabBox">
							
						<table class="table_importi">
							<h5>Transazioni recenti  <a href=""><i class="fa-sharp fa-solid fa-plus verde"></i></i></a></h5>
							<thead>
								<tr>
									<th scope="col">Importo</th>
									<th scope="col">Data</th>
									<th scope="col">Note</th>
									<th scope="col">Nome</th>
									<th scope="col">Categoria</th>
									<th scope="col">Tipo</th>
									<th scope="col">Modifica</th>
									<th scope="col">Elimina</th>
									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="${transazione.importo < 0 ? 'negativo' : 'positivo'}" >80.50 €</td>
									<td>22/03/2023</td>
									<td>cena fuori con Stoca</td>
									<td>nome</td>
									<td>Divertimento</td>
									<td>Uscita</td>
									<td class="td_center">
										<a id="mod" title="modifica" href="#">
											<i class="fa-solid fa-pencil"></i>
										</a>
									</td>
									<td class="td_center">
										<a id="del" title="elimina" href="#">
											<i class="fa-solid fa-trash-can-arrow-up"></i>
										</a>
									</td>
								</tr>
									
							</tbody>
						</table>

					</div >

					
				</div>
				
				
	        </div>
    	</div>
		
		
		<!-- Footer -->
		<footer class="text-center text-lg-start bg-light text-muted">
			<!--Social media -->
			<section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
			<!-- Left -->
			<div class="me-5 d-none d-lg-block">
				<span>Get connected with us on social networks:</span>
			</div>
			<!-- Left -->
		
			<!-- Right -->
			<div>
				<a href="" class="me-4 text-reset">
				<i class="fab fa-facebook-f"></i>
				</a>
				<a href="" class="me-4 text-reset">
				<i class="fab fa-twitter"></i>
				</a>
				<a href="" class="me-4 text-reset">
				<i class="fab fa-google"></i>
				</a>
				<a href="" class="me-4 text-reset">
				<i class="fab fa-instagram"></i>
				</a>
				<a href="" class="me-4 text-reset">
				<i class="fab fa-linkedin"></i>
				</a>
				<a href="" class="me-4 text-reset">
				<i class="fab fa-github"></i>
				</a>
			</div>
			<!-- Right -->
			</section>
			<!-- Section: Social media -->
		
			<!-- Section: Links  -->
			<section class="">
			<div class="container text-center text-md-start mt-5">
				<!-- Grid row -->
				<div class="row mt-3">
				<!-- Grid column -->
					<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
						<!-- Content -->
						<h6 class="text-uppercase fw-bold mb-4">
							<i class="fas fa-gem me-3"></i>Cammelli, 'nduja e carbonara
						</h6>
						<p>
							Gruppo di programmatori chiamato Cammelli, 'nduja e Carbonara con una passione comune per la tecnologia e il cibo. 
							Insieme, creano soluzioni innovative mentre gustano le prelibatezze italiane come la 'nduja piccante e la carbonara cremosa. 
							Una combinazione vincente di creatività e buon gusto!
						</p>
					</div>
					<!-- Grid column -->
			
					<!-- Grid column -->
					<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">
						Tecnolofie
						</h6>
						<p>
						<a href="#!" class="text-reset">Java</a>
						</p>
						<p>
						<a href="#!" class="text-reset">Spring</a>
						</p>
						<p>
						<a href="#!" class="text-reset">Jquery</a>
						</p>
						<p>
						<a href="#!" class="text-reset">Bootstrap</a>
						</p>
					</div>
					<!-- Grid column -->
			
					<!-- Grid column -->
					<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">
						Useful links
						</h6>
						<p>
						<a href="#!" class="text-reset">HOME</a>
						</p>
						<p>
						<a href="#!" class="text-reset">Transizioni</a>
						</p>
						<p>
						<a href="#!" class="text-reset">Obiettivi</a>
						</p>
						<p>
						<a href="#!" class="text-reset">Budjet</a>
						</p>
					</div>
					<!-- Grid column -->
			
					<!-- Grid column -->
					<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Contact</h6>
						<p><i class="fas fa-home me-3"></i> Anywhere, Boh, 01001, IT</p>
						<p>
							<i class="fas fa-envelope me-3"></i>
							cammellindujacarbonara@gmail.com
						</p>
						<p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
						<p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
					</div>
					<!-- Grid column -->
				</div>
				<!-- Grid row -->
			</div>
			</section>
			<!-- Section: Links  -->
		
			<!-- Copyright -->
			<div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
			© 2021 Copyright:
			<a class="text-reset fw-bold" href="#">CNC Group</a>
			</div>
			<!-- Copyright -->
		</footer>
		<!-- Footer -->

		
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
	</body>
</html>