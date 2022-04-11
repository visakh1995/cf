
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 9 STRUCTURE-</h3>
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
                            <cfset alertArray = arrayNew(1)/>
                            <cfif IsDefined("key") AND isDefined("value")>
                                <cfif structKeyExists("#Session.mystructs#", #key#)>
                                    <cfset arrayAppend(alertArray,"#key# already present,not add again")>
                                <cfelse>
                                     <cfset Session.mystructs["#key#"] = "#value#">
                                </cfif>
                           </cfif>
                        </cfif>
                         <!--- <cfdump var = "#Session.mystructs#">  --->
                    </cfif>
                    <cfform name="cftask_1" action="">
                        <cfif isDefined("alertArray") AND NOT arrayIsEmpty(alertArray)>
                            <div class="alert">
                                <cfloop array = #alertArray# index="alerter">
                                    <cfoutput>
                                        <p>#alerter#</p>
                                    </cfoutput>
                                </cfloop>
                            </div>
                        </cfif>
                        <div class="form-control">
                            <cfinput type="text" placeholder="Enter the key"
                             name="key" message="Please enter number between 1 and 5">
                        </div>
                        <div class="form-control">
                            <cfinput type="text" placeholder="Enter the value"
                             name="value" message="Please enter number between 1 and 5">
                        </div>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" name="Submit">
                        <div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
</html>