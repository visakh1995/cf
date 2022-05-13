
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <cfif structKeyExists(form,'Submit')>
            <cfset newInstance = createObject("component","components.taskdefined")> 
            <cfset res = newInstance.cfAgeView(form.mDob,form.uDob)>
        </cfif>
        <section>
            <div class="main-container">
                <div class="card1">
                    <h3 class="heading">CF TASK 5 AGE</h3>
                    <form name="cftask_1" method="post" action="">
                        <cfif isDefined("res")>
                            <div class="alert">
                                <cfloop array = #res# index="alerter">
                                    <cfoutput>
                                        <p>#alerter#</p>
                                    </cfoutput>
                                </cfloop>
                            </div>
                        </cfif>
                        <div class="form-controls">
                            <input type="date" placeholder="Date of birth of mother"
                             name="mDob">
                             <span><p class="date-label">Date of birth of mother</p></span>
                        </div>
                        <div class="form-controls">
                            <input type="date" placeholder="Date of birth of user"
                             name="uDob">
                             <p class="date-label">Date of birth of user</p>
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
