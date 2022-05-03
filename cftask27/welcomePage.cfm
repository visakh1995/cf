<cfapplication name="login" sessionTimeout="#CreateTimeSpan(0, 0, 60, 60)#"
sessionManagement="yes">
<cfif structKeyExists(Session,"adminCredentials")>
    <cfif structKeyExists(Session.adminCredentials,"isAuthenticated")>
            <html>
                <head>
                    <link rel="stylesheet" href="css/style.css" type="text/css">
                    <title>CF TASKS</title>
                </head>
                <style>
                    .logout{
                        padding:5px 15px;
                        border:none;
                        border-radius: 5px;
                        color:#fff;
                        background-color: #047ade;
                        margin-left: 640px; 
                    }
                    .welcome-heading{
                        text-align:center;
                        color:#047ade;
                        font-size :25px;
                        margin-top:160px;
                    }
                </style>
                <body>
                    <section>
                        <div class="main-container">
                            <cfoutput>      
                                    <cfapplication name="login" sessionTimeout="#CreateTimeSpan(0, 0, 60, 60)#"
                                    sessionManagement="yes">
                                    <!---<p>#StructKeyList(Session)#</p>  --->
                                    <h3 class="welcome-heading">welcome
                                    <span>#Session.admincredentials.userName#</span><h3>
                            </cfoutput>
                        </div>
                        <button class="logout" name="logout"><a href="action.cfm?logout">logout</a></button>

                    </section>
                </body>
            </html>
    </cfif>
<cfelse>
<!---     <cflocation  url="login.cfm"> --->
</cfif>