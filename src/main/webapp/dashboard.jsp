<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Dashboard</title>
		<link rel="stylesheet" type="text/css" href="/css/font.css">
		<link rel="stylesheet" type="text/css" href="/css/style.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
     	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
     	<link href="https://cdn.datatables.net/v/bs5/dt-1.13.4/cr-1.6.2/fc-4.2.2/sb-1.4.2/datatables.min.css" rel="stylesheet"/>
 
     	
	</head>

	<body>		
		<div class="mainCont">
	        <jsp:include page="sidebar.jsp">
	        	<jsp:param name="homeSelected" value="true" />
	        </jsp:include>
			<div class="main-content">
			<c:import url="navbar.jsp"></c:import>
<%-- 	            <c:import url="navbar.jsp"></c:import> --%>

<%-- 				<h1>Benvenuto <c:out value="${conto.utente.nome}"/></h1> --%>
				
				<!-- Modal Aggiungi Transazione-->
				<div class="modal fade modal-right" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form id="nuovaTransazione" action="transazioni/aggiungi" method="GET">
						    <input type="hidden" name="pagina" value="home"/>
						    <input type="hidden" name="idconto" value="${conto.id}"/>
						    <table>
				                <tr>
				                    <td>
				                        <label for="importo">Importo:</label>
				                    </td>
				                    <td>
				                        <input type="number" id="importo" name="importo" min="0" step=".01" required>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <label for="data">Data della transazione:</label>
				                    </td>
				                    <td>
				                        <input type="date" id="datatransazione" name="datatransazione" required>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <label for="note">Note:</label>
				                    </td>
				                    <td>
				                        <textarea id="note" name="note" maxlength="200"></textarea>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <label for="nome">Nome:</label>
				                    </td>
				                    <td>
				                        <input type="text" id="nome" name="nome" required>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <label for="metodo">Metodo di pagamento:</label>
				                    </td>
				                    <td>
				                        <select id="metodo" name="metodo">
				                            <option value="contanti">Contanti</option>
				                            <option value="carta">Carta</option>
				                            <option value="altro">Altro</option>
				                        </select>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <label for="categoria">Categoria:</label>
				                    </td>
				                    <td>
				                        <select id="categoria" name="categoria">
				                            <option value="casa">Casa</option>
				                            <option value="trasporti">Trasporti</option>
				                            <option value="famiglia">Famiglia</option>
				                            <option value="salute e benessere">Salute e benessere</option>
				                            <option value="tempo libero">Tempo libero</option>
				                            <option value="altro">Altro</option>
				                            </select>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <label for="tipo">Tipo di transazione:</label>
				                    </td>
				                    <td>
				                        <input type="radio" id="entrata" name="tipo" value="entrata" required>
				                        <label id="tipo" for="entrata">Entrata</label>
				                        <input type="radio" id="uscita" name="tipo" value="uscita" required>
				                        <label id="tipo" for="uscita">Uscita</label>
				                    </td>
				                </tr>
				            </table>
					   	</form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
				        <button form="nuovaTransazione" type="submit" class="btn btn-primary" >Salva</button>
				      </div>
				 	  <!-- Fine Modal --> 
				 	  
				    </div>
				  </div>
				</div>
				
				
				<div id="bilanciContainer">
				
					<div id="recapMensile" class="shadow rounded">
						<div id="recapImg">
											
							<div id="recaph4">
								<h4>${mese}</h4>
							</div>
							
							<div id="freccia">
							</div>
							
						</div>
						
						<div id="bilanciMens">
						
							<div class="bilancioCont">
								<h4>Bilancio mensile</h4>
								<h5>
									<fmt:formatNumber type="currency" currencySymbol="">
												${bilancioMensile}
									</fmt:formatNumber></h5>
							</div>
							<div class="bilancioCont">
								<h4>Uscite</h4>
								<h5>
									<fmt:formatNumber type="currency" currencySymbol="">
												${uscite}
									</fmt:formatNumber></h5>
								</h5>
							</div>
							<div class="bilancioCont">
								<h4>Entrate</h4>
								<h5>
									<fmt:formatNumber type="currency" currencySymbol="">
												${entrate}
									</fmt:formatNumber></h5>
								</h5>
							</div>
						</div>
					</div>
					
					<div id="bilanciMens2">
					
						<div id="bilancioCol1" class="shadow-sm rounded">
							
							<table id="bilanciTable" class="table table-striped table-hover align-middle">
								<h5>Obiettivi  <a href=""><i class="bi bi-plus-circle-fill"></i></a></h5>

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
								<c:forEach items="${conto.obiettivi}" var="obiettivo">
									<tr>
										<td class="td_center">
											<h6>${obiettivo.nome}</h6>
										</td>
										<td>
											<fmt:formatNumber type="currency" currencySymbol="€">
												${obiettivo.importo}
											</fmt:formatNumber>
										</td>
										<td>3500.00</td>
										<td>354.00</td>
										<td>
											${obiettivo.datafine}
