
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <cfif structKeyExists(form,'Submit')>
            <cfset aMessages = arrayNew(1)>
                <cfif form.number EQ ''>
                    <cfset arrayAppend(aMessages,'The field cant be empty')> 
                <cfelseif form.number gt 5>
                    <cfset arrayAppend(aMessages,'The number must be bw 1 and 5')>
                <cfelseif form.number lt 1>
                    <cfset arrayAppend(aMessages,'The number must be bw 1 and 5')>
                <cfelseif form.number EQ '5'>
                    <cfset arrayAppend(aMessages,'VERY GOOD')>
                <cfelseif form.number EQ '4'>
                    <cfset arrayAppend(aMessages,'GOOD')>
                <cfelseif form.number EQ '3'>
                    <cfset arrayAppend(aMessages,'FAIR')>
                <cfelse>
                    <cfset arrayAppend(aMessages,'OK')>
            </cfif>
        </cfif>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 1</h3>

                    <cfif isDefined('aMessages') AND NOT ArrayIsEmpty(aMessages)>
                        <div class="alert">
                            <cfoutput>
                                <cfloop array = #aMessages# index="message">
                                    <p>#message#</p>
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