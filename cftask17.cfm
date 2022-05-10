
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script src="./scripts/script.js"></script>
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 17</h3>
                    <div id="alert"></div>
                    <form name="myForm"  method="post" 
                        action="components/taskdefined.cfc?method=oddEvenFinding">
                        <div class="form-control">
                        <input type="text" id = "enteredValue" 
                            placeholder="Please enter numeric value"
                            name="number" validate="numeric" message="Please enter numeric value"
                            onError="showErrorMessage">
                        </div><br><br>
                        <div class="form-btn">
                            <input type="submit" class="btn" name="Submit" 
                            onclick ="return showErrorMessage()">
                        <div>
                    </form>
          
                    <cfif isDefined("Session.myIntegerStorage")>
                        <cfloop array = #Session.myIntegerStorage# index = "value">
                            <div class="">
                                <cfoutput>
                                    <cfif value MOD 2 EQ 0>
                                        <span class="even">#value#</span>
                                    <cfelse>
                                        <span class="odd">#value#</span>
                                    </cfif><br>
                                </cfoutput>
                            </div>
                        </cfloop>
                    </cfif>
                </div>
            </div>
        </section>
    </body>
</html>