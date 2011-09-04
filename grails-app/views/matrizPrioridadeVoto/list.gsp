<%@ page import="democraciaplena.MatrizPrioridadeVoto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>MatrizPrioridadeVoto List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="/">Home</a></span>
            <span class="menuButton"><g:link class="list" controller="problema" action="list">N. E. Problemas</g:link></span>
        </div>
        <div class="body">
            <h1>MatrizPrioridadeVoto List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                   	        <g:sortableColumn property="id" title="Id" />
                   	        <th>Problema</th>
                        	<th>Usuario</th>
                   	        <g:sortableColumn property="beneficio" title="Beneficio" />
                   	        <g:sortableColumn property="dependencia" title="Dependencia" />
                   	        <g:sortableColumn property="probabilidade" title="Probabilidade" />
                   	        <g:sortableColumn property="simplicidade" title="Simplicidade" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${matrizPrioridadeVotoInstanceList}" status="i" var="matrizPrioridadeVotoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${matrizPrioridadeVotoInstance.id}">${fieldValue(bean:matrizPrioridadeVotoInstance, field:'id')}</g:link></td>
                            <td>${fieldValue(bean:matrizPrioridadeVotoInstance, field:'problema')}</td>
                       		<td>${fieldValue(bean:matrizPrioridadeVotoInstance, field:'usuario')}</td>
                            <td>${fieldValue(bean:matrizPrioridadeVotoInstance, field:'beneficio')}</td>
                            <td>${fieldValue(bean:matrizPrioridadeVotoInstance, field:'dependencia')}</td>
                            <td>${fieldValue(bean:matrizPrioridadeVotoInstance, field:'probabilidade')}</td>
                            <td>${fieldValue(bean:matrizPrioridadeVotoInstance, field:'simplicidade')}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${matrizPrioridadeVotoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
