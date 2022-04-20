
<cfif isDefined("logout")>
    <cfapplication name="login" sessionTimeout="#CreateTimeSpan(0, 0, 60, 60)#"
    sessionManagement="yes">
    <cfset StructDelete(Session, "Credentials")>
    <cflocation  url="login.cfm">
</cfif>
<cfif isDefined("url.DELETE")>
    <cfinvoke component = "CF_TASK.components.userDefined"
    method="deleteCmsPageDetails">
    <cfinvokeargument  name="deleteId"  value="#url.DELETE#">
    </cfinvoke>
 </cfif>
 <cfif isDefined("Submit")>
    <cfinvoke component="CF_TASK.components.userDefined" 
     method="createPageDetails" returnVariable="insertedData" 
    argumentCollection="#Form#"> 
    </cfinvoke>
</cfif>
<cfif isDefined("update")>
    <cfinvoke component ="CF_TASK.components.userDefined"
    method="updatePageDetails" argumentCollection="#Form#">
    </cfinvoke>
 </cfif>
 
