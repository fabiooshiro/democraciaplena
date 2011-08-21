<%@ page import="democraciaplena.Reclamacao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Reclamacao</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Reclamacao List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Reclamacao</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Reclamacao</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reclamacaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${reclamacaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${reclamacaoInstance?.id}" />
                <input type="hidden" name="version" value="${reclamacaoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="titulo">Titulo:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reclamacaoInstance,field:'titulo','errors')}">
                                    <g:textField name="titulo" value="${reclamacaoInstance?.titulo}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="texto">Texto:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reclamacaoInstance,field:'texto','errors')}">
                                    <g:textArea name="texto" value="${reclamacaoInstance?.texto}" />
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
