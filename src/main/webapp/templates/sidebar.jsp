<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<div class="side">
  <div class="icon-container">
    <a href="/" data-sel="${param.homeSelected}"
      ><i class="fa-sharp fa-solid fa-house-chimney iconColor"></i
    ></a>
    <span class="icon-label">Home</span>
  </div>

  <div class="icon-container">
    <a href="/transazioni/listaTransazioni" data-sel="${param.tranSelected}"
      ><i class="fa-solid fa-right-left"></i
    ></a>
    <span class="icon-label">Transazioni</span>
  </div>

  <div class="icon-container">
    <a href="/obiettivi/listaObiettivi" data-sel="${param.obieSelected}"
      ><i class="fa-solid fa-bullseye"></i
    ></a>
    <span class="icon-label">Obiettivi</span>
  </div>

  <div class="icon-container">
    <a href="/budget/listaBudget" data-sel="${param.budgSelected}"
      ><i class="fa-solid fa-wallet iconColor"></i
    ></a>
    <span class="icon-label">Budget</span>
  </div>

  <a href="/logout"
    ><i class="fa-sharp fa-solid fa-right-from-bracket" title="logout"></i
  ></a>
</div>
