<%@ page import="democraciaplena.Problema" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Problema List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="/">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Problema</g:link></span>
            <span class="menuButton"><g:link class="list" controller="matrizPrioridadeVoto" action="list">Votos</g:link></span>
        </div>
        <div class="body">
            <h1>Problema List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                   	        <g:sortableColumn property="id" title="Id" />
                   	        <g:sortableColumn property="titulo" title="Titulo" />
                   	        <th>Simplicidade</th>
                   	        <th>Dependencia</th>
                   	        <th>Tempo</th>
                   	        <th>Beneficio</th>
                   	        <th>Probabilidade</th>
                   	        <th>Total</th>
                   	        <th>Votar</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${problemaInstanceList}" status="i" var="problemaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${problemaInstance.id}">${fieldValue(bean:problemaInstance, field:'id')}</g:link></td>
                            <td>${fieldValue(bean:problemaInstance, field:'titulo')}</td>
                            <td>${votosMap.get('' + problemaInstance.id).simplicidade }</td>
                            <td>${votosMap.get('' + problemaInstance.id).dependencia }</td>
                            <td>${votosMap.get('' + problemaInstance.id).tempo }</td>
                            <td>${votosMap.get('' + problemaInstance.id).beneficio }</td>
                            <td>${votosMap.get('' + problemaInstance.id).probabilidade }</td>
                            <td>${votosMap.get('' + problemaInstance.id).total }</td>
                            <td><g:link action="create" controller="matrizPrioridadeVoto" params="['problema.id': problemaInstance.id]">Votar</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${problemaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
