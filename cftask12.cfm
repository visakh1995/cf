
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 12 DATABASE</h3>
                    <cfif isDefined("aMessages")>
                        <div class="alert-green">
                            <cfoutput>
                                <p>#aMessages#</p>
                            </cfoutput>
                        </div>
                    </cfif>
                    <form name="cftask_1" method="post" 
                        action="components/taskdefined.cfc?method=cfdbFetch">
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
                        <table cellpadding = "5" cellspacing="7">
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                            </tr>
                            <cfloop array = "#Session.myStorage#"  index="stored">
                                <cfoutput>
                                    <tr>
                                        <td>#stored.firstName#</td>
                                        <td>#stored.lastName#</td>
                                    </tr>
                                </cfoutput>
                            </cfloop>
                        </table>
 
                    <div>
                </div>
        </section>
    </body>
</html>