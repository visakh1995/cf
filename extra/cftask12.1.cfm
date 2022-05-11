<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <cfif structKeyExists(form,'Submit')>
        <cfinvoke component="components.taskdefined" 
        method="listOutDataByNumber" returnVariable="arrayShown"> 
        <cfinvokeargument  name="rowNumber" value="#form.rowNumber#">
        </cfinvoke>
    </cfif>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 12 DATABASE</h3>
                    <cfif isDefined("arrayShown") AND NOT arrayIsEmpty(arrayShown)>
                        <cfloop array = #arrayShown# index = "values">
                            <div class="alert">
                                <cfoutput>
                                    <p>#values#<p>
                                </cfoutput>
                            </div>
                        </cfloop>
                    </cfif>
                    <form name="cftask_1" method="post" action="">
                        <div class="form-control">
                            <input type="number" placeholder="Enter the number"
                             name="rowNumber">
                        </div><br><br>
                        <div class="form-btn">
                            <input type="submit" class="btn" name="Submit">
                        <div>
                    </form>
                </div>
                <div class="next">
                    <cfif structKeyExists(form,'Submit') AND form.rowNumber lt 10>
                        <table cellpadding = "5" cellspacing="7">
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                            </tr>
                            <cfoutput query = listOuts>
                            <tr>
                                <td>#firstName#</td>
                                <td>#lastName#</td>
                            </tr>
                            </cfoutput>
                        </table>
                    </cfif>
                    <div>
                </div>
        </section>
    </body>
</html>