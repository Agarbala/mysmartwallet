<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.Period" %>
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
     	<link href="https://cdn.datatables.net/datetime/1.4.0/css/dataTables.dateTime.min.css" rel="stylesheet"/> 	    	
	</head>

	<body>		
		<div class="mainCont">
	        <jsp:include page="/sidebar.jsp">
	        	<jsp:param name="obieSelected" value="true" />
	        </jsp:include>
			<div class="main-content">
				<div class="modal fade modal-right" id="aggiungiObiettivo" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">Aggiungi Obiettivo</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form id="nuovoObiettivo" action="/obiettivi/aggiungi" method="GET">
						    <input type="hidden" name="pagina" value="pagina"/>
						    <input type="hidden" name="idconto" value="${conto.id}"/>
						    <table>
				                <tr>
				                    <td>
				                        <label for="importo">Importo:</label>
				                    </td>
				                    <td>
				                        <input type="number" id="importoNuovo" name="importo" min="0" step=".01" required>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <label for="data">Data di Inizio:</label>
				                    </td>
				                    <td>
				                        <input type="date" id="datainizioNuovo" name="datainizio" required>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <label for="data">Data di Fine:</label>
				                    </td>
				                    <td>
				                        <input type="date" id="datafineNuovo" name="datafine" required>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <label for="note">Note:</label>
				                    </td>
				                    <td>
				                        <textarea id="noteNuovo" name="note" maxlength="200"></textarea>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <label for="nome">Nome:</label>
				                    </td>
				                    <td>
				                        <input type="text" id="nomeNuovo" name="nome" required>
				                    </td>
				                </tr>
				            </table>
					   	</form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
				        <button form="nuovoObiettivo" type="submit" class="btn btn-primary" >Salva</button>
				        
				      </div>
				 	  
				    </div>
				  </div>
				</div>
	            <c:import url="/navbar.jsp"></c:import>
				
		
				<div id="importiTabBox" class="shadow-sm rounded">
				<h3>Obiettivi <a href="#" data-bs-toggle="modal" data-bs-target="#aggiungiObiettivo"><i class="bi bi-plus-circle-fill"></i></a></h3>
						<table id="obiettiviTable" class="table table-fixed table-striped table-hover align-middle">
							<thead>
								<tr>
									<th scope="col">Nome</th>
									<th scope="col">Importo</th>
									<th scope="col">Quota mensile</th>
									<th scope="col">Data di Inizio</th>
									<th scope="col">Data di Fine</th>
									<th scope="col">Completato</th>
									<th scope="col" class="w-25">Note</th>
							<th scope="col" class="td_center"></th>
							<th scope="col" class="td_center"></th>
									
								</tr>
							</thead>
							<tbody>
							
							<c:forEach items="${conto.obiettivi}" var="obiettivo" >
								<tr>
									<td>
										${obiettivo.nome}

									</td>
									<td><fmt:formatNumber type="currency" currencySymbol="€">
											<c:out value="${obiettivo.importo}" />
										</fmt:formatNumber>
									</td>
									<td>
										<fmt:formatNumber type="currency" currencySymbol="€">
											<c:out value="${obiettivo.importo / ((Period.between(obiettivo.datainizio.withDayOfMonth(1), obiettivo.datafine.withDayOfMonth(1)).getMonths()) == 0 ? 1 : (Period.between(obiettivo.datainizio.withDayOfMonth(1), obiettivo.datafine.withDayOfMonth(1)).getMonths()) )}" />
										</fmt:formatNumber>
									</td>
									<td>${obiettivo.datainizio}</td>
									<td>${obiettivo.datafine}</td>
									<td>${obiettivo.completato ? '1' : '0'}</td>
									<td class="truncate">${obiettivo.note}</td>
									<td class="td_center">
										<a class="modButton" id="mod" title="Modifica" href="#" data-bs-toggle="modal" data-bs-target="#modificaObiettivoModale" data-id="${obiettivo.id}">
											<i class="fa-solid fa-pencil"></i>
										</a>
									</td>
									<td class="td_center">
										<a id="del" title="Elimina" href="/obiettivi/elimina?id=${obiettivo.id}&pagina=lista">
										<i class="bi bi-x-circle-fill"></i>
										
										</a>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div >				
	        </div>
    	</div>
		
		
		<c:import url="/footer.jsp"></c:import>

		 <!-- Inclusione di jQuery -->
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script src="https://cdn.datatables.net/datetime/1.4.0/js/dataTables.dateTime.min.js"></script>
		<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
		
		
		<script src="https://cdn.datatables.net/v/bs5/dt-1.13.4/cr-1.6.2/fc-4.2.2/sb-1.4.2/datatables.min.js"></script>ù
		<script src="https://cdn.datatables.net/plug-ins/1.13.4/sorting/datetime-moment.js"></script>
		
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
		
		<script>
		
		 
		$(document).ready(function() {
			
			$('#obiettiviTable').DataTable( {
				language: {
			        url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/it-IT.json',
			    },
			      "lengthChange": true,
			      colReorder: false,
			      columnDefs: [
			    	    { orderable: false, targets: [0,1,2,3,4,5,6] },
			    	    { "searchable": false, "targets": [1,2,3,4] }
			    	  ],
			    	  order: [[5, 'asc'],[4, 'asc']]
			       
			} );
		    
		    $(".modButton").click(function() {
				var id = this.dataset.id;
				$.ajax({
	                url: '/transazioni/getTransazione',
	                type: 'POST',
	                data: {id: id},
	                success: function(response) {
	                    if (response) {
	                    	const map = new Map(Object.entries(response));
	                    	$("#idTransazione").val(map.get('id'));
	                    	map.forEach((value, key) => {
	                    		if(key == 'metodo' || key == 'categoria') {
	                    			$("#" + key).val(value.toLowerCase());
	                    		} else if( key == 'tipo') {
	                    				if(value == 'ENTRATA') {
	                    					$("#entrata").prop("checked", true);
	                    				} else {
	                    					$("#uscita").prop("checked", true);
	                    				}
	                    		} else {
	                    			$("#" + key).val(value);
	                    		}     		
	                    	});
	                    } 
	                }
	            });
			});    
		});
		
		
		</script>
	</body>
</html> 