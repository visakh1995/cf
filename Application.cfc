<cfcomponent output="false">
    <cfset this.name = "cfproject"/>
    <cfset this.applicationTimeout = createTimespan(0,2,0,0)/>
    <cfset this.datasource = "cruddb"/>
    <cfset this.sessionManagement = true />
    <cfset this.sessionTimeout = createTimespan(0,0,30,0)/>
</cfcomponent>