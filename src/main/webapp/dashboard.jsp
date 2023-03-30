<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.time.Period"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link rel="stylesheet" type="text/css" href="/css/font.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<link
	href="https://cdn.datatables.net/v/bs5/dt-1.13.4/cr-1.6.2/fc-4.2.2/sb-1.4.2/datatables.min.css"
	rel="stylesheet" />
</head>

<body>
	<div class="mainCont">
		<jsp:include page="/templates/sidebar.jsp">
			<jsp:param name="homeSelected" value="true" />
		</jsp:include>
		<div class="main-content">
			<c:import url="/templates/navbar.jsp"></c:import>
			<!-- Import Modali-->
			<c:import url="/templates/modals/nuovaTransazione.jsp">
				<c:param name="pagina" value="home"></c:param>
			</c:import>

			<c:import url="/templates/modals/modificaTransazione.jsp">
				<c:param name="pagina" value="home"></c:param>
			</c:import>

			<c:import url="/templates/modals/aggiungiObiettivo.jsp">
				<c:param name="pagina" value="home"></c:param>
			</c:import>
			<!-- Fine Import Modali -->

			<div id="bilanciContainer">

				<div id="recapMensile" class="shadow rounded">
					<div id="recapImg">

						<div id="recaph4">
							<h4>${mese}</h4>
						</div>

						<div id="freccia"></div>

					</div>

					<div id="bilanciMens">

						<div class="bilancioCont">
							<h4>Bilancio mensile</h4>
							<h5>
								<fmt:formatNumber type="currency" currencySymbol="€">
											${bilancioMensile}
										</fmt:formatNumber>
							</h5>
						</div>
						<div class="bilancioCont">
							<h4>Uscite</h4>
							<h5>
								<fmt:formatNumber type="currency" currencySymbol="€">
											${uscite}
										</fmt:formatNumber>
							</h5>
						</div>
						<div class="bilancioCont">
							<h4>Entrate</h4>
							<h5>
								<fmt:formatNumber type="currency" currencySymbol="€">${entrate}</fmt:formatNumber>
							</h5>
						</div>
					</div>
				</div>

				<div id="bilanciMens2">

					<div id="bilancioCol1" class="shadow-sm rounded">

						<table id="obiettiviTable"
							class="table table-striped table-hover align-middle w-100">
							<h5>
								Obiettivi <a data-bs-toggle="modal"
									data-bs-target="#aggiungiObiettivo" href=""><i
									class="bi bi-plus-circle-fill"></i></a>
							</h5>

							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">Totale</th>
									<th scope="col">Risparmiato</th>
									<th scope="col">Quota mensile</th>
									<th scope="col">Data fine</th>
									<th scope="col">Completato</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${conto.obiettivi}" var="obiettivo">
									<tr>
										<td class="td_center">
											<h6>${obiettivo.nome}</h6>
										</td>
										<td><fmt:formatNumber type="currency" currencySymbol="€">${obiettivo.importo}</fmt:formatNumber></td>
										<td>${risparmiato.get(obiettivo.id)}</td>
										<td><fmt:formatNumber type="currency" currencySymbol="€">
												<c:out value="${obiettivo.rata}" />
											</fmt:formatNumber></td>
										<td>${obiettivo.datafine}</td>
										<td>${obiettivo.completato ? '1' : '0'}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
					<div id="bilancioCol2" class="shadow-sm rounded">
						<div class="bilTot">
							<h4>BILANCIO TOTALE</h4>
						</div>
						<div class="bilTotValuta">
							<c:set var="bilancio" value="0" />
							<c:forEach items="${conto.transazioni}" var="transazione">
								<c:set var="bilancio"
									value="${transazione.tipo.equalsIgnoreCase('USCITA') ? bilancio - transazione.importo : bilancio + transazione.importo}" />
							</c:forEach>
							<h2 id="bilH2" class="${bilancio < 0 ? 'negativo' : 'positivo'}">
								<fmt:formatNumber type="currency" currencySymbol="€">
									<c:out value="${bilancio}" />
								</fmt:formatNumber>
							</h2>
						</div>
					</div>
				</div>

				<div id="importiTabBox" class="shadow-sm rounded">

					<table id="transazioniTable"
						class="table table-fixed table-striped table-hover align-middle">
						<h5>
							Transazioni recenti <a href="#" data-bs-toggle="modal"
								data-bs-target="#aggiungiTransazione"><i
								class="bi bi-plus-circle-fill"></i></a>
						</h5>
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
									<td>${transazione.datatransazione}</td>
									<td>${transazione.nome}</td>
									<td>${transazione.categoria}</td>
									<td>${transazione.tipo}</td>
									<td
										class="${transazione.tipo.equalsIgnoreCase('USCITA') ? 'negativo' : 'positivo'}">
										<fmt:formatNumber type="currency" currencySymbol="€">
											<c:out value="${transazione.importo}" />
										</fmt:formatNumber>
									</td>
									<td>${transazione.metodo}</td>
									<td class="truncate">${transazione.note}</td>
									<td class="td_center"><a class="modButton" id="mod"
										title="Modifica" href="#" data-bs-toggle="modal"
										data-bs-target="#modificaTransazioneModale"
										data-id="${transazione.id}"> <i class="fa-solid fa-pencil"></i>
									</a></td>
									<td class="td_center"><a class="delButton" id="del"
										title="Elimina"
										href="/transazioni/elimina?id=${transazione.id}&pagina=home"
										data-name="${transazione.nome}"> <i
											class="bi bi-x-circle-fill"></i>

									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<c:import url="/templates/footer.jsp"></c:import>

	<!-- Inclusione di jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/v/bs5/dt-1.13.4/cr-1.6.2/fc-4.2.2/sb-1.4.2/datatables.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
	<script
		src="https://cdn.datatables.net/plug-ins/1.13.4/sorting/datetime-moment.js"></script>


	<script>

		$(document).ready(function () {

			$.fn.dataTable.moment('dddd, MMMM Do, YYYY');

			$('#transazioniTable').DataTable({
				language: {
					url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/it-IT.json',
				},

				colReorder: false,
				"lengthChange": false,
				"pageLength": 5,
				columnDefs: [
					{ orderable: false, targets: [0, 1, 2, 3, 4, 5, 6, 7, 8] }
				],
				order: [[0, 'desc']]

			});

			$('#obiettiviTable').DataTable({
				language: {
					url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/it-IT.json',
				},
				"lengthChange": false,
				"pageLength": 2,
				colReorder: false,
				columnDefs: [
					{ orderable: false, targets: [0, 1, 2, 3, 4] },
					{ target: 5, visible: false }
				],
				order: [[4, 'asc']],
				searching: false,

			}).rows(function (idx, data, node) {
				return data[5] != 0;
			})
				.remove()
				.draw();

			$(".delButton").click(function () {
				var nome = this.dataset.name;
				if (!confirm("Sicuro di voler cancellare '" + nome + "'?")) {
					event.preventDefault();
				}
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