
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 8 STRUCTURE</h3>
                    <cfif structKeyExists(form,'Submit')>
                        <cfset key = form.key/>
                        <cfset value = form.value/>

                        <cfapplication name="structure" sessionTimeout = #CreateTimeSpan(0, 0, 0, 60)#
                        sessionManagement = "Yes">

                        <cfif NOT StructKeyExists(Session,"mystructs")>
                            <cflock timeout="20" scope="Session" type="Exclusive">
                                <cfset Session.mystructs = structNew()>
                            </cflock>
                        </cfif>

                        <cfif StructKeyExists(Session,"mystructs")>
                            <cfif IsDefined("key") AND isDefined("value")>
                                    <cfset Session.mystructs["#key#"] = "#value#">
                            </cfif>
                        </cfif>

                         <cfdump var = "#Session.mystructs#"> 

                    </cfif>
                    <cfform name="cftask_1" action="">
                        <div class="form-control">
                            <cfinput type="text" placeholder="Enter the key"
                             name="key"s>
                        </div>
                        <div class="form-control">
                            <cfinput type="text" placeholder="Enter the value"
                             name="value">
                        </div><br><br>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" name="Submit">
                        <div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
</html>