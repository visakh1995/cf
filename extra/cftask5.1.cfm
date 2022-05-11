
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card1">
                    <h3 class="heading">CF TASK 5 AGE</h3>
                    <cfif isDefined("aMessages")>
                        <div class="alert">
                            <cfloop list = "#aMessages#" index="message">
                                <cfoutput>
                                   <p>#message#</p>
                                </cfoutput>
                            </cfloop>
                        </div>
                    </cfif>
                    
                    <form name="cftask_1" method="post" action="components/taskdefined.cfc?method=cfAgeView">
                        <div class="form-controls">
                            <input type="date" placeholder="Date of birth of mother"
                             name="mDob">
                             <span><p class="date-label">Date of birth of mother</p></span>
                        </div>
                        <div class="form-controls">
                            <input type="date" placeholder="Date of birth of user"
                             name="uDob">
                             <p class="date-label">Date of birth of user</p>
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