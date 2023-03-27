<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<c:set var="dataPattern" value="dd-MM-yyyy"/>

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
	        	<jsp:param name="tranSelected" value="true" />
	        </jsp:include>
			<div class="main-content">
	            <c:import url="/navbar.jsp"></c:import>
				
				<!--  Modal modifica transazione -->
				<div class="modal fade modal-right" id="modificaTransazioneModale" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">Modifica transazione</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form id="modificaTransazione" action="/transazioni/modifica" method="GET">
						    <input type="hidden" name="pagina" value="lista"/>
						    <input type="hidden" name="idconto" value="${conto.id}"/>
						    <input type="hidden" id="idTransazione"  name="id" value=""/>
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
				        <button form="modificaTransazione" type="submit" class="btn btn-primary">Salva</button>
				      </div>
				 	 
				 	  
				    </div>
				  </div>
				</div>
				
				<!-- Fine Modal Modifica Transazione -->
				
				<div id="importiTabBox" class="shadow-sm rounded">
				<h3>Transazioni  <a href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="bi bi-plus-circle-fill"></i></a></h3>
						<table border="0" cellspacing="5" cellpadding="5">
						        	<tbody>
						        		<tr>
								            <td>Dal:</td>
								            <td><input type="text" id="min" name="min"></td>
								            <td>A:</td>
								            <td><input type="text" id="max" name="max"></td>
						        		</tr>
							    	</tbody>
							    </table>
						<table id="transazioniTable" class="table table-fixed table-striped table-hover align-middle">
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

									</td>
									<td class="clickableTd" onclick="location.href='transazioni/show?id=${transazione.id}'">${transazione.nome}</td>
									<td>${transazione.categoria}</td>
									<td>${transazione.tipo}</td>
									<td class="${transazione.tipo.equalsIgnoreCase('USCITA') ? 'negativo' : 'positivo'}" >
										<fmt:formatNumber type="currency" currencySymbol="€">
											<c:out value="${transazione.importo}" />
										</fmt:formatNumber>
									</td>
									<td>${transazione.metodo}</td>
									<td class="truncate">${transazione.note}</td>
									<td class="td_center">
										<a class="modButton" id="mod" title="Modifica" href="#" data-bs-toggle="modal" data-bs-target="#modificaTransazioneModale" data-id="${transazione.id}">
											<i class="fa-solid fa-pencil"></i>
										</a>
									</td>
									<td class="td_center">
										<a id="del" title="Elimina" href="/transazioni/elimina?id=${transazione.id}&pagina=lista">
										<i class="bi bi-x-circle-fill"></i>
										
										</a>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>

					</div >
				<!-- Modal Aggiungi Transazione-->
				<div class="modal fade modal-right" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form id="nuovaTransazione" action="/transazioni/aggiungi" method="GET">
						    <input type="hidden" name="pagina" value="lista"/>
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
		
		var minDate, maxDate;
		
		
		 
		$.fn.dataTable.ext.search.push(
		    function( settings, data, dataIndex ) {
		        var min = minDate.val();
		        var max = maxDate.val();
		        var date = new Date( data[0] );
		 
		        if (
		            ( min === null && max === null ) ||
		            ( min === null && date <= max ) ||
		            ( min <= date   && max === null ) ||
		            ( min <= date   && date <= max ) 
		        ) {
		            return true;
		        }
		        return false;
		    }
		);
		 
		$(document).ready(function() {
			
			$('#transazioniTable').DataTable( {
				language: {
			        url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/it-IT.json',
			    },
			      "lengthChange": true,
			      colReorder: false,
			      columnDefs: [
			    	    { orderable: false, targets: [0,1,2,3,4,5,6,7,8] },
			    	    { "searchable": false, "targets": 4 }
			    	  ],
			    	  order: [[0, 'desc']]
			       
			} );
			
		    // Create date inputs
		    minDate = new DateTime($('#min'), {
		        format: 'YYYY-MM-DD'
		    });
		    maxDate = new DateTime($('#max'), {
		        format: 'YYYY-MM-DD'
		    });
		 
		 	var table = $('#transazioniTable').DataTable();
		    // Refilter the table
		    $('#min, #max').on('change', function () {
		        table.draw();
		    });
		    
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