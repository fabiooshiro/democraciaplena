<%@ page import="democraciaplena.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Usuario</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Usuario List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Usuario</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Usuario</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usuarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${usuarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${usuarioInstance?.id}" />
                <input type="hidden" name="version" value="${usuarioInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cpf">Cpf:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'cpf','errors')}">
                                    <g:textField name="cpf" value="${usuarioInstance?.cpf}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tituloEleitor">Titulo Eleitor:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'tituloEleitor','errors')}">
                                    <g:textField name="tituloEleitor" value="${usuarioInstance?.tituloEleitor}" />
                                </td>
                            </tr> 
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="autorizado">Autorizado:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'email','autorizado')}">
                                	<g:checkBox name="autorizado" value="${votoInstance?.autorizado}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'email','errors')}">
                                    <g:textField name="email" value="${usuarioInstance?.email}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome">Nome:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'nome','errors')}">
                                    <g:textField name="nome" value="${usuarioInstance?.nome}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'password','errors')}">
                                    <g:textField name="password" value="${usuarioInstance?.password}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username">Username:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'username','errors')}">
                                    <g:textField name="username" value="${usuarioInstance?.username}" />
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
