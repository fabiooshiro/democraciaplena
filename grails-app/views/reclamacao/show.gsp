<%@ page import="democraciaplena.Reclamacao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Reclamacao</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Reclamacao List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Reclamacao</g:link></span>
        </div>
        <div class="body">
            <h1>Show Reclamacao</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            <td valign="top" class="value">${fieldValue(bean:reclamacaoInstance, field:'id')}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Titulo:</td>
                            <td valign="top" class="value">${fieldValue(bean:reclamacaoInstance, field:'titulo')}</td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Texto:</td>
                            <td valign="top" class="value">${reclamacaoInstance?.texto?.encodeAsHTML().replace('\n','<br />')}</td>
                        </tr>                    
                    
                        <tr class="prop">
                            <td valign="top" class="name">Usuario:</td>
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${reclamacaoInstance?.usuario?.id}">${reclamacaoInstance?.usuario?.encodeAsHTML()}</g:link></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${reclamacaoInstance?.id}" />
                    <g:if test="${reclamacaoInstance?.usuario?.id == session.usuario.id}">
                        <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                        <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                    </g:if>
                    <span class="button"><g:actionSubmit class="edit" value="Concordo" /></span>
                    <span class="button"><g:actionSubmit class="edit" value="Discordo" /></span>
                </g:form>
            </div>
            <br />
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <th>
                                Usuario
                            </th>
                            <th>
                                Concorda?
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each var="voto" in="${votoList}">
                            <tr>
                                <td>${(voto.usuario).encodeAsHTML()}</td>
                                <td> ${voto.positivo?'concorda':'discorda'}</td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
