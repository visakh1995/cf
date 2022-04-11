<cfif structKeyExists(form,'Submit')>
    <cfset rowNumber = form.rowNumber/>
    <cfset arrayShown = arrayNew(1)>
    <cfif rowNumber gt 10>
        <cfset arrayAppend(arrayShown,'Please provide value less than 10')/>
    <cfelse>
        <cfinvoke component = "components.userDefined" 
        method = "retrieveTableList" returnVariable = "listOuts">
        <cfinvokeargument  name="numberRow"  value="#rowNumber#"> 
        </cfinvoke>
    <cfset que = QueryGetRow(listOuts,rowNumber)/>
    <cfset arrayAppend(arrayShown,"first Name of #rowNumber# is #que.firstName#")>
    <cfset arrayAppend(arrayShown,"Last Name of #rowNumber# is #que.lastName#")>

     </cfif>

</cfif>

<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <style>
        table{
            border:1px solid grey;
            background-color : yellow;
            position:absolute;
            left:300px;
            top:100px;
        }
        td,th{
            border :1px solid #000;
        }

    </style>
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
                    <cfform name="cftask_1" action="">
                        <div class="form-control">
                            <cfinput type="number" placeholder="Enter the number"
                             name="rowNumber">
                        </div>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" name="Submit">
                        <div>
                    </cfform>
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