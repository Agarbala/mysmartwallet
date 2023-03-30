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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
	<link href="https://cdn.datatables.net/v/bs5/dt-1.13.4/cr-1.6.2/fc-4.2.2/sb-1.4.2/datatables.min.css"
		rel="stylesheet" />
	<link href="https://cdn.datatables.net/datetime/1.4.0/css/dataTables.dateTime.min.css" rel="stylesheet" />
</head>

<body>
	<div class="mainCont">
		<jsp:include page="/templates/sidebar.jsp">
			<jsp:param name="tranSelected" value="true" />
		</jsp:include>
		
		<div class="main-content">
			<c:import url="/templates/navbar.jsp"></c:import>
			<!-- Import Modali-->
			<c:import url="/templates/modals/nuovaTransazione.jsp">
				<c:param name="pagina" value="lista"></c:param>
			</c:import>

			<c:import url="/templates/modals/modificaTransazione.jsp">
				<c:param name="pagina" value="lista"></c:param>
			</c:import>
			<!-- Fine Import Modali -->

			<div id="importiTabBox" class="shadow-sm rounded">
				<h3>Transazioni <a href="#" data-bs-toggle="modal" data-bs-target="#aggiungiTransazione"><i
							class="bi bi-plus-circle-fill"></i></a></h3>
				<table border="0" cellspacing="5" cellpadding="5">
					<tbody>
						<tr>
							<td>Dal:</td>
							<td><input type="text" id="min" name="min"></td>
							<td>Al:</td>
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

						<c:forEach items="${conto.transazioni}" var="transazione">
							<tr>
								<td>
									${transazione.datatransazione}

								</td>
								<td>${transazione.nome}</td>
								<td>${transazione.categoria}</td>
								<td>${transazione.tipo}</td>
								<td class="${transazione.tipo.equalsIgnoreCase('USCITA') ? 'negativo' : 'positivo'}">
									<fmt:formatNumber type="currency" currencySymbol="€">
										<c:out value="${transazione.importo}" />
									</fmt:formatNumber>
								</td>
								<td>${transazione.metodo}</td>
								<td class="truncate">${transazione.note}</td>
								<td class="td_center">
									<a class="modButton" id="mod" title="Modifica" href="#" data-bs-toggle="modal"
										data-bs-target="#modificaTransazioneModale" data-id="${transazione.id}">
										<i class="fa-solid fa-pencil"></i>
									</a>
								</td>
								<td class="td_center">
									<a class="delButton" id="del" title="Elimina"
									href="/transazioni/elimina?id=${transazione.id}&pagina=lista"
									data-name="${transazione.nome}"> 
									<i class="bi bi-x-circle-fill"></i>
								</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>


		</div>
	</div>


	<c:import url="/templates/footer.jsp"></c:import>

	<!-- Script Datatables, Jquery, Bootstrap -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
	<script src="https://cdn.datatables.net/plug-ins/1.13.4/sorting/datetime-moment.js"></script>
	<script src="https://cdn.datatables.net/datetime/1.4.0/js/dataTables.dateTime.min.js"></script>
	<script src="https://cdn.datatables.net/v/bs5/dt-1.13.4/cr-1.6.2/fc-4.2.2/sb-1.4.2/datatables.min.js"></script>ù
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
		crossorigin="anonymous"></script>


	<script>
		
		var minDate, maxDate;

		$.fn.dataTable.ext.search.push(
			function (settings, data, dataIndex) {
				var min = minDate.val();
				var max = maxDate.val();
				var date = new Date(data[0]);

				if (
					(min === null && max === null) ||
					(min === null && date <= max) ||
					(min <= date && max === null) ||
					(min <= date && date <= max)
				) {
					return true;
				}
				return false;
			}
		);

		$(document).ready(function () {
			
			$(".delButton").click(function () {
				var nome = this.dataset.name;
				if (!confirm("Sicuro di voler cancellare '" + nome + "'?")) {
					event.preventDefault();
				}
			});

			$('#transazioniTable').DataTable({
				language: {
					url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/it-IT.json',
				},
				"lengthChange": true,
				colReorder: false,
				columnDefs: [
					{ orderable: false, targets: [0, 1, 2, 3, 4, 5, 6, 7, 8] },
					{ "searchable": false, "targets": 4 }
				],
				order: [[0, 'desc']]

			});

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

			$(".modButton").click(function () {
				var id = this.dataset.id;
				$.ajax({
					url: '/transazioni/getTransazione',
					type: 'POST',
					data: { id: id },
					success: function (response) {
						if (response) {
							const map = new Map(Object.entries(response));
							$("#idTransazione").val(map.get('id'));
							map.forEach((value, key) => {
								if (key == 'metodo' || key == 'categoria') {
									$("#" + key).val(value.toLowerCase());
								} else if (key == 'tipo') {
									if (value == 'ENTRATA') {
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