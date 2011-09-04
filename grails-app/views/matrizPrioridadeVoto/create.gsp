<%@ page import="democraciaplena.MatrizPrioridadeVoto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create MatrizPrioridadeVoto</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="/">Home</a></span>
            <span class="menuButton"><g:link class="list" controller="problema" action="list">N. E. Problemas</g:link></span>
            <span class="menuButton"><g:link class="list" action="list">MatrizPrioridadeVoto List</g:link></span>
        </div>
        <div class="body">
            <h1>Create MatrizPrioridadeVoto</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${matrizPrioridadeVotoInstance}">
            <div class="errors">
                <g:renderErrors bean="${matrizPrioridadeVotoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="problema">Problema:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:matrizPrioridadeVotoInstance,field:'problema','errors')}">
                                    <g:select name="problema.id" from="${democraciaplena.Problema.list()}" optionKey="id" value="${matrizPrioridadeVotoInstance?.problema?.id}"  />
                                </td>
                            </tr> 
                            <g:render template="form" />
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
