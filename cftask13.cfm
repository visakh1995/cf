<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 13 STRING</h3>
                    <cfapplication name="structure" sessionTimeout = #CreateTimeSpan(0, 0, 0, 60)#
                    sessionManagement = "Yes">
                        <cfif isDefined("Session.myStringStorage")>
                            <cfloop collection="#Session.myStringStorage#" item="subject">
                            <div class="alert-green">
                                <cfoutput>
                                    <p>#Session.myStringStorage.result#<p/>
                                </cfoutput>
                            </div>
                            </cfloop>
                        </cfif>
                    <form name="cftask_1" method="post" action="components/taskdefined.cfc?method=cfstringFinding">
                        <div class="form-control">
                            <input type="text" placeholder="Enter the string"
                             name="stringValue">
                        </div><br><br>
                        <div class="form-btn">
                            <input type="submit" class="btn" name="Submit">
                        <div>
                    </form>
                </div>
        </section>
    </body>
</html>