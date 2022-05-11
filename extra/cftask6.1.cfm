
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 6 STRUCTURE</h3>
                    <cfapplication name="login" sessionTimeout="#CreateTimeSpan(0, 0, 60, 60)#"
                    sessionManagement="yes">
                        <cfif structKeyExists(Session,"showStruct")>
                        <cfoutput>
                            <cfdump var = "#Session.showStruct#">
                        </cfoutput>
                        </cfif>
                    <form name="cftask_1" method="post" 
                    action="components/taskdefined.cfc?method=structureDisplay">
                        <div class="form-control">
                            <input type="text" placeholder="Enter the key"
                             name="key">
                        </div>
                        <div class="form-control">
                            <input type="text" placeholder="Enter the value"
                             name="value">
                        </div><br><br>
                        <div class="form-btn">
                            <input type="submit" class="btn" name="Submit">
                        <div>
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>

<cfapplication name="login" sessionTimeout="#CreateTimeSpan(0, 0, 0, 60)#"
sessionManagement="yes">
<cfif NOT structKeyExists(Session, "showStruct")>
    <cflock  timeout="20" scope="Session" type="Exclusive">
        <cfset Session.showStruct = structNew()>
    </cflock>
</cfif>
<cfif structKeyExists(Session,"showStruct")>
    <cfset key = StructInsert(Session.showStruct,arguments.key,arguments.value)/>
</cfif>
<cflocation  url="../cftask6.cfm">