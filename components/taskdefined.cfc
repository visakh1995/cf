<cfcomponent>
    <cffunction name="stringValues"  access="remote">
        <cfargument name="number" required="true"> 
        <cfset aMessages = "">

        <cfif arguments.number EQ ''>
            <cfset aMessages ='The field cant be empty'> 
        <cfelseif arguments.number gt 5>
            <cfset aMessages ='The number must between 1 and 5'>
        <cfelseif arguments.number lt 1>
            <cfset aMessages ='The number must between 1 and 5'>
        <cfelseif arguments.number EQ '5'>
            <cfset aMessages ='VERY GOOD'>
        <cfelseif arguments.number EQ '4'>
            <cfset aMessages ='GOOD'>
        <cfelseif arguments.number EQ '3'>
            <cfset aMessages ='FAIR'>
        <cfelse>
            <cfset aMessages ='OK'>
        </cfif>
        <cflocation  url="../cftask1.cfm?aMessages=#aMessages#">

    </cffunction>

    <cffunction name="cfCaseValues"  access="remote">
        <cfargument name="number" required="true"> 
        <cfset caseMessages = "">

        <cfswitch expression = "#arguments.number#">
            <cfcase value = "5">
                <cfset caseMessages ='VERY GOOD'>
            </cfcase>
            <cfcase value = "4">
                <cfset caseMessages ='GOOD'>
            </cfcase>
            <cfcase value ="3">
                <cfset caseMessages ='FAIR'>
            </cfcase>
            <cfcase value ="2">
                <cfset caseMessages ='OK'>
            </cfcase>
            <cfcase value ="1">
                <cfset caseMessages ='OK'>
            </cfcase>
            <cfdefaultcase>
                <cfset caseMessages ='The value must be in bw 1 and 5'>
            </cfdefaultcase>
        </cfswitch>
        <cflocation  url="../cftask2.cfm?aMessages=#caseMessages#">
    </cffunction>

    <cffunction name="cfContinue" access="remote">
        <cfargument name="number" required="true"> 
        <cfset number = arguments.number/>
        <cfset caseMessages = arrayNew(1)>
        <cfloop list = #number# index="i" delimiters = ",">
        <cfif i mod 3>
            <cfcontinue>
        <cfelse>
            <cfset arrayAppend(caseMessages, i)>
        </cfif>
        </cfloop>
        <cfreturn caseMessages>
    </cffunction>

    <cffunction  name="cfAgeView" access="remote">
        <cfargument name="mDob" required="true"> 
        <cfargument name="uDob" required="true"> 
        <cfset dateDetails = arrayNew(1)>

        <cfset userAge = dateDiff("yyyy",arguments.uDob,Now())>
        <cfset arrayAppend(dateDetails,"User Age is #userAge#")>

        <cfset deliveredDate = dateDiff("yyyy",arguments.uDob,arguments.mDob)>
        <cfset arrayAppend(dateDetails,"Mother's age at the time of delvery #deliveredDate#")>

        <cfset BdayDay = DateFormat(arguments.uDob,"mm/dd/2022")>
        <cfset BdayMDay = DateFormat(arguments.mDob,"mm/dd/2022")>

        <cfset birthDayRemUser = dateDiff("d",Now(),BdayDay)>
        <cfset birthDayRemMother = dateDiff("d",Now(),BdayMDay)>
        <cfset arrayAppend(dateDetails,"Days remaining for users birthday is - #birthDayRemUser#")>
        <cfset arrayAppend(dateDetails,"Days remaining for mother birthday is- #birthDayRemMother#")>
        <cfreturn dateDetails>
    </cffunction>

    <cffunction name="structureDisplay" access="remote">
        <cfargument name="key" required="true">
        <cfargument name="value" required="true">

        <cfset structDetails = structNew()/>
        <cfset key = StructInsert(structDetails,key,value)/>
        <cfreturn structDetails>
    </cffunction>

    <cffunction name="structurePreviousFetch" access="remote">

        <cfapplication name="structure" sessionTimeout = #CreateTimeSpan(0, 0, 0, 60)#
        sessionManagement = "Yes">
        <cfif NOT StructKeyExists(Session,"mystruct")>
            <cflock timeout="20" scope="Session" type="Exclusive">
                <cfset Session.mystruct = structNew()>
            </cflock>
        </cfif>
        <cfif StructKeyExists(Session,"mystruct")>
            <cfif IsDefined("key") AND isDefined("value")>
                    <cfset Session.mystruct["#key#"] = value>
            </cfif>
        </cfif>
        <cfreturn Session.mystruct> 

    </cffunction>

    

    
</cfcomponent>