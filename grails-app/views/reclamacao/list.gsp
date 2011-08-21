<%@ page import="democraciaplena.Reclamacao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Reclamacao List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Reclamacao</g:link></span>
        </div>
        <div class="body">
            <h1>Reclamacao List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="texto" title="Texto" />
                        
                   	        <g:sortableColumn property="titulo" title="Titulo" />
                        
                   	        <th>Usuario</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reclamacaoInstanceList}" status="i" var="reclamacaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${reclamacaoInstance.id}">${fieldValue(bean:reclamacaoInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:reclamacaoInstance, field:'texto')}</td>
                        
                            <td>${fieldValue(bean:reclamacaoInstance, field:'titulo')}</td>
                        
                            <td>${fieldValue(bean:reclamacaoInstance, field:'usuario')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reclamacaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
