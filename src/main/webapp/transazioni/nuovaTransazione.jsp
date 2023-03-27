<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <form action="/aggiungiTransazione" method="POST">
            <table>
                <tr>
                    <td>
                        <label for="importo">Importo:</label>
                    </td>
                    <td>
                        <input type="number" id="importo" name="importo" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="data">Data della transazione:</label>
                    </td>
                    <td>
                        <input type="date" id="data" name="data" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="note">Note:</label>
                    </td>
                    <td>
                        <textarea id="note" name="note"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="nome">Nome:</label>
                    </td>
                    <td>
                        <input type="text" id="nome" name="nome">
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
                            <option value="salute_e_benessere">Salute e benessere</option>
                            <option value="tempo_libero">Tempo libero</option>
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
                <tr>
                    <td>
                        <input id="bottoni" type="submit" value="Invia">
                    </td>
                </tr>
            </table>
          </form>