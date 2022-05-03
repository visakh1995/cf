<cfcomponent>

    <cffunction name="stringValues"  access="remote">
        <cfargument name="number" required="true"> 
        <cfset aMessages = "">
        <cfif arguments.number EQ ''>
            <cfset aMessages ='The field cant be empty'> 
        <cfelseif arguments.number gt 5>
            <cfset aMessages ='The number must between 1 and 5'>
        <cfelseif arguments.number lt 1>
            <cfset aMessages ='The number must between 1 and 5'>
        <cfelseif arguments.number EQ '5'>
            <cfset aMessages ='VERY GOOD'>
        <cfelseif arguments.number EQ '4'>
            <cfset aMessages ='GOOD'>
        <cfelseif arguments.number EQ '3'>
            <cfset aMessages ='FAIR'>
        <cfelse>
            <cfset aMessages ='OK'>
        </cfif>
        <cflocation  url="../cftask1.cfm?aMessages=#aMessages#">
    </cffunction>

    <cffunction name="cfCaseValues"  access="remote">
        <cfargument name="number" required="true"> 
        <cfset caseMessages = "">
        <cfswitch expression = "#arguments.number#">
            <cfcase value = "5">
                <cfset caseMessages ='VERY GOOD'>
            </cfcase>
            <cfcase value = "4">
                <cfset caseMessages ='GOOD'>
            </cfcase>
            <cfcase value ="3">
                <cfset caseMessages ='FAIR'>
            </cfcase>
            <cfcase value ="2">
                <cfset caseMessages ='OK'>
            </cfcase>
            <cfcase value ="1">
                <cfset caseMessages ='OK'>
            </cfcase>
            <cfdefaultcase>
                <cfset caseMessages ='The value must be in bw 1 and 5'>
            </cfdefaultcase>
        </cfswitch>
        <cflocation  url="../cftask2.cfm?aMessages=#caseMessages#">
    </cffunction>

    <cffunction name="cfContinue" access="remote">
        <cfargument name="number" required="true"> 
        <cfset number = arguments.number/>
        <cfset caseMessages = arrayNew(1)>
        <cfloop list = #number# index="i" delimiters = ",">
        <cfif i mod 3>
            <cfcontinue>
        <cfelse>
            <cfset arrayAppend(caseMessages, i)>
        </cfif>
        </cfloop>
        <cfreturn caseMessages>
    </cffunction>

    <cffunction  name="cfAgeView" access="remote">
        <cfargument name="mDob" required="true"> 
        <cfargument name="uDob" required="true"> 
        <cfset dateDetails = arrayNew(1)>

        <cfset userAge = dateDiff("yyyy",arguments.uDob,Now())>
        <cfset arrayAppend(dateDetails,"User Age is #userAge#")>

        <cfset deliveredDate = dateDiff("yyyy",arguments.uDob,arguments.mDob)>
        <cfset arrayAppend(dateDetails,"Mother's age at the time of delvery #deliveredDate#")>

        <cfset BdayDay = DateFormat(arguments.uDob,"mm/dd/2022")>
        <cfset BdayMDay = DateFormat(arguments.mDob,"mm/dd/2022")>

        <cfset birthDayRemUser = dateDiff("d",Now(),BdayDay)>
        <cfset birthDayRemMother = dateDiff("d",Now(),BdayMDay)>
        <cfset arrayAppend(dateDetails,"Days remaining for users birthday is - #birthDayRemUser#")>
        <cfset arrayAppend(dateDetails,"Days remaining for mother birthday is- #birthDayRemMother#")>
        <cfreturn dateDetails>
    </cffunction>

    <cffunction name="structureDisplay" access="remote">
        <cfargument name="key" required="true">
        <cfargument name="value" required="true">
        <cfset structDetails = structNew()/>
        <cfset keys = StructInsert(structDetails,arguments.key,arguments.value)/>
        <cfreturn structDetails> 
    </cffunction>

    <cffunction name="structurePreviousFetch" access="remote">
        <cfargument name="key" required="true">
        <cfargument name="value" required="true">
        <cfapplication name="structure" sessionTimeout = #CreateTimeSpan(0, 0, 0, 60)#
        sessionManagement = "Yes">
        <cfif NOT StructKeyExists(Session,"mystruct")>
            <cflock timeout="20" scope="Session" type="Exclusive">
                <cfset Session.mystruct = structNew()>
            </cflock>
        </cfif>
        <cfif StructKeyExists(Session,"mystruct")>
            <cfif IsDefined("arguments.key") AND isDefined("arguments.value")>
                    <cfset Session.mystruct["#arguments.key#"] = arguments.value>
            </cfif>
        </cfif>
        <cfreturn Session.mystruct> 
    </cffunction>

    <cffunction name="replaceStructure" access="remote">
        <cfargument name="key" required="true">
        <cfargument name="value" required="true">
        <cfapplication name="structure" sessionTimeout = #CreateTimeSpan(0, 0, 0, 60)#
        sessionManagement = "Yes">

        <cfif NOT StructKeyExists(Session,"mystructs")>
        <cflock timeout="20" scope="Session" type="Exclusive">
            <cfset Session.mystructs = structNew()>
        </cflock>
        </cfif>

        <cfif StructKeyExists(Session,"mystructs")>
            <cfif IsDefined("arguments.key") AND isDefined("arguments.value")>
                <cfset Session.mystructs["#arguments.key#"] = arguments.value>
            </cfif>
        </cfif>
        <cfreturn Session.mystructs> 
    </cffunction>

    <cffunction name="showReplaceStructure" access="remote">
        <cfargument name="key" required="true">
        <cfargument name="value" required="true">
        <cfset alertArray = arrayNew(1)>
        <cfapplication name="structure" sessionTimeout = #CreateTimeSpan(0, 0, 0, 60)#
        sessionManagement = "Yes">

        <cfif NOT StructKeyExists(Session,"myStructShow")>
            <cflock timeout="20" scope="Session" type="Exclusive">
                <cfset Session.myStructShow = structNew()>
            </cflock>
        </cfif>
        <cfif StructKeyExists(Session,"myStructShow")>
            <cfset alertArray = arrayNew(1)/>
            <cfif IsDefined("arguments.key") AND isDefined("arguments.value")>
                <cfif structKeyExists("#Session.myStructShow#", arguments.key)>
                    <cfset arrayAppend(alertArray,"#arguments.key# already present,not add again")>
                <cfelse>
                    <cfset Session.myStructShow["#arguments.key#"] = "#arguments.value#">
                </cfif>
            </cfif>
        </cfif>
        <cfdump var=#Session.myStructShow#>
        <cfreturn alertArray> 
    </cffunction>

    <cffunction name="showAlphabeticalStructure" access="remote">
        <cfargument name="key" required="true">
        <cfargument name="value" required="true">
        <cfset alertArray = arrayNew(1)>
        <cfapplication name="structure" sessionTimeout = #CreateTimeSpan(0, 0, 0, 60)#
        sessionManagement = "Yes">

        <cfif NOT StructKeyExists(Session,"myStructAlph")>
            <cflock timeout="20" scope="Session" type="Exclusive">
                <cfset Session.myStructAlph = structNew()>
            </cflock>
        </cfif>
        <cfif StructKeyExists(Session,"myStructAlph")>
            <cfset alertArray = arrayNew(1)/>
            <cfif IsDefined("arguments.key") AND isDefined("arguments.value")>
                <cfif structKeyExists("#Session.myStructAlph#",arguments.key)>
                    <cfset arrayAppend(alertArray,"#arguments.key# already present,not add again")>
                <cfelse>
                    <cfset Session.myStructAlph["#arguments.key#"] = "#arguments.value#">
                    <!---<cfset myStructArray = structKeyArray(Session.myStructAlph)> --->
                    <!--- <cfset sortedArray = myStructArray.sort("text","asc")> --->
                </cfif>
            </cfif>
        </cfif>
        <cfdump var=#Session.myStructAlph#> 
        <cfreturn alertArray>
    </cffunction>

    <cffunction name="listOutDataByNumber" access="remote">
        <cfargument name="rowNumber" required="true">
        <cfset arrayShown = arrayNew(1)>
        <cfif rowNumber gt 10>
            <cfset arrayAppend(arrayShown,'Please provide value less than 10')/>
        <cfelse>
            <cfinvoke component = "components.userDefined" 
             method = "retrieveTableList" returnVariable = "listOuts">
            <cfinvokeargument  name="numberRow"  value="#rowNumber#"> 
            </cfinvoke>
        <cfset que = QueryGetRow(listOuts,rowNumber)/>
        <cfset arrayAppend(arrayShown,"first Name of #rowNumber# is #que.firstName#")>
        <cfset arrayAppend(arrayShown,"Last Name of #rowNumber# is #que.lastName#")>
        </cfif>
        <cfreturn >
    </cffunction>

    <cffunction name ="multipled" returnType="string">
        <cfset argCount = ArrayLen(Arguments)>
        <cfset multipleValue = 1>
        <cfloop from ="1" to = "#argCount#" index="i" step="1">
            <cfset multipleValue = multipleValue * Arguments[i] >
        </cfloop>
        <cfreturn multipleValue>
    </cffunction>

    <cffunction  name="cfstringFinding" access="remote">
        <cfargument name="stringValue" required="true">
        <cfset orginal = "the quick brown fox jumps over the lazy dog">
        <cfset totsCount = listValueCountNoCase("the quick brown fox jumps over the lazy dog", arguments.stringValue," ") />
        <cfset display ="Result as found,the key value '#arguments.stringValue#' 
        in #totsCount# times - the quick brown fox jumps over the lazy dog." />

        <cfif NOT StructKeyExists(Session,"myStringStorage")>
        <cflock timeout="20" scope="Session" type="Exclusive">
            <cfset Session.myStringStorage = structNew()>
        </cflock>
        </cfif>

        <cfif StructKeyExists(Session,"myStringStorage")>
            <cfif IsDefined("arguments.stringValue")>
                <cfset Session.myStringStorage["result"] = display>
            </cfif>
        </cfif>
        <cflocation  url="../cftask13.cfm">
    </cffunction>

    <cffunction  name="imageProcess" access="remote">
        <cfargument name="name" required="true">
        <cfargument name="description" required="true">
        <cfargument name="image" required="true">
        <cfset thisDir = expandPath("..\uploads\")>
        <cfset imageArray = arrayNew(1)>
        <cfset aMessages = "">

        <cfif len(trim(arguments.image))>
            <cffile action="upload" fileField="image"
            nameconflict="overwrite" result = "fileupload"
            destination="#thisDir#">
        
            <cfif fileUpload.fileWasSaved>
                <cfset path = fileupload.serverdirectory & "\" & fileupload.serverfile>
                <cfif NOT isImageFile(path)> 
                    <cfset errors = "Invalid Image!<br />"> 
                    <cffile action="delete" file="#path#">

                    <cfelseif fileupload.filesize gt 1000000>
                        <cfset aMessages = "File size is greater tah 1 mb,please try again">                       
                        <cflocation url="../cftask14.cfm?aMessages=#aMessages#"> 
                    <cfelse>
                        <cfimage action="read" source = "../uploads/#fileUpload.serverfile#" name = "myImage">
                        <cfset ImageScaleToFit(myImage,75,75,"bilinear")>
                        <cfset newImageName = fileUpload.serverDirectory & "/" &
                            fileUpload.serverFilename & "_thumbnail." &
                            fileUpload.serverFileExt>            
                    <cfimage source ="#myImage#" action="write"
                        destination = "#newImageName#" overwrite ="yes">
                        <!---<cfset arrayAppend(imageArray, "created a new thumbnail image")> --->
                        <cfoutput>
                            <div class='d-flex flex-column justify-content-center align-items-center'>
                                <p class=' text-success font-weight-bold'>
                                File Uploaded and thumbnail created!!<p>
                                <cfimage source="#newImageName#" action="writeToBrowser">
                            </div>
                        </cfoutput>
                        <!--- db insert code here--->
                    <cfquery name="addImageData" result = result  datasource="cruddb">
                        INSERT INTO coldfusiion.cftask_image (name,description,image)
                        VALUES(
                            <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.name#">,
                            <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.description#">,
                            <cfqueryparam CFSQLType="cf_sql_varchar" value ="#fileupload.serverfile#">          
                            )
                    </cfquery>
                    <cflocation url="../cftaskextended.cfm" > 
                </cfif>           
            </cfif>
        </cfif>
        
    </cffunction>

    <cffunction  name="oddEvenFinding" access="remote">
        <cfargument  name="number" required="true">

        <cfif NOT StructKeyExists(Session,"myIntegerStorage")>
        <cflock timeout="20" scope="Session" type="Exclusive">
            <cfset Session.myIntegerStorage = arrayNew(1)>
        </cflock>
        </cfif>

        <cfif isNumeric(arguments.number)>
            <cfloop from ="1" to =#arguments.number# index="i" step=1>
                <cfif StructKeyExists(Session,"myIntegerStorage")>
                        <cfset arrayAppend(Session.myIntegerStorage, i)>
                </cfif> 
             </cfloop>
        </cfif>
        <cflocation  url="../cftask17.cfm">
    </cffunction>

    <cffunction  name="cfdbFetch" access="remote">
        <cfargument  name="rowNumber" required="true">
        <cfset aDBMessages = "">
        <cfif NOT StructKeyExists(Session,"myStorage")>
            <cflock timeout="20" scope="Session" type="Exclusive">
                <cfset Session.Storage = arrayNew(1)>
            </cflock>
        </cfif>
        <cfif arguments.rowNumber gt 10>
            <cfset aDBMessages = "Please provide value less than 10">
        <cfelse>
            <cfquery name="listOuts" datasource = "cruddb">
                SELECT * FROM coldfusiion.cftasks
            </cfquery>
        <cfset que = QueryGetRow(listOuts,rowNumber)/>
        <cfset aDBMessages = "first Name of #arguments.rowNumber# is #que.firstName# And
        Last Name of #arguments.rowNumber# is #que.lastName#">
        </cfif>
        <cfif StructKeyExists(Session,"myIntegerStorage")>
            <cfset arrayAppend(Session.Storage, listOuts)>
        </cfif> 
        <cflocation  url="../cftask12.cfm?aMessages=#aDBMessages#">
    </cffunction>

    <cffunction  name="cfCounter" access="remote">
        <cfif IsDefined("cookie.visitCounter") is FALSE>
            <cfcookie  name="visitCounter" expires="never" value="1">
        </cfif>
        <cfif IsDefined("cookie.visitCounter") is TRUE>
            <cfset visitCounter = "#cookie.visitCounter#">
            <cfcookie  name="visitCounter" expires="never" value="#IncrementValue(visitCounter)#">
        </cfif>
        <cflocation  url="../cftask19.cfm">
    </cffunction>

    <cffunction name="cfCaptcha" access="remote">
        <cfargument  name="email" required="true">
        <cfargument  name="enteredValue" required="true">
        <cfargument  name="captchaHashed" required="true">
        <cfset aCaptchaMessages = "">

        <cfif NOT StructKeyExists(Session,"aCaptchaMessages") >
            <cflock timeout="20" scope="Session" type="Exclusive">
                <cfset Session.aCaptchaMessages = structNew()>
            </cflock>
        </cfif>

        <cfparam name="arguments.email" default="">
        <cfparam name="arguments.enteredValue" default="">
        <cfparam name="arguments.captchaHashed" default="">

        <cfset email = arguments.email>
        <cfset enteredValue = arguments.enteredValue>
        <cfset captchaHashed = arguments.captchaHashed>

        <cfif hash(ucase(enteredValue)) neq captchaHashed>
            <cfset aCaptchaMessages = "You did not enter the right text.Please try again">
        <cfelseif email EQ '' OR NOT isValid("email",email)>
            <cfset aCaptchaMessages = "Please provide valid email">
        <cfelse>
            <cfset aCaptchaMessages = "Email Address successfully subscribed our newsletter">
        </cfif>
        <cflocation  url="../cftask20.cfm?aMessages=#aCaptchaMessages#">        
    </cffunction>

    <cffunction name="cfBirthdayWish" access="remote">

        <cfargument  name="babayName">
        <cfargument  name="email" required="true">
        <cfargument  name="description" required="true">
        <cfargument  name="image" required="true">
        <cfset thisDir = expandPath("..\uploads\")>

        <cfset aBirthdayMessages = "">

        <cfif len(trim(arguments.image))>
            <cffile action="upload" fileField="image"
            nameconflict="overwrite" result = "fileupload"
            destination="#thisDir#">
            <cfif fileUpload.fileWasSaved>
                <cfmail
                from="Sender@Company.com"
                to="#email#"
                subject="#description#"
                type="html">
                <!---<p><img src="#thisDir#/#image# width="350" height="261" alt="" /><br /></p> --->
                </cfmail>
                <cfset aBirthdayMessages = "File uploaded and mail forwarded successfully">
            </cfif>
        </cfif>
        <cflocation  url="../cftask21.cfm?aMessages=#aBirthdayMessages#">        
    </cffunction>
    
    <cffunction  name="listOutData" access="remote">
        <cfquery name="listOuts" datasource = "cruddb">
            SELECT * FROM coldfusiion.cftasks
        </cfquery>
        <cfreturn listOuts>
    </cffunction>

    <cffunction name="createFormDetails" access="remote">
        <cfargument name="position" required="true">
        <cfargument name="checks" required="true">
        <cfargument name="startDate" required="true">
        <cfargument name="websiteName" required="true">
        <cfargument name="salary" required="true">
        <cfargument name="firstName" required="true">
        <cfargument name="lastName" required="true">
        <cfargument name="email" required="true">
        <cfargument name="phone" required="true">
        
        <cffile action="upload"
        fileField="resume"
        nameconflict="overwrite"
        destination="C:\coldFusion2021\cfusion\wwwroot\test\uploads\">

        <cfset imageValue = #cffile.serverFile#> 
        <cfquery name="addData" result = result  datasource="cruddb">
            INSERT INTO coldfusiion.form_info (position,relocate,startDate,website,resumePath,salary,firstName,
            lastName,email,phone)
            VALUES(

               <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.position#">,
               <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.checks#">,
               <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.startDate#">,
               <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.websiteName#">,
               <cfqueryparam  CFSQLType="cf_sql_varchar" value="#imageValue#">,
               <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.salary#">,
               <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.firstName#">,
               <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.lastName#">,
               <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.email#">,
               <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.phone#">            
               )
       </cfquery>
       <cfset message  ="Application submitted successfully">
       <cflocation  url="../cftask23.cfm?aMessages=#message#">        
   </cffunction>

    <cffunction name="insertVerifiedEmailData" access="remote">
        <cfargument name="name" required="true">
        <cfargument name="email" required="true">
        <cfquery name="insertValues" datasource="cruddb">
            INSERT INTO coldfusiion.verify_table (fullName,email) VALUES(
                <cfqueryparam CFSQLType="cf_sql_varchar" value ="#arguments.name#">,
                <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.email#">
            )
        </cfquery>
       <cfset message  ="Email verified and data submitted successfully...">
       <cflocation  url="../cftask24.cfm?aMessages=#message#">  
    </cffunction>

    <cffunction  name="loginVerified" access="remote">
        <cfargument name="username" required="true">
        <cfargument name="password" required="true">
        <cfset encodedPassword = hash("#Password#", "SHA-256", "UTF-8")>
        <cfset errorShower = arrayNew(1)>

        <cfquery name="verifiedDetails" datasource="cruddb">
            SELECT *FROM coldfusiion.login_table WHERE userName = "#arguments.username#" AND 
            password = "#arguments.password#"
        </cfquery>

        <cfif verifiedDetails.RecordCount gt 0>

            <cfif NOT structKeyExists(Session,"adminCredentials")>
                <cfdump var =#verifiedDetails.RecordCount#>
                <cfabort>
                <cflock  timeout="20" scope="Session" type="Exclusive">
                    <cfset Session.adminCredentials = structNew()>
                </cflock>
            </cfif>
            <cfif structKeyExists(Session,"adminCredentials")>
                <cfset Session.adminCredentials["userName"] = "#verifiedDetails.userName#">
                <cfset Session.adminCredentials["password"] = "#verifiedDetails.password#">
                <cfset Session.adminCredentials["isAuthenticated"] = "True">
            </cfif>
            <cflocation  url="../cftask27/welcomePage.cfm"> 
        <cfelse>
        <cfset arrayAppend(errorShower, "Invalid login credentials,please try again")>
    </cfif>

    
    </cffunction>
    


    
</cfcomponent>