
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <cfif structKeyExists(form,'Submit')>
            <cfset value = form.number>
            <cfinvoke component="components.taskdefined" 
            method="cfContinue" returnVariable="Data"> 
            <cfinvokeargument  name="number"  value="#value#">
            </cfinvoke>
        </cfif>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 3 CFCONTINUE</h3>
                    <form name="cftask_1" method="post" action="">
                        <cfif isDefined("Data") AND NOT arrayIsEmpty(Data)>
                            <div class="alert">
                                <cfloop array = #Data# index="alerter">
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