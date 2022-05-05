
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

                                <form name="cftask_1" action="../components/taskdefined.cfc?method=updatePageDetails" 
                                method = "post">
                                    <div class="form-control">
                                        <input type="text" placeholder="Page name"
                                        name="pageName" value="#pageName#">
                                        <input type="hidden"
                                        name="pageId" value="#pageId#">
                                    </div><br><br>
                                    <div class="form-controls">
                                        <textarea rows="5" cols="39" class="texts" 
                                        name="pageDescription"
                                        placeholder="Page Description">#pageDescription#</textarea>
                                    </div><br><br>
                                    <div class="form-btn">
                                        <input type="submit" class="btn" name="update">
                                    <div>
                                </form>
                            </div>
                        </div>
                    </section>
                </body>
            </html>
        </cfoutput>
    </cfloop>
</cfif>