<%-- 											<fmt:parseDate value="${obiettivo.datafine}" pattern="yyyy-MM-dd" var="dataFineObiettivo" type="date"/> --%>
<%-- 											<fmt:formatDate pattern='${dataPattern}' value="${dataFineObiettivo}"/> --%>
										</td>
									</tr>
								</c:forEach>
									
										
								</tbody>
							</table>

						</div >
						<div id="bilancioCol2" class="shadow-sm rounded">
							<div class="bilTot">
								<h4>BILANCIO TOTALE</h4>
							</div>
							<div class="bilTotValuta">
							<c:set var="bilancio" value="0"/>
							<c:forEach items="${conto.transazioni}" var="transazione" >
								<c:set var="bilancio" value="${transazione.tipo.name().equalsIgnoreCase('USCITA') ? bilancio - transazione.importo : bilancio + transazione.importo}"/>
							</c:forEach>
								<h2 id="bilH2" class="${bilancio < 0 ? 'negativo' : 'positivo'}">
									<fmt:formatNumber type="currency" currencySymbol="€">
										<c:out value="${bilancio}" />
									</fmt:formatNumber>
								</h2>
							</div>
						</div >
					</div>


					
					<div id="importiTabBox" class="shadow-sm rounded">
							
						<table id="transazioniTable" class="table table-fixed table-striped table-hover align-middle">
							<h5>Transazioni recenti  <a href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="bi bi-plus-circle-fill"></i></i></a></h5>
							<thead>
								<tr>
									<th scope="col">Data</th>
									<th scope="col">Nome</th>
									<th scope="col">Categoria</th>
									<th scope="col">Tipo</th>
									<th scope="col">Importo</th>
									<th scope="col">Metodo</th>
									<th scope="col" class="w-25">Note</th>
							<th scope="col" class="td_center"></th>
							<th scope="col" class="td_center"></th>
									
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${conto.transazioni}" var="transazione" >
								<tr>
									<td>
										${transazione.datatransazione}
<%-- 										<fmt:parseDate value="${transazione.datatransazione}" pattern="yyyy-MM-dd" var="dataTrans" type="date"/> --%>
<%-- 										<fmt:formatDate pattern='${dataPattern}' value="${dataTrans}"/> --%>
<%-- 									<fmt:formatDate type = "date" value = "${transazione.datatransazione}" /> --%>
									</td>
									<td class="clickableTd" onclick="location.href='transazioni/show?id=${transazione.id}'">${transazione.nome}</td>
									<td>${transazione.categoria.getLabel()}</td>
									<td>${transazione.tipo.getLabel()}</td>
									<td class="${transazione.tipo.getLabel().equalsIgnoreCase('USCITA') ? 'negativo' : 'positivo'}" >
										<fmt:formatNumber type="currency" currencySymbol="€">
											<c:out value="${transazione.importo}" />
										</fmt:formatNumber>
									</td>
									<td>${transazione.metodo.getLabel()}</td>
									<td class="truncate">${transazione.note}</td>
									<td class="td_center">
										<a id="mod" title="Modifica" href="#">
											<i class="fa-solid fa-pencil"></i>
										</a>
									</td>
									<td class="td_center">
										<a id="del" title="Elimina" href="transazioni/elimina?id=${transazione.id}&pagina=home">
										<i class="bi bi-x-circle-fill"></i>
										
<!-- 									<i class="fa-solid fa-trash-can-arrow-up"></i> -->
										</a>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>

					</div >

					
				</div>
				
				
	        </div>
    	</div>
		
		
		<c:import url="footer.jsp"></c:import>

		 <!-- Inclusione di jQuery -->
   		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
		<script src="https://cdn.datatables.net/v/bs5/dt-1.13.4/cr-1.6.2/fc-4.2.2/sb-1.4.2/datatables.min.js"></script>ù
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
		<script src="https://cdn.datatables.net/plug-ins/1.13.4/sorting/datetime-moment.js"></script>
		
		<script>
		
		$(document).ready(function() {
			
		    $.fn.dataTable.moment( 'dddd, MMMM Do, YYYY' );
		 
		    $('#transazioniTable').DataTable( {
				language: {
			        url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/it-IT.json',
			    },
			    
			      colReorder: false,
			      "lengthChange": false,
			      "pageLength": 5,
			      columnDefs: [
			    	    { orderable: false, targets: [0,1,2,3,4,5,6,7,8] }
			    	  ],
			    	  order: [[0, 'desc']]
			       
			} );
			
			$('#bilanciTable').DataTable( {
				language: {
			        url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/it-IT.json',
			    },
			      colReorder: false,
			      "lengthChange": false,
			      "pageLength": 2,
			      "ordering": false
			} );
		} );
		
		
		</script>
	</body>
</html>