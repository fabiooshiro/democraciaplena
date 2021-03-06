<%@ page import="democraciaplena.Voto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Voto</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Voto List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Voto</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Voto</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${votoInstance}">
            <div class="errors">
                <g:renderErrors bean="${votoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${votoInstance?.id}" />
                <input type="hidden" name="version" value="${votoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="porRepresentante">Por Representante:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:votoInstance,field:'porRepresentante','errors')}">
                                    <g:checkBox name="porRepresentante" value="${votoInstance?.porRepresentante}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="positivo">Positivo:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:votoInstance,field:'positivo','errors')}">
                                    <g:checkBox name="positivo" value="${votoInstance?.positivo}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reclamacao">Reclamacao:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:votoInstance,field:'reclamacao','errors')}">
                                    <g:select name="reclamacao.id" from="${democraciaplena.Reclamacao.list()}" optionKey="id" value="${votoInstance?.reclamacao?.id}"  />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario">Usuario:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:votoInstance,field:'usuario','errors')}">
                                    <g:select name="usuario.id" from="${democraciaplena.Usuario.list()}" optionKey="id" value="${votoInstance?.usuario?.id}"  />
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
