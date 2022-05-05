<cfif isDefined("url.DELETE")>
    <cfinvoke component = "CF_TASK.components.taskdefined"
    method="deleteCmsPageDetails">
    <cfinvokeargument  name="deleteId"  value="#url.DELETE#">
    </cfinvoke>
 </cfif>


 
