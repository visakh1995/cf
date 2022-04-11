
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 6 STRUCTURE</h3>
                    <cfif structKeyExists(form,'Submit')>
                        <cfset key = form.key/>
                        <cfset value = form.value/>
                        <cfset structDetails = structNew()/>
                        <cfset key = StructInsert(structDetails,key,value)/>
                        <cfdump var =#structDetails#/>
                    </cfif>
                    <cfform name="cftask_1" action="">
                        <div class="form-control">
                            <cfinput type="text" placeholder="Enter the key"
                             name="key" message="Please enter number between 1 and 5">
                        </div>
                        <div class="form-control">
                            <cfinput type="text" placeholder="Enter the value"
                             name="value" message="Please enter number between 1 and 5">
                        </div>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" name="Submit">
                        <div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
</html>