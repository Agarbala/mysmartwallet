<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix = "c" uri =
"http://java.sun.com/jsp/jstl/core" %> <%@ page import="java.time.Period" %> <%@
taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <%@ page
import="java.time.YearMonth" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="/css/font.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
    />
    <link
      href="https://cdn.datatables.net/v/bs5/dt-1.13.4/cr-1.6.2/fc-4.2.2/sb-1.4.2/datatables.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.datatables.net/datetime/1.4.0/css/dataTables.dateTime.min.css"
      rel="stylesheet"
    />
  </head>

  <body>
    <div class="mainCont">
      <jsp:include page="/templates/sidebar.jsp">
        <jsp:param name="obieSelected" value="true" />
      </jsp:include>
      <div class="main-content">
        <!-- Import Modali-->
        <c:import url="/templates/modals/aggiungiObiettivo.jsp">
          <c:param name="pagina" value="lista"></c:param>
        </c:import>
        <c:import url="/templates/modals/modificaObiettivo.jsp">
          <c:param name="pagina" value="lista"></c:param>
        </c:import>
        <!-- Fine Import Modali-->

        <c:import url="/templates/navbar.jsp"></c:import>

        <div id="importiTabBox" class="shadow-sm rounded">
          <h3>
            Obiettivi
            <a
              href="#"
              data-bs-toggle="modal"
              data-bs-target="#aggiungiObiettivo"
              ><i class="bi bi-plus-circle-fill"></i
            ></a>
          </h3>
          <table
            id="obiettiviTable"
            class="table table-fixed table-striped table-hover align-middle"
          >
            <thead>
              <tr>
                <th scope="col">Nome</th>
                <th scope="col">Risparmiato</th>
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
              <c:forEach items="${conto.obiettivi}" var="obiettivo">
                <tr>
                  <td>${obiettivo.nome}</td>
                  <td>
                    <fmt:formatNumber type="currency" currencySymbol="€">
                      <c:out value="${risparmiato.get(obiettivo.id)}" />
                    </fmt:formatNumber>
                  </td>
                  <td>
                    <fmt:formatNumber type="currency" currencySymbol="€">
                      <c:out value="${obiettivo.importo}" />
                    </fmt:formatNumber>
                  </td>
                  <td>
                    <fmt:formatNumber type="currency" currencySymbol="€">
                      <c:out value="${obiettivo.rata}" />
                    </fmt:formatNumber>
                  </td>
                  <td>${obiettivo.datainizio}</td>
                  <td>${obiettivo.datafine}</td>
                  <td id="tdcompleted" style="color: transparent">
                    ${obiettivo.completato ? '1' : '0'}
                    <i
                      class="${obiettivo.completato ? 'bi bi-check-circle-fill fs-3' : 'bi bi-play-fill' }"
                      style="
                        color: color(srgb 0.1232 0.725 0.1357) !important;
                        font-size: xx-large;
                        margin-left: 18px;
                      "
                    ></i>
                  </td>
                  <td class="truncate">${obiettivo.note}</td>
                  <td class="td_center">
                    <a
                      class="modButton"
                      id="mod"
                      title="Modifica"
                      href="#"
                      data-bs-toggle="modal"
                      data-bs-target="#modificaObiettivoModale"
                      data-id="${obiettivo.id}"
                    >
                      <i class="fa-solid fa-pencil"></i>
                    </a>
                  </td>
                  <td class="td_center">
                    <a
                      id="del"
                      title="Elimina"
                      href="/obiettivi/elimina?id=${obiettivo.id}&pagina=lista"
                    >
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

    <!-- Inclusione di jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/datetime/1.4.0/js/dataTables.dateTime.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>

    <script src="https://cdn.datatables.net/v/bs5/dt-1.13.4/cr-1.6.2/fc-4.2.2/sb-1.4.2/datatables.min.js"></script>
    <script src="https://cdn.datatables.net/plug-ins/1.13.4/sorting/datetime-moment.js"></script>

    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
      integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
      integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
      crossorigin="anonymous"
    ></script>

    <script>
      $(document).ready(function () {
        const importoInput = $("#importoNuovo");
        const dataInizioInput = $("#datainizioNuovo");
        const dataFineInput = $("#datafineNuovo");
        const rataMensileParagraph = $("#rata-mensile");

        $("#obiettiviTable").DataTable({
          language: {
            url: "https://cdn.datatables.net/plug-ins/1.13.4/i18n/it-IT.json",
          },
          lengthChange: true,
          colReorder: false,
          columnDefs: [
            { orderable: false, targets: [0, 1, 2, 3, 4, 5, 6, 7, 8] },
            { searchable: false, targets: [1, 2, 3, 4] },
          ],
          order: [
            [6, "asc"],
            [5, "asc"],
          ],
        });

        $(".modButton").click(function () {
          var id = this.dataset.id;
          $.ajax({
            url: "/obiettivi/getObiettivo",
            type: "POST",
            data: { id: id },
            success: function (response) {
              if (response) {
                const map = new Map(Object.entries(response));
                $("#idObiettivo").val(map.get("id"));
                map.forEach((value, key) => {
                  $("#" + key).val(value);
                });
              }
            },
          });
        });

        function calcolaRataMensile() {
          const importo = Number(importoInput.val());
          const dataInizio = new Date(dataInizioInput.val());
          const dataFine = new Date(dataFineInput.val());
          console.log(dataInizio);
          // Verifica che tutti i valori siano stati inseriti
          if (
            importo &&
            dataInizio.toString() != "Invalid Date" &&
            dataFine.toString() != "Invalid Date"
          ) {
            // Calcola il numero di mesi tra la data di inizio e la data di fine
            const numMesi =
              (dataFine.getFullYear() - dataInizio.getFullYear()) * 12 +
              (dataFine.getMonth() - dataInizio.getMonth());

            // Calcola la rata mensile e visualizzala nel paragrafo
            const rataMensile = importo / numMesi;
            rataMensileParagraph.html(
              "La rata mensile è: " + rataMensile.toFixed(2) + " euro."
            );
          } else {
            // Se manca almeno un valore, mostra un messaggio vuoto nel paragrafo
            rataMensileParagraph.html("");
          }
        }

        // Aggiungi l'evento input a tutti gli input dell'utente
        importoInput.on("input", calcolaRataMensile);
        dataInizioInput.on("input", calcolaRataMensile);
        dataFineInput.on("input", calcolaRataMensile);
      });
    </script>
  </body>
</html>
