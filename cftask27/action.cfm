<cfif isDefined("logout")>
    <cfapplication name="login" sessionTimeout="#CreateTimeSpan(0, 0, 60, 60)#"
    sessionManagement="yes">
    <cfset StructDelete(Session, "adminCredentials")>
    <cflocation  url="login.cfm">
</cfif>