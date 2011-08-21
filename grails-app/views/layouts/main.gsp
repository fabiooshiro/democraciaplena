<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <link type="text/css" href="/css/redmond/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
        <g:javascript library="jquery" />
        <g:javascript src="jquery-ui-1.8.16.custom.min.js" />
        <g:javascript src="jquery.cookie.js" />
        <g:javascript src="jquery.hotkeys.js" />
        <g:javascript src="jquery.do.js" />
        <g:layoutHead />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo">
        	<a href="/">
        		Democracia Plena
        	</a>
        	<% def userService = com.google.appengine.api.users.UserServiceFactory.getUserService(); %>
			Welcome, ${ userService.getCurrentUser().getNickname()}! (<a href="${userService.createLogoutURL("/") }">log out</A>)
        	
        </div>
        <g:layoutBody />
    </body>
</html>
