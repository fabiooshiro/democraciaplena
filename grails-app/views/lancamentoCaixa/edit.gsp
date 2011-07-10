<%@ page import="democraciaplena.LancamentoCaixa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit LancamentoCaixa</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LancamentoCaixa List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New LancamentoCaixa</g:link></span>
        </div>
        <div class="body">
            <h1>Edit LancamentoCaixa</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${lancamentoCaixaInstance}">
            <div class="errors">
                <g:renderErrors bean="${lancamentoCaixaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${lancamentoCaixaInstance?.id}" />
                <input type="hidden" name="version" value="${lancamentoCaixaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="data">Data:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lancamentoCaixaInstance,field:'data','errors')}">
                                    <g:datePicker name="data" precision="day" value="${lancamentoCaixaInstance?.data}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricao">Descricao:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lancamentoCaixaInstance,field:'descricao','errors')}">
                                    <g:textField name="descricao" value="${lancamentoCaixaInstance?.descricao}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario">Usuario:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lancamentoCaixaInstance,field:'usuario','errors')}">
                                    <g:select name="usuario.id" from="${democraciaplena.Usuario.list()}" optionKey="id" value="${lancamentoCaixaInstance?.usuario?.id}"  />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="valor">Valor:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lancamentoCaixaInstance,field:'valor','errors')}">
                                    <g:textField name="valor" value="${fieldValue(bean: lancamentoCaixaInstance, field: 'valor')}" />
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
