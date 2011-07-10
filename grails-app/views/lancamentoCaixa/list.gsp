<%@ page import="democraciaplena.LancamentoCaixa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>LancamentoCaixa List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New LancamentoCaixa</g:link></span>
        </div>
        <div class="body">
            <h1>LancamentoCaixa List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="data" title="Data" />
                        
                   	        <g:sortableColumn property="descricao" title="Descricao" />
                        
                   	        <th>Usuario</th>
                   	    
                   	        <g:sortableColumn property="valor" title="Valor" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${lancamentoCaixaInstanceList}" status="i" var="lancamentoCaixaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${lancamentoCaixaInstance.id}">${fieldValue(bean:lancamentoCaixaInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:lancamentoCaixaInstance, field:'data')}</td>
                        
                            <td>${fieldValue(bean:lancamentoCaixaInstance, field:'descricao')}</td>
                        
                            <td>${fieldValue(bean:lancamentoCaixaInstance, field:'usuario')}</td>
                        
                            <td>${fieldValue(bean:lancamentoCaixaInstance, field:'valor')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${lancamentoCaixaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
