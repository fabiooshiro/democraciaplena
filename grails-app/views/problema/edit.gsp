<%@ page import="democraciaplena.Problema" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Problema</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="/">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Problema List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Problema</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Problema</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${problemaInstance}">
            <div class="errors">
                <g:renderErrors bean="${problemaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${problemaInstance?.id}" />
                <input type="hidden" name="version" value="${problemaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="titulo">Titulo:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:problemaInstance,field:'titulo','errors')}">
                                    <g:textField name="titulo" value="${problemaInstance?.titulo}" />
                                </td>
                            </tr> 
                       		<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="texto">Texto:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:problemaInstance,field:'texto','errors')}">
                                    <g:textField name="texto" value="${problemaInstance?.texto}" />
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario">Usuario:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:problemaInstance,field:'usuario','errors')}">
                                    <g:select name="usuario.id" from="${democraciaplena.Usuario.list()}" optionKey="id" value="${problemaInstance?.usuario?.id}"  />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
