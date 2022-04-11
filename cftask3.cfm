
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
                    <cfif structKeyExists(form,'Submit')>
                        <cfset number = form.number/>
                        <cfloop list = #number# index="i" delimiters = "," >
                           <cfif i mod 3>
                            <cfcontinue>
                           <cfelse>
                            <cfoutput>
                                #i#,
                            </cfoutput>
                           </cfif>
                        </cfloop>
                    </cfif>
                    <cfform name="cftask_1" action="">
                        <div class="form-control">
                            <cfinput type="text" placeholder="Enter the number"
                             name="number" message="">
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