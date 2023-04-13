<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- Modale modifica obiettivo -->
<div
        class="modal fade modal-right"
        id="modificaObiettivoModale"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Modifica Obiettivo</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <form id="modificaObiettivo" action="/obiettivi/modifica" method="GET">
                    <input type="hidden" name="pagina" value="${param.pagina}"/>
                    <input type="hidden" name="idconto" value="${conto.id}"/>
                    <input type="hidden" id="idObiettivo" name="id" value=""/>
                    <table class="modalInputs">
                        <tr>
                            <td>
                                <label for="importo">Importo:</label>
                            </td>
                            <td>
                                <input
                                        type="number"
                                        id="importo"
                                        name="importo"
                                        min="0"
                                        step=".01"
                                        required
                                />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="data">Data di Inizio:</label>
                            </td>
                            <td>
                                <input type="date" id="datainizio" name="datainizio" required/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="data">Data di Fine:</label>
                            </td>
                            <td>
                                <input type="date" id="datafine" name="datafine" required/>
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
                                <input type="text" id="nome" name="nome" required/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button
                        type="button"
                        class="btn btn-secondary annulla-btn"
                        data-bs-dismiss="modal"
                >
                    Annulla
                </button>
                <button
                        form="modificaObiettivo"
                        type="submit"
                        class="btn btn-primary conferma-btn"
                >
                    Salva
                </button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function () {
        function controllaDate() {
            let datainizio = new Date($("#datainizio").val());
            let datafine = new Date($("#datafine").val());

            if (datafine < datainizio) {
                event.preventDefault();
                alert("La data di inizio deve essere precedente alla data di fine!");
            }
        }

        $("#modificaObiettivo").on("submit", controllaDate);
    });
</script>
