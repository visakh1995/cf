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

    <cffunction name="makeRandomString" returnType="string" output="false">
        <cfset var chars = "23456789ABCDEFGHJKMNPQRS">
        <cfset var length = randRange(4,7)>
        <cfset var result = "">
        <cfset var i = "">
        <cfset var char = "">
        
        <cfscript>
        for(i=1; i <= length; i++) {
            char = mid(chars, randRange(1, len(chars)),1);
            result&=char;
        }
        </cfscript>
        <cfreturn result>
    </cffunction>

    <cffunction name="createFormDetails">
         <cfset imageValue = #cffile.serverFile#> 
        <cfquery name="addData" result = result  datasource="cruddb">
            INSERT INTO coldfusiion.form_info (position,relocate,startDate,website,resumePath,salary,firstName,
            lastName,email,phone)
            VALUES(
                <cfqueryparam value="#form.position#">,
                <cfqueryparam value="#form.checks#">,
                <cfqueryparam value ="#form.startDate#">,
                <cfqueryparam value="#form.websiteName#">,
                <cfqueryparam value="#imageValue#">,
                <cfqueryparam value ="#form.salary#">,
                <cfqueryparam value="#form.firstName#">,
                <cfqueryparam value="#form.lastName#">,
                <cfqueryparam value ="#form.email#">,
                <cfqueryparam value ="#form.phone#">            
                )
        </cfquery>
        <cflocation url="./cftask23.cfm" > 
    </cffunction>
      
    
</cfcomponent>

