<%@ page import="democraciaplena.Problema" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Problema</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="/">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Problema List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Problema</g:link></span>
        </div>
        <div class="body">
            <h1>Show Problema</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            <td valign="top" class="value">${fieldValue(bean:problemaInstance, field:'id')}</td>
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name">Titulo:</td>
                            <td valign="top" class="value">${fieldValue(bean:problemaInstance, field:'titulo')}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Texto:</td>
                            <td valign="top" class="value">${fieldValue(bean:problemaInstance, field:'texto')}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Usuario:</td>
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${problemaInstance?.usuario?.id}">${problemaInstance?.usuario?.encodeAsHTML()}</g:link></td>
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${problemaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
