
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <cfif structKeyExists(form,'Submit')>
            <cfset dateDetails = arrayNew(1)>
            <cfset motherDob = form.mDob>
            <cfset userDob   = form.uDob>
            <cfset userAge = dateDiff("yyyy",userdob,Now())>
            <cfset arrayAppend(dateDetails,"User Age is #userAge#")>

            <cfset deliveredDate = dateDiff("yyyy",userdob,motherdob)>
            <cfset arrayAppend(dateDetails,"Mother's age at the time of delvery #deliveredDate#")>

            <cfset BdayDay = DateFormat(userDob,"mm/dd/2022")>
            <cfset BdayMDay = DateFormat(motherDob,"mm/dd/2022")>

            <cfset birthDayRemUser = dateDiff("d",Now(),BdayDay)>
            <cfset birthDayRemMother = dateDiff("d",Now(),BdayMDay)>
            <cfset arrayAppend(dateDetails,"Days remaining for users birthday is - #birthDayRemUser#")>
            <cfset arrayAppend(dateDetails,"Days remaining for mother birthday is- #birthDayRemMother#")>
        </cfif>
        <section>
            <div class="main-container">
                <div class="card1">
                    <h3 class="heading">CF TASK 5 AGE</h3>
                    <cfif isDefined('dateDetails') AND NOT arrayIsEmpty(dateDetails)>
                        <div class="alert">
                            <cfoutput>
                                <cfloop array = #dateDetails# index = "dateDetail">
                                    <p>#dateDetail#</p>
                                </cfloop>
                            </cfoutput>
                        </div>
                    </cfif>
                    <cfform name="cftask_1" action="">
                        <div class="form-controls">
                            <cfinput type="date" placeholder="Date of birth of mother"
                             name="mDob">
                             <span><p>Date of birth of mother</p></span>
                        </div>
                        <div class="form-controls">
                            <cfinput type="date" placeholder="Date of birth of user"
                             name="uDob">
                             <p>Date of birth of user</p>
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