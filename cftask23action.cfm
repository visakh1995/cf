<cfif isDefined("Submit")>
    <cfif len(trim(form.resume))> 
        <cffile action="upload"
        fileField="resume"
        destination="C:\coldFusion2021\cfusion\wwwroot\test\uploads\">
        <p>Thankyou, your file has been uploaded.</p>

        <cfinvoke component="components.userdefined" 
        method="createFormDetails" returnVariable="insertedData" 
        argumentCollection="#Form#"> 
        </cfinvoke>
    <cfelse>
        <p>hold</p>
    </cfif>
</cfif>