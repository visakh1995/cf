
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <cfif structKeyExists(form,'Submit')>
            <cfset number = form.number/>
            <cfset caseMessages = arrayNew(1)>
            <cfswitch expression = "#number#">
                <cfcase value = "5">
                    <cfset arrayAppend(caseMessages,'VERY GOOD')>
                </cfcase>
                <cfcase value = "4">
                    <cfset arrayAppend(caseMessages,'GOOD')>
                </cfcase>
                <cfcase value ="3">
                    <cfset arrayAppend(caseMessages,'FAIR')>
                </cfcase>
                <cfcase value ="2">
                    <cfset arrayAppend(caseMessages,'OK')>
                </cfcase>
                <cfcase value ="1">
                    <cfset arrayAppend(caseMessages,'OK')>
                </cfcase>
                <cfdefaultcase>
                    <cfset arrayAppend(caseMessages,'The value must be in bw 1 and 5')>
                </cfdefaultcase>
            </cfswitch>
        </cfif>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 2 CFCASE</h3>
                    <cfif isDefined('caseMessages') AND NOT arrayIsEmpty(caseMessages)>
                        <div class="alert">
                            <cfoutput>
                                <cfloop array = #caseMessages# index = "caseMessage">
                                    <p>#caseMessage#</p>
                                </cfloop>
                            </cfoutput>
                        </div>
                    </cfif>
                    <cfform name="cftask_1" action="">
                        <div class="form-control">
                            <cfinput type="number" placeholder="Enter the number"
                             name="number" message="Please enter number between 1 and 5">
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