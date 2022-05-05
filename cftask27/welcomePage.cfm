
<cfif structKeyExists(Session,"adminCredentials")>
    <cfif structKeyExists(Session.adminCredentials,"isAuthenticated")>
        <html>
            <head>
                <link rel="stylesheet" href="../css/style.css" type="text/css">
                <title>CF TASKS</title>
            </head>
            <body>
                <section>
                    <div class="main-container">
                        <cfoutput>      
                            <h3 class="welcome-heading">welcome
                            <span>#Session.admincredentials.userName#</span><h3>
                            <button class="logout" name="logout"><a href="action.cfm?logout">logout</a></button>
                        </cfoutput>
                    </div>
                </section>
            </body>
        </html>
    </cfif>
<cfelse>
<cflocation  url="login.cfm"> 
</cfif>