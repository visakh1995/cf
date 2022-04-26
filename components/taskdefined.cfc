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
        <cfset caseMessages = "">
        <cfloop list = #number# index="i" delimiters = "," >
        <cfif i mod 3>
            <cfcontinue>
        <cfelse>
            <cfoutput>
            #i#,
            </cfoutput>
        </cfif>
        </cfloop>
        <cflocation  url="../cftask3.cfm?aMessages=#i#">
    </cffunction>

    <cffunction  name="dayValueCalc" access="remote">
        <cfsavecontent variable="details">
            <cfoutput>
                Today's Date : #DateFormat(Now())#
                Current Month In Numeric :#DateFormat(Now(),"mm")#
                Current Month In Word :#DateFormat(Now(),"mmmm")#
            </cfoutput>
        </cfsavecontent>
        <cfreturn details>
    </cffunction>

    <cffunction  name="cfAgeView" access="remote">
        <cfargument name="mDob" required="true"> 
        <cfargument name="uDob" required="true"> 
        <cfdump var="#arguments.mDob#">

    </cffunction>

    

    
</cfcomponent>