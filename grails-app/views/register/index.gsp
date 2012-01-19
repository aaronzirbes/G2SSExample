<head>
	<meta name='layout' content='main'/>
	<title><g:message code='spring.security.ui.register.title'/></title>
	<style>
	    .errors {
	        margin: 0;
	    }
	    .form p label {
	        min-width: 140px;
	    }
	</style>
</head>
<body>
	<g:if test='${emailSent}'>
    	<br/>
    	<g:message code='spring.security.ui.register.sent'/>
	</g:if>
	<g:else>
	    <div class="form">
	    <h1><g:message code='spring.security.ui.register.title'/></h1>
	    
        <g:form action='register' name='registerForm'>
            <p>
				<label for='username'><g:message code="user.username.label"/>:</label>
				<g:textField name="username" value="${command.username}" />
			</p>
            <p>
				<label for='email'><g:message code="user.email.label"/>:</label>
				<g:textField name="email" value="${command.email}" />
			</p>
            <p>
				<label for='password'><g:message code="user.password.label"/>:</label>
				<g:passwordField name="password" value="${command.password}" />
			</p>
            <p>
				<label for='password2'><g:message code="user.password2.label"/>:</label>
				<g:passwordField name="password2" value="${command.password2}" />
			</p>
			<p class="form-buttons">
				<input type='submit' id="submit" value='${message(code: "spring.security.ui.register.submit")}'/>
			</p>
    	    <g:hasErrors bean="${command}">
    	       <div class="errors">
    	           <g:renderErrors bean="${command}" />
    	       </div>
    	    </g:hasErrors>
    	    <p>
    	        <g:link controller="login">Login as existing user</g:link>
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
