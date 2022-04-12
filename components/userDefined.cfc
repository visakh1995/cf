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

    <cffunction name ="multipleValueCalc">
        <cfargument name ="one" type="string" required="yes">
         <cfset multipleValue = 1> 
         <cfloop list = "#one#" index="i">
            <cfset multipleValue = multipleValue * i > 
          </cfloop>
        <cfreturn multipleValue>
    </cffunction>

    <cffunction name ="multipleValueCalcCreateObject">
        <cfset argCount = ArrayLen(Arguments)> 
<!---         <cfdump  var = #argCount#>  --->
        <cfset multipleValue = 1> 
        <cfloop from ="1" to = "#argCount#" index="i" step="1">
            <cfset multipleValue = multipleValue * Arguments[i] >
          </cfloop>
        <cfreturn multipleValue>
    </cffunction>
    <cffunction name="print" access="public" >
        <cfset var i =1>
        <cfset var j =3>
        <cfset var n =3>
        <cfloop from="1" to="3" index="i">              
                      <cfset var k =#i#>
                            <cfloop from="1" to="3" index="j">
                                          <cfoutput>#k# &nbsp;</cfoutput>
                                        <cfset  k= (#k# + #n# )>
                            </cfloop>                   
                      <cfoutput> <br>
                      </cfoutput>
        </cfloop>
      </cffunction>
      

    
</cfcomponent>

