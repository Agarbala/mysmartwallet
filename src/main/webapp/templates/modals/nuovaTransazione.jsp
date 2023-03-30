<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Modal Aggiungi Transazione-->
<div class="modal fade modal-right" id="aggiungiTransazione"
	data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">Aggiungi
					Transazione</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="nuovaTransazione" action="/transazioni/aggiungi"
					method="GET">
					<input type="hidden" name="pagina" value="${param.pagina}" /> <input
						type="hidden" name="idconto" value="${conto.id}" />
					<table class="modalInputs">
						<tr>
							<td><label for="importo">Importo:</label></td>
							<td><input type="number" id="importoNuovo" name="importo"
								min="0" step=".01" required></td>
						</tr>
						<tr>
							<td><label for="data">Data della transazione:</label></td>
							<td><input type="date" id="datatransazioneNuovo"
								name="datatransazione" required></td>
						</tr>
						<tr>
							<td><label for="note">Note:</label></td>
							<td><textarea id="noteNuovo" name="note" maxlength="200"></textarea>
							</td>
						</tr>
						<tr>
							<td><label for="nome">Nome:</label></td>
							<td><input type="text" id="nomeNuovo" name="nome" required>
							</td>
						</tr>
						<tr>
							<td><label for="metodo">Metodo di pagamento:</label></td>
							<td><select id="metodoNuovo" name="metodo">
									<option value="contanti">Contanti</option>
									<option value="carta">Carta</option>
									<option value="altro">Altro</option>
							</select></td>
						</tr>
						<tr>
							<td><label for="categoria">Categoria:</label></td>
							<td><select id="categoriaNuovo" name="categoria">
									<option value="casa">Casa</option>
									<option value="trasporti">Trasporti</option>
									<option value="famiglia">Famiglia</option>
									<option value="salute e benessere">Salute e benessere</option>
									<option value="tempo libero">Tempo libero</option>
									<option value="altro">Altro</option>
							</select></td>
						</tr>
						<tr>
							<td><label for="tipo">Tipo di transazione:</label></td>
							<td>
							<input type="radio" id="entrataNuovo" name="tipo"
								value="entrata" required> 
								<label id="tipo" for="entrata">Entrata</label>
								<input type="radio" id="uscitaNuovo" name="tipo" value="uscita"
								required> 
								<label id="tipo" for="uscita">Uscita</label></td>
						</tr>
						<tr id="obiettivoSel">
							<td><label for="obiettivo">Obiettivo:</label></td>
							<td><select id="obiettivo" name="obiettivoid">
									<option value="0">Nessuno</option>
									<c:forEach var="obi" items="${conto.obiettivi}">
										<option value="${obi.id}">${obi.nome}</option>
									</c:forEach>
							</select></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Annulla</button>
				<button form="nuovaTransazione" type="submit"
					class="btn btn-primary">Salva</button>

			</div>

		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#obiettivoSel").hide();
	$("#uscitaNuovo").on('change', function() {
		$("#obiettivoSel").show();
	});
	$("#entrataNuovo").on('change', function() {
		$("#obiettivo").val(0);
		$("#categoriaNuovo").prop( "disabled", false);
		$("#obiettivoSel").hide();
	});
	
	$("#obiettivo").on('change', function() {
		if($("#obiettivo").val() != 0) {
			$("#categoriaNuovo").val('altro');
			$("#categoriaNuovo").prop( "disabled", true );
		} else {
			$("#categoriaNuovo").prop( "disabled", false);
		}
	});
	
	
});
</script>
<!-- Fine Modal Aggiungi Transazione -->