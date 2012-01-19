<head>
    <title><g:message code='spring.security.ui.forgotPassword.title'/></title>
    <meta name='layout' content='main'/>
</head>
<body>
	<g:if test='${emailSent}'>
    	<br/>
    	<g:message code='spring.security.ui.forgotPassword.sent'/>
	</g:if>
	<g:else>
	    <g:message code='spring.security.ui.forgotPassword.description'/>
    	<div class="form">
        	<h1><g:message code='spring.security.ui.forgotPassword.title'/></h1>
        	<g:form action='forgotPassword' name="forgotPasswordForm" autocomplete='off'>
                <p>
    				<label for='username'><g:message code="spring.security.ui.forgotPassword.username"/>:</label>
    				<g:textField name="username" value="${command?.username}" />
    			</p>
    			<p class="form-buttons">
				    <input type='submit' id="submit" value='${message(code: "spring.security.ui.forgotPassword.submit")}'/>
    			</p>
    			<p>
    			    <g:link controller="login">Back to login page</g:link>
    			</p>
    	    </g:form>
	    </div>
	</g:else>
    <script>
    $(document).ready(function() {
    	$('#username').focus();
    });
    </script>
</body>
