
<cfif detailsID>
    <cfinvoke component="CF_TASK.components.userDefined"
    method="pageCmsDetailsInfo" returnVariable="pageInfo">
    <cfinvokeargument name="detailId" value=#detailsID#>
    </cfinvoke>
</cfif>
<cfif detailsID>
    <cfoutput query = "pageInfo">
    
<html>
    <head>
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">PAGE DETAILS</h3>
                    <br><br><br>
                    <p>Page ID :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#pageId#</p><br>
                    <p>Page Name : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#pageName#</p><br>
                    <p>Page Description : #pageDescription#</p>

                </div>
            </div>
        </section>
    </body>
</html>
</cfoutput>

</cfif>