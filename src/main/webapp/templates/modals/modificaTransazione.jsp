<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  Modal modifica transazione -->
<div class="modal fade modal-right" id="modificaTransazioneModale" data-bs-backdrop="static" data-bs-keyboard="false"
	tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">Modifica transazione</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="modificaTransazione" action="/transazioni/modifica" method="GET">
					<input type="hidden" name="pagina" value="${param.pagina}" />
					<input type="hidden" name="idconto" value="${conto.id}" />
					<input type="hidden" id="idTransazione" name="id" value="" />
					<table class="modalInputs">
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
								<input id="entrataNuovo" type="radio" id="entrata" name="tipo" value="entrata" required>
								<label id="tipo" for="entrata">Entrata</label>
								<input id="uscitaNuovo" type="radio" id="uscita" name="tipo" value="uscita" required>
								<label id="tipo" for="uscita">Uscita</label>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary annulla-btn" data-bs-dismiss="modal">Annulla</button>
				<button form="modificaTransazione" type="submit" class="btn btn-primary conferma-btn">Salva</button>
			</div>


		</div>
	</div>
</div>

<!-- Fine Modal Modifica Transazione -->