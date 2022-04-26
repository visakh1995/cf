
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 3 CFCONTINUE</h3>
                    <cfif isDefined("aMessages")>
                        <div class="alert">
                            <cfoutput>
                                <p>#aMessages#</p>
                            </cfoutput>
                        </div>
                    </cfif>
                    <form name="cftask_1" method="post"
                        action="components/taskdefined.cfc?method=cfContinue">
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