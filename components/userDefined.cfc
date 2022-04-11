<cfcomponent>
    <cffunction name="retrieveTableList">
        <cfquery name="showData" datasource = "cruddb">
            SELECT * FROM coldfusiion.cftasks
        </cfquery>
        <cfreturn showData>
    </cffunction> 
    
    <cffunction name="createImageUpload">
        <cfargument name ="imageName" type="string" required="yes">
        <cfquery name="addImageData" result = result  datasource="cruddb">
            INSERT INTO coldfusiion.cftask_image (name,description,image)
            VALUES(
                <cfqueryparam value="#form.name#">,
                <cfqueryparam value="#form.description#">,
                <cfqueryparam value ="#imageName#">            )
        </cfquery>
            <cflocation url="./cftaskextended.cfm" > 
    </cffunction>
    <cffunction name="listImageInfo">
        <cfquery name="showData" datasource="cruddb">
            SELECT * FROM coldfusiion.cftask_image
        </cfquery>
         <cfreturn showData>
    </cffunction>
</cfcomponent>

