
<cfif ID>
    <cfinvoke component="CF_TASK.components.userDefined"
    method="editCmsDetails" returnVariable="edits">
    <cfinvokeargument name="editId" value=#ID#>
    </cfinvoke>
</cfif>
<cfif ID>
    <cfloop query = "edits">
      <cfoutput>
<html>
    <head>
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">UPDATE PAGE</h3>

                    <cfform name="cftask_1" action="action.cfm" method = "post">
                        <div class="form-control">
                            <cfinput type="text" placeholder="Page name"
                             name="pageName" value="#pageName#">
                             <cfinput type="hidden"
                             name="pageId" value="#pageId#">
                        </div><br><br>
                        <div class="form-controls">
                            <cftextarea rows="5" cols="39" class="texts" 
                            name="pageDescription" value="#pageDescription#" placeholder="Page Description"/>
                        </div><br><br>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" name="update">
                        <div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
</html>
</cfoutput>
</cfloop>
</cfif>