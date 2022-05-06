
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 7 STRUCTURE</h3>
                    <cfif structKeyExists(form,'Submit')>
                        <cfset newInstance = createObject("component","components.taskdefined")> 
                        <cfset find = newInstance.structurePreviousFetch(form.key,form.value)> 
                        <cfdump var = #find#> 
                    </cfif>
                    <form name="cftask_1" method="post" action="">
                        <div class="form-control">
                            <input type="text" placeholder="Enter the key"
                             name="key">
                        </div>
                        <div class="form-control">
                            <input type="text" placeholder="Enter the value"
                             name="value">
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