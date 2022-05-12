<cfcomponent output="false">
    <cfset this.name = "cfproject"/>
    <cfset this.applicationTimeout = createTimespan(0,2,0,0)/>
    <cfset this.datasource = "cruddb"/>
    <cfset this.sessionManagement = true />
    <cfset this.sessionTimeout = createTimespan(0,0,30,0)/>
    
    <cffunction name="onApplicationStart" returnType="Boolean">
        <cfset structureBase = createObject("component", "components.taskdefined")>
        <cfset application.structureCall = structureBase.structureDisplay> 
        <cfreturn true>
    </cffunction>


<!--- onApplicationStart() - when first request made to appln --->
<!--- onApplicationEnd() - when appln shuts down or timeout ends --->

<!--- onSessionStart() - when new user request first page --->
<!--- onSessionEnd - when new users session ends --->

<!--- onRequestStart() - Just before a request is executed --->
<!--- onRequest() - in place of the request --->
<!--- onRequestEnds() - Just after the request is executed --->

<!--- onError()- when an error occurs --->

<!--- lifecycle methods --->

<!--- onApplicationStart() --->
<!--- onSessionStart() --->
<!--- onRequestStart() --->
<!--- onRequest() --->
<!--- onRequestEnd() --->


</cfcomponent>



