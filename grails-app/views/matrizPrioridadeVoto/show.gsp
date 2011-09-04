<%@ page import="democraciaplena.MatrizPrioridadeVoto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show MatrizPrioridadeVoto</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="/">Home</a></span>
            <span class="menuButton"><g:link class="list" controller="problema" action="list">N. E. Problemas</g:link></span>
            <span class="menuButton"><g:link class="list" action="list">MatrizPrioridadeVoto List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New MatrizPrioridadeVoto</g:link></span>
        </div>
        <div class="body">
            <h1>Show MatrizPrioridadeVoto</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:matrizPrioridadeVotoInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Beneficio:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:matrizPrioridadeVotoInstance, field:'beneficio')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Dependencia:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:matrizPrioridadeVotoInstance, field:'dependencia')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Probabilidade:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:matrizPrioridadeVotoInstance, field:'probabilidade')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Problema:</td>
                            
                            <td valign="top" class="value"><g:link controller="problema" action="show" id="${matrizPrioridadeVotoInstance?.problema?.id}">${matrizPrioridadeVotoInstance?.problema?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Simplicidade:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:matrizPrioridadeVotoInstance, field:'simplicidade')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Tempo:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:matrizPrioridadeVotoInstance, field:'tempo')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Usuario:</td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${matrizPrioridadeVotoInstance?.usuario?.id}">${matrizPrioridadeVotoInstance?.usuario?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${matrizPrioridadeVotoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
