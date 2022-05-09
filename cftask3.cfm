
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <cfif structKeyExists(form,'Submit')>
            <cfset newInstance = createObject("component","components.taskdefined")> 
            <cfset res = newInstance.cfContinue(form.number)>
        </cfif>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 3 CFCONTINUE</h3>
                    <form name="cftask_1" method="post" action="">
                        <cfif isDefined("res") AND NOT arrayIsEmpty(res)>
                            <div class="alert">
                                <cfloop array = #res# index="alerter">
                                    <cfoutput>
                                        #alerter#,
                                    </cfoutput>
                                </cfloop>
                            </div>
                        </cfif>
                        <div class="form-control">
                            <input type="text" placeholder="Enter the number"
                             name="number">
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