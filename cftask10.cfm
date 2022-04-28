
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <cfif structKeyExists(form,'Submit')>
            <cfinvoke component="components.taskdefined" 
            method="showAlphabeticalStructure" returnVariable="alertArray"> 
            <cfinvokeargument  name="key"  value="#form.key#">
            <cfinvokeargument  name="value"  value="#form.value#">
            </cfinvoke>
        </cfif>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 10 STRUCTURE-</h3>
                    <form name="cftask_1" method="post" action="">
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