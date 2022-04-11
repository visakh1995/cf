<cfif structKeyExists(form,'Submit')>
    <cfset stringInput = form.stringValue/>
    <cfset arrayAlert = arrayNew(1)/>
    <cfset orginal = "the quick brown fox jumps over the lazy dog">
    <cfset totsCount = listValueCountNoCase("the quick brown fox jumps over the lazy dog", stringInput," ") />
    <cfset arrayAppend(arrayAlert,"Result as found,the key value '#stringInput#' 
    in #totsCount# times - the quick brown fox jumps over the lazy dog.") />
<!---     <cfdump var = #totsCount#> --->

</cfif>

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
                    <cfif isDefined("arrayAlert") AND NOT arrayIsEmpty(arrayAlert)>
                        <cfloop array = #arrayAlert# index = "value">
                            <div class="alert">
                                <cfoutput>
                                    <p>#value#<p>
                                </cfoutput>
                            </div>
                        </cfloop>
                    </cfif>
                    <cfform name="cftask_1" action="">
                        <div class="form-control">
                            <cfinput type="text" placeholder="Enter the string"
                             name="stringValue">
                        </div>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" name="Submit">
                        <div>
                    </cfform>
                </div>
        </section>
    </body>
</html>