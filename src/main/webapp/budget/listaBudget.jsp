<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Budget</title>
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
			<jsp:param name="budgSelected" value="true" />
		</jsp:include>
		<div class="main-content overflow-hidden">
			<c:import url="/templates//navbar.jsp"></c:import>
			<div class="row gx-5 gy-3  justify-content-between">

				<c:forEach var="cat" items="${speseCategoria.keySet()}">
					<div class="col-12 col-lg-4">
						<div class="card p-4" style="height: 300px;">
							<div class="card-body">
								<h5 class="card-title">${cat}</h5>
								<h6 class="card-subtitle mb-2 text-muted">pensare</h6>
								<div class="row">
									<div class="col">
										<label for="casaBudget">Budget</label>

									</div>
									<div class="col">
										<input class="bdg" id="${cat}" type="number" step=".50" <%--
											value="${(budget.stream().filter(b -> b.getNome().equalsIgnoreCase(cat)).count()) > 0 ? (budget.stream().filter(b -> b.getNome().equalsIgnoreCase(cat)).findFirst().get().getBudget()) : 0}">
										--%>

										value="${budgetPerCategoria.get(cat)}">
									</div>
								</div>

								<p>Questo mese hai speso: <fmt:formatNumber type="currency" currencySymbol="€">
										${speseCategoria.get(cat)}</fmt:formatNumber>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>



		</div>
	</div>


	<c:import url="/templates/footer.jsp"></c:import>

	<!-- Inclusione di jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/datetime/1.4.0/js/dataTables.dateTime.min.js"></script>
	<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>


	<script src="https://cdn.datatables.net/v/bs5/dt-1.13.4/cr-1.6.2/fc-4.2.2/sb-1.4.2/datatables.min.js"></script>ù
	<script src="https://cdn.datatables.net/plug-ins/1.13.4/sorting/datetime-moment.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function () {


			function salvaNelDb(input) {
				let categoria = $(input).attr('id');
				var budget = new Map();

				$.ajax({
					url: '/budget/getIdPerCategoria',
					type: 'POST',
					contentType: "application/json",
					data: categoria,
					success: function (response) {
						if (response) {
							budget["id"] = response;
							budget["nome"] = categoria;
							budget["idconto"] = ${ sessionScope.user.id };
							budget["budget"] = $(input).val();
							$.ajax({
								url: '/budget/aggiungi',
								type: 'POST',
								contentType: "application/json",
								data: JSON.stringify(budget),
								success: function (response) {
									if (response) {
										console.log(response)
									}
								}
							});
						}
					}
				});

			};

			$(".bdg").map(function () {
				$(this).on("blur", function () {
					salvaNelDb(this);
				});
			})
		});
	</script>
</body>

</html>