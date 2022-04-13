
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <cfif structKeyExists(form,'Submit')>
            <cfif IsDefined("cookie.visitCounter") is FALSE>
                <cfcookie  name="visitCounter" expires="never" value="1">
            </cfif>
            <cfif IsDefined("cookie.visitCounter") is TRUE>
                <cfset visitCounter = "#cookie.visitCounter#">
                <cfcookie  name="visitCounter" expires="never" value="#IncrementValue(visitCounter)#">
            </cfif>
        </cfif>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 19</h3>
                    <div class="alert">
                    <cfoutput>
                        #cookie.visitCounter#
                    </cfoutput>
                     </div>
                    <cfform name="cftask_19" action="">
                        <br><br>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" name="Submit">
                        <div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
</html>