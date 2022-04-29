
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 19</h3>
                    <div class="alert">
                    <cfoutput>#cookie.visitCounter#</cfoutput>
                     </div>
                    <form name="cftask_19" method="post" 
                    action="components/taskdefined.cfc?method=cfCounter">
                        <br><br>
                        <div class="form-btn">
                            <input type="submit" class="btn" name="Submit">
                        <div>
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>