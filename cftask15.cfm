<cfcomponent output="false">
    <cfset this.name = "crudWebsite"/>
    <cfset this.applicationTimeout = createTimespan(0,2,0,0)/>
    <cfset this.datasource = "cruddb"/>
    <cfset this.sessionManagement = true />
    <cfset this.sessionTimeout = createTimespan(0,0,30,0)/>

    <!---onApplicationStart() Method --->

    <cffunction name="onApplicationStart" returnType="Boolean">
        <cfset application.starter = createObject("component",'test.components.userDefined')/>
        <cfreturn true />
    </cffunction>

    <!---onRequestStart() method --->
    <cffunction name="onApplicationRequest" returnType="boolean">
        <cfargument name="targetPage" type="string" required="true">
        <!---handle some URL parameters--->
           <cfif isDefined('url.restartApp')>
              <cfset this.onApplicationStart()/>
           </cfif>
    <cfreturn true>
    </cffunction>
</cfcomponent>