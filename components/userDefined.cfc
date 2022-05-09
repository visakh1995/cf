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
                <cfqueryparam value ="#imageName#">          
                  )
        </cfquery>
            <cflocation url="./cftaskextended.cfm" > 
    </cffunction>

    <cffunction name="listImageInfo">
        <cfquery name="showData" datasource="cruddb">
            SELECT * FROM coldfusiion.cftask_image
        </cfquery>
        <cfreturn showData>
    </cffunction>

    <cffunction name ="multipleValueCalc" output="true" access="public" 
        returnType="string">
        <cfargument name ="one" type="string" required="yes">
        <cfset local.multipleValue = 1> 
        <cfloop list = "#one#" index="i">
            <cfset multipleValue = multipleValue * i > 
        </cfloop>
        <cfreturn multipleValue>
    </cffunction>

    <cffunction name ="multipleValueCalcCreateObject" output="true" access="public"
        returnType="string">
        <cfset local.mulVariables = Arguments>
        <cfset local.argCount = ArrayLen(mulVariables)> 
        <cfset local.multipleValue = 1> 
        <cfloop from ="1" to = "#argCount#" index="i" step="1">
            <cfset multipleValue = multipleValue * mulVariables[i] >
        </cfloop>
        <cfreturn multipleValue>
    </cffunction>

    <cffunction name="print" access="public" output="true"  >
        <cfset local.i =1>
        <cfset local.j =3>
        <cfset local.n =3>
        <cfloop from="1" to="3" index="i">              
            <cfset local.k =#i#>
            <cfloop from="1" to="3" index="j">
                <cfoutput>#k# &nbsp;</cfoutput>
                <cfset  k= (#k# + #n# )>
            </cfloop><br>
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
         
        <cffile action="upload"
        fileField="resume"
        nameconflict="overwrite"
        destination="C:\coldFusion2021\cfusion\wwwroot\test\uploads\">
    
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
        <cflocation url="./cftask23success.cfm" > 
    </cffunction>

    <cffunction name="getUserByEmail" access="remote"
    returnFormat = "json" output="false">
        <cfargument name="userEmail" type="string" required="false"> 
        <cfquery name="emailVerify" datasource="cruddb">
            SELECT *FROM coldfusiion.verify_table WHERE email = "#userEmail#";
        </cfquery>
        <cfreturn emailVerify.RecordCount>
    </cffunction>

    <cffunction name="insertVerifiedEmailData">
        <cfquery name="insertValues" datasource="cruddb">

            INSERT INTO coldfusiion.verify_table (fullName,email) VALUES(
                <cfqueryparam value ="#form.name#">,
                <cfqueryparam value="#form.email#">
            )
        </cfquery>
        <cflocation url="./cftask24results.cfm" > 
    </cffunction>

    <cffunction name="verifyCredentials">
        <cfargument name="username" type="string">
        <cfargument name="password" type="string">
            <cfquery name="verifiedDetails" datasource="cruddb">
                SELECT *FROM coldfusiion.login_table WHERE userName = 
                <cfqueryparam  value="#arguments.username#"> AND 
                password = <cfqueryparam  value="#arguments.password#">
            </cfquery>
        <cfif verifiedDetails.RecordCount gt 0>
                <cfapplication name="login" sessionTimeout="#CreateTimeSpan(0, 0, 0, 60)#"
                sessionManagement="yes">
                <cfif NOT structKeyExists(Session, "adminCredentials")>
                    <cflock  timeout="20" scope="Session" type="Exclusive">
                        <cfset Session.adminCredentials = structNew()>
                    </cflock>
                </cfif>
                <cfif structKeyExists(Session,"adminCredentials")>
                    <cfset Session.adminCredentials["userName"] = "#verifiedDetails.userName#">
                    <cfset Session.adminCredentials["password"] = "#verifiedDetails.password#">
                    <cfset Session.adminCredentials["isAuthenticated"] = "True">
                </cfif>
        </cfif>
        <cfreturn verifiedDetails.RecordCount>
    </cffunction>
    <!--- cms start here     --->
    <cffunction name="CMSverifyCredentials">
        <cfargument name="username" type="string">
        <cfargument name="password" type="string">
            <cfquery name="verifiedCMSDetails" datasource="cruddb">
                SELECT *FROM coldfusiion.cms_user WHERE userName = "#username#" AND 
                password = "#password#"
            </cfquery>
        <cfif verifiedCMSDetails.RecordCount gt 0>
            <cflogin>
                <cfloginuser  name="#verifiedCMSDetails.userName#" 
                roles="#verifiedCMSDetails.role#"
                password="#verifiedCMSDetails.password#">
            </cflogin>
                <cfapplication name="login" sessionTimeout="#CreateTimeSpan(0, 0, 0, 60)#"
                sessionManagement="yes">
                <cfif NOT structKeyExists(Session, "Credentials")>
                    <cflock  timeout="20" scope="Session" type="Exclusive">
                        <cfset Session.Credentials = structNew()>
                    </cflock>
                </cfif>
                <cfif structKeyExists(Session,"Credentials")>
                    <cfset Session.Credentials["userName"] = "#verifiedCMSDetails.userName#">
                    <cfset Session.Credentials["password"] = "#verifiedCMSDetails.password#">
                    <cfset Session.Credentials["role"] = "#verifiedCMSDetails.role#">
                    <cfset Session.Credentials["isAuthenticated"] = "True">
                </cfif>
        </cfif>
        <cfreturn verifiedCMSDetails.RecordCount>
    </cffunction>
    <cffunction name="retrievePages">
        <cfquery name="showPagesRetrieves" datasource="cruddb">
            SELECT * FROM coldfusiion.cms_page
        </cfquery>
         <cfreturn showPagesRetrieves>
    </cffunction>
    <cffunction name="deleteCmsPageDetails">
        <cfargument name="deleteId" required="yes">
        <cfquery name="deleteData" datasource="cruddb">
            DELETE FROM coldfusiion.cms_page WHERE pageId = "#deleteId#"
        </cfquery>
        <cflocation  url="./welcomePage.cfm">
    </cffunction>
    <cffunction name="createPageDetails">
        <cfquery name="addData" result = result  datasource="cruddb">
            INSERT INTO coldfusiion.cms_page (pageName,pageDescription)
            VALUES(
            <cfqueryparam value="#form.pageName#">,
            <cfqueryparam value="#form.pageDescription#">
             )
            </cfquery>
        <cflocation url="./welcomePage.cfm" > 
    </cffunction>
    <cffunction name="editCmsDetails">
        <cfargument name ="editId" type="string" required="yes">
        <cfquery name="editData" datasource="cruddb">
            SELECT * FROM coldfusiion.cms_page WHERE pageId = "#editId#"
        </cfquery>
        <cfreturn editData>
        <cfdump var=#editData#>
    </cffunction>
    <cffunction name="updatePageDetails">
        <cfquery name="updateData" datasource="cruddb">
           UPDATE coldfusiion.cms_page SET 
           pageName = <cfqueryparam  value="#arguments.pageName#">,
           pageDescription  = <cfqueryparam  value="#arguments.pageDescription#">
           WHERE pageId = "#arguments.pageId#"
        </cfquery>
        <cflocation url="./welcomePage.cfm" >
    </cffunction>
    <cffunction name="pageCmsDetailsInfo">
        <cfargument name ="detailId" type="string" required="yes">
        <cfquery name="infoData" datasource="cruddb">
            SELECT * FROM coldfusiion.cms_page WHERE pageId = "#detailId#"
        </cfquery>
        <cfreturn infoData>
        <cfdump var=#editData#>
    </cffunction>
    <cffunction name="structTextRetriever">
        <cfargument  name="description" type="string" required="yes">
        <cfset mySentence = structNew()>
        <cfset insertions =StructInsert(mySentence,"sentence","#description#")>
        <cfdump var =#insertions#>
    <cfreturn mySentence>
    </cffunction>
 
</cfcomponent>

