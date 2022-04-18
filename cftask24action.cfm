<cfif isDefined("Submit")>
    <cfinvoke component="components.userDefined" method="insertVerifiedEmailData"
     returnVariable ="insertedValues"
    argumentCollection="#Form#">
    </cfinvoke>
</cfif>