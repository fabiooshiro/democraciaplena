<%@ page import="democraciaplena.LancamentoCaixa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show LancamentoCaixa</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LancamentoCaixa List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New LancamentoCaixa</g:link></span>
        </div>
        <div class="body">
            <h1>Show LancamentoCaixa</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:lancamentoCaixaInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Data:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:lancamentoCaixaInstance, field:'data')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Descricao:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:lancamentoCaixaInstance, field:'descricao')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Usuario:</td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${lancamentoCaixaInstance?.usuario?.id}">${lancamentoCaixaInstance?.usuario?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Valor:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:lancamentoCaixaInstance, field:'valor')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${lancamentoCaixaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
