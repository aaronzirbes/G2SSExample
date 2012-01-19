<head>
    <title><g:message code='spring.security.ui.resetPassword.title'/></title>
    <meta name='layout' content='main'/>
    <style>
        .form p label {
            min-width: 140px;
        }
    </style>
</head>
<body>
    <div class="form">
        <h1><g:message code='spring.security.ui.resetPassword.title'/></h1>
    	<g:form action='resetPassword' name='resetPasswordForm' autocomplete='off'>
    	    <g:hiddenField name='t' value='${token}'/>
	    
            <p>
				<label for='password'><g:message code="resetPasswordCommand.password.label"/>:</label>
				<g:passwordField name="password" value="${command?.password}" />
			</p>
            <p>
				<label for='password2'><g:message code="resetPasswordCommand.password2.label"/>:</label>
				<g:passwordField name="password2" value="${command?.password2}" />
			</p>
			<p class="form-buttons">
			    <input type='submit' id="submit" value='${message(code: "spring.security.ui.resetPassword.submit")}'/>
			</p>
    	    <g:hasErrors bean="${command}">
    	       <div class="errors">
    	           <g:renderErrors bean="${command}" />
    	       </div>
    	    </g:hasErrors>
    	</g:form>
	</div>
    <script>
    $(document).ready(function() {
    	$('#password').focus();
    });
    </script>
</body>
