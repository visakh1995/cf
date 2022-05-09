<cfcomponent>

    <cffunction name="stringValues"  access="remote" output="true">
        <cfargument name="number" type="integer" required="true"> 
        <cfset local.aMessages = "">
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
        <cflocation  url="../cftask1.cfm?aMessages=#local.aMessages#">
    </cffunction>

    <cffunction name="cfCaseValues"  access="remote" output="true">
        <cfargument name="number" type="integer" required="true"> 
        <cfset local.caseMessages = "">
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

    <cffunction name="cfContinue" access="public" output="true" 
        returnType="array">
        <cfargument  name="number" type="string" required="true">
        <cfset local.caseMessages = arrayNew(1)>
        <cfloop list = #arguments.number# index="i" delimiters = ",">
        <cfif i mod 3>
            <cfcontinue>
        <cfelse>
            <cfset arrayAppend(local.caseMessages, i)>
        </cfif>
        </cfloop>
        <cfreturn caseMessages>
    </cffunction>

    <cffunction  name="cfAgeView" access="public" output="true"
        returnType="array">
        <cfargument name="mDob" type="date" required="true"> 
        <cfargument name="uDob" type="date" required="true"> 
        <cfset local.dateDetails = arrayNew(1)>

        <cfset local.userAge = dateDiff("yyyy",arguments.uDob,Now())>
        <cfset arrayAppend(dateDetails,"User Age is #userAge#")>

        <cfset local.deliveredDate = dateDiff("yyyy",arguments.uDob,arguments.mDob)>
        <cfset arrayAppend(dateDetails,"Mother's age at the time of delvery #local.deliveredDate#")>

        <cfset local.BdayDay = DateFormat(arguments.uDob,"mm/dd/2022")>
        <cfset local.BdayMDay = DateFormat(arguments.mDob,"mm/dd/2022")>

        <cfset local.birthDayRemUser = dateDiff("d",Now(),BdayDay)>
        <cfset local.birthDayRemMother = dateDiff("d",Now(),BdayMDay)>
        <cfset arrayAppend(dateDetails,"Days remaining for users birthday is - #birthDayRemUser#")>
        <cfset arrayAppend(dateDetails,"Days remaining for mother birthday is- #birthDayRemMother#")>
        <cfreturn dateDetails>
    </cffunction>

    <cffunction name="structureDisplay" access="public" output="true"
        returnType="struct">
        <cfargument name="key" type="string" required="true">
        <cfargument name="value" type="string"required="true">
        <cfset local.structDetails = structNew()/>
        <cfset local.keys = StructInsert(structDetails,arguments.key,arguments.value)/>
        <cfreturn structDetails> 
    </cffunction>

    <cffunction name="structurePreviousFetch" access="public" output="true"
        returnType="struct">
        <cfargument name="key" type="string" required="true">
        <cfargument name="value" type="string" required="true">
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

    <cffunction name="replaceStructure" access="public" output="true"
        returnType="struct">
        <cfargument name="key" type="string" required="true">
        <cfargument name="value" type="string" required="true">
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

    <cffunction name="showReplaceStructure" access="public" output="true"
        returnType="string">
        <cfargument name="key" type="string" required="true">
        <cfargument name="value" type="string" required="true">
        <cfset local.aMessages = "">
        
        <cfif NOT StructKeyExists(Session,"myStructShow")>
            <cflock timeout="20" scope="Session" type="Exclusive">
                <cfset Session.myStructShow = structNew()>
            </cflock>
        </cfif>
        <cfif StructKeyExists(Session,"myStructShow")>
            <cfif IsDefined("arguments.key") AND isDefined("arguments.value")>
                <cfif structKeyExists("#Session.myStructShow#", arguments.key)>
                    <cfset aMessages = "#arguments.key# already present,not add again">
                <cfelse>
                    <cfset Session.myStructShow["#arguments.key#"] = "#arguments.value#">
                </cfif>
            </cfif>
        </cfif>
        <cfdump var=#Session.myStructShow#>
        <cfreturn aMessages> 
    </cffunction>

    <cffunction name="showAlphabeticalStructure" access="public" output="true"
        returnType="array">
        <cfargument name="key" type="string" required="true">
        <cfargument name="value" type="string" required="true">
        <cfset alertArray = arrayNew(1)>

        <cfif NOT StructKeyExists(Session,"myStructAlph")>
            <cflock timeout="20" scope="Session" type="Exclusive">
                <cfset Session.myStructAlph = structNew()>
            </cflock>
        </cfif>
        <cfif StructKeyExists(Session,"myStructAlph")>
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
        <cfreturn>
    </cffunction>

    <cffunction name ="multipled" access="public" returnType="string" output="true">
        <cfset local.mulVariables = Arguments>
        <cfset argCount = ArrayLen(mulVariables)>
        <cfset multipleValue = 1>
        <cfloop from ="1" to = "#argCount#" index="i" step="1">
            <cfset multipleValue = multipleValue * mulVariables[i] >
        </cfloop>
        <cfreturn multipleValue>
    </cffunction>

    <cffunction  name="cfstringFinding" access="remote" output="true">
        <cfargument name="stringValue" type="string" required="true">
        <cfset local.orginal = "the quick brown fox jumps over the lazy dog">
        <cfset local.totsCount = listValueCountNoCase("the quick brown fox jumps over the lazy dog",
        arguments.stringValue," ") />
        <cfset local.display ="Result as found,the key value '#arguments.stringValue#' 
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

    <cffunction  name="imageProcess" access="remote" output="true">
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
                <cfset local.path = fileupload.serverdirectory & "\" & fileupload.serverfile>
                <cfif NOT isImageFile(path)> 
                    <cfset local.errors = "Invalid Image!<br />"> 
                    <cffile action="delete" file="#path#">

                    <cfelseif fileupload.filesize gt 1000000>
                        <cfset local.aMessages = "File size is greater tah 1 mb,please try again">                       
                        <cflocation url="../cftask14.cfm?aMessages=#aMessages#"> 
                    <cfelse>
                        <cfimage action="read" source = "../uploads/#fileUpload.serverfile#" name = "myImage">
                        <cfset ImageScaleToFit(myImage,75,75,"bilinear")>
                        <cfset local.newImageName = fileUpload.serverDirectory & "/" &
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

    <cffunction  name="oddEvenFinding" access="remote" output="true">
        <cfargument name="number" type="integer" required="true">

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

    <cffunction  name="cfdbFetch" access="remote" output="true">
        <cfargument  name="rowNumber" required="true">
        <cfset local.aDBMessages = "">

        <cfif arguments.rowNumber gt 10>
            <cfset aDBMessages = "Please provide value less than 10">
        <cfelse>
            <cfquery name="listOuts" datasource = "cruddb">
                SELECT * FROM coldfusiion.cftasks
            </cfquery>
            <cfif NOT StructKeyExists(Session,"myStorage")>
                <cflock timeout="20" scope="Session" type="Exclusive">
                    <cfset Session.myStorage = arrayNew(1)>
                </cflock>
            </cfif>

            <cfif StructKeyExists(Session,"myStorage")>
                <cfset arrayAppend(Session.myStorage, listOuts)>
            </cfif>    
     
            <cfset que = QueryGetRow(listOuts,rowNumber)/>
            <cfset aDBMessages = "first Name of #arguments.rowNumber# is #que.firstName# And
            Last Name of #arguments.rowNumber# is #que.lastName#">
            <cflocation  url="../cftask12.cfm?aMessages=#aDBMessages#"> 
        </cfif>
    </cffunction>

    <cffunction  name="cfCounter" access="remote" output="true">
        <cfif IsDefined("cookie.visitCounter") is FALSE>
            <cfcookie  name="visitCounter" expires="never" value="1">
        </cfif>
        <cfif IsDefined("cookie.visitCounter") is TRUE>
            <cfset local.visitCounter = "#cookie.visitCounter#">
            <cfcookie  name="visitCounter" expires="never" value="#IncrementValue(visitCounter)#">
        </cfif>
        <cflocation  url="../cftask19.cfm">
    </cffunction>

    <cffunction name="cfCaptcha" access="remote" output="true">
        <cfargument  name="email" type="email" required="true">
        <cfargument  name="enteredValue" type="string" required="true">
        <cfargument  name="captchaHashed" type="string" required="true">
        <cfset local.aCaptchaMessages = "">

        <cfif NOT StructKeyExists(Session,"aCaptchaMessages") >
            <cflock timeout="20" scope="Session" type="Exclusive">
                <cfset Session.aCaptchaMessages = structNew()>
            </cflock>
        </cfif>

        <cfparam name="arguments.email" default="">
        <cfparam name="arguments.enteredValue" default="">
        <cfparam name="arguments.captchaHashed" default="">

        <cfset local.email = arguments.email>
        <cfset local.enteredValue = arguments.enteredValue>
        <cfset local.captchaHashed = arguments.captchaHashed>

        <cfif hash(ucase(enteredValue)) neq captchaHashed>
            <cfset aCaptchaMessages = "You did not enter the right text.Please try again">
        <cfelseif email EQ '' OR NOT isValid("email",email)>
            <cfset aCaptchaMessages = "Please provide valid email">
        <cfelse>
            <cfset aCaptchaMessages = "Email Address successfully subscribed our newsletter">
        </cfif>
        <cflocation  url="../cftask20.cfm?aMessages=#aCaptchaMessages#">        
    </cffunction>

    <cffunction name="cfBirthdayWish" access="remote" output="true">

        <cfargument  name="babayName" type="string">
        <cfargument  name="email" type="email" required="true">
        <cfargument  name="description" type="string" required="true">
        <cfargument  name="image" type="string" required="true">
        <cfset thisDir = expandPath("..\uploads\")>

        <cfset local.aBirthdayMessages = "">

        <cfif len(trim(arguments.image))>
            <cffile action="upload" fileField="image"
            nameconflict="overwrite" result = "fileupload"
            destination="#thisDir#">
            <cfif fileUpload.fileWasSaved>
                <cfmail
                from="Sender@Company.com"
                to="#arguments.email#"
                subject="#arguments.description#"
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

    <cffunction name="createFormDetails" access="remote" output="true">
        <cfargument name="position" type="string" required="true">
        <cfargument name="checks" type="string" required="true">
        <cfargument name="startDate" type="string" required="true">
        <cfargument name="websiteName" type="string" required="true">
        <cfargument name="salary" type="string" required="true">
        <cfargument name="firstName" type="string" required="true">
        <cfargument name="lastName" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="phone" type="string" required="true">
        
        <cffile action="upload"
        fileField="resume"
        nameconflict="overwrite"
        destination="C:\coldFusion2021\cfusion\wwwroot\test\uploads\">

        <cfset local.imageValue = #cffile.serverFile#> 
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
       <cfset local.message  ="Application submitted successfully">
       <cflocation  url="../cftask23.cfm?aMessages=#message#">        
   </cffunction>

    <cffunction name="insertVerifiedEmailData" access="remote" output="true">
        <cfargument name="name" type="string" required="true">
        <cfargument name="email" type="email" required="true">
        <cfquery name="insertValues" datasource="cruddb">
            INSERT INTO coldfusiion.verify_table (fullName,email) VALUES(
                <cfqueryparam CFSQLType="cf_sql_varchar" value ="#arguments.name#">,
                <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.email#">
            )
        </cfquery>
       <cfset local.message  ="Email verified and data submitted successfully...">
       <cflocation  url="../cftask24.cfm?aMessages=#message#">  
    </cffunction>

    <cffunction  name="loginVerified" access="remote">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" required="true">
        <cfset encodedPassword = hash("#Password#", "SHA-256", "UTF-8")>
        <cfset message  ="">

        <cfquery name="verifiedDetails" datasource="cruddb">
            SELECT *FROM coldfusiion.login_table WHERE userName = "#arguments.username#" AND 
            password = "#arguments.password#"
        </cfquery>

        <cfif verifiedDetails.RecordCount gt 0>
            <cfif NOT structKeyExists(Session,"adminCredentials")>
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
            <cfset message  ="Invalid username or password">
            <cflocation  url="../cftask27/login.cfm?aMessages=#message#">  
        </cfif>
    </cffunction>
    
    <cffunction name="CMSverifyCredentials" access="remote">
        <cfargument name="username" type="string">
        <cfargument name="password" type="string">
            <cfquery name="verifiedCMSDetails" datasource="cruddb">
                SELECT *FROM coldfusiion.cms_user WHERE userName = "#username#" AND 
                password = "#password#"
            </cfquery>
            <cfset messages ="">
        <cfif verifiedCMSDetails.RecordCount gt 0>
            <cflogin>
                <cfloginuser  name="#verifiedCMSDetails.userName#" 
                roles="#verifiedCMSDetails.role#"
                password="#verifiedCMSDetails.password#">
            </cflogin>

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

                <cfif isUserInRole("1") OR isUserInRole("2") OR isUserInRole("3")>
                    <cflocation  url="../cftask28/welcomePage.cfm">                  
                </cfif>
        <cfelse>
            <cfset message  ="Invalid username or password,please try again...">
            <cflocation  url="../cftask28/login.cfm?aMessages=#message#">  
        </cfif>
    </cffunction>

    <cffunction name="updatePageDetails" access="remote">
        <cfargument name="pageId" type="string">
        <cfargument name="pageName" type="string">
        <cfargument name="pageDescription" type="string">

        <cfquery name="updateData" datasource="cruddb">
           UPDATE coldfusiion.cms_page SET 
           pageName = <cfqueryparam CFSQLType = "cf_sql_varchar" value="#arguments.pageName#">,
           pageDescription  = <cfqueryparam  CFSQLType = "cf_sql_varchar" value="#arguments.pageDescription#">
           WHERE pageId = "#arguments.pageId#"
        </cfquery>
        <cflocation url="../cftask28/welcomePage.cfm" >
    </cffunction>

    <cffunction name="deleteCmsPageDetails" access="remote">
        <cfargument name="deleteId" required="yes">
        <cfquery name="deleteData" datasource="cruddb">
            DELETE FROM coldfusiion.cms_page WHERE pageId = "#deleteId#"
        </cfquery>
        <cflocation  url="../cftask28/welcomePage.cfm">
    </cffunction>

    <cffunction name="createPageDetails" access="remote">
        <cfargument name="pageName" type="string">
        <cfargument name="pageDescription" type="string">
        <cfquery name="addData" result = result  datasource="cruddb">
            INSERT INTO coldfusiion.cms_page (pageName,pageDescription)
            VALUES(
            <cfqueryparam CFSQLType = "cf_sql_varchar" value="#arguments.pageName#">,
            <cfqueryparam CFSQLType = "cf_sql_varchar" value="#arguments.pageDescription#">
             )
        </cfquery>
        <cflocation url="../cftask28/welcomePage.cfm" > 
    </cffunction>

    <cffunction name="loggedOut" access="remote">
        <cfset StructDelete(Session, "Credentials")>
        <cflocation  url="../cftask28/login.cfm">
    </cffunction>

    <cffunction name="structTextRetriever" access="remote">
        <cfargument  name="description" type="string" required="yes">
        <cfset mySentence = structNew()>
        <cfset insertions =StructInsert(mySentence,"sentence","#arguments.description#")>
        <cfset data = structKeyList(mySentence)>
        <cfloop list= #data# index="i">
            <cfquery name = "insertWords" datasource="cruddb">
                INSERT INTO coldfusiion.words_table(sentence)
                VALUES(
                <cfqueryparam value="#i#">
                 )
            </cfquery>
        </cfloop>
        <cflocation url="../cftask25/showPage.cfm?desc='#arguments.description#">
    </cffunction>

    <cffunction  name="structTextRetrieveByFile" access="remote">
        <cfset thisDir = expandPath("./uploads")>
        <cfif len(trim(form.doc_file)) >
            <cffile action="upload" fileField="form.doc_file"  destination="#thisDir#" result="fileUpload"
                nameconflict="overwrite">
    
            <cfset file_name=#fileupload.serverfile# >
            <cfset fileLoc=fileupload.serverDirectory & '\' & fileupload.serverfile >
            <cffile action="read" file="#fileLoc#" variable="Contents">
            <cfdump var=#Contents#>

            <cfset words = reMatch("[[:word:]]+", Contents)>
            <cfset mySentence = structNew()>
                <cfloop array= #words# index="i">
                    <cfif structKeyExists(mySentence, i)>
                        <cfset mySentence[i]++>
                    <cfelse>
                        <cfset mySentence[i] = 1>
                    </cfif>
                </cfloop >
    
                <cfset skeys = structKeyList(mySentence)>
                <cfloop list="#skeys#" index="i">
                    <cfquery name="word" datasource="cruddb">
                    INSERT INTO coldfusiion.read_count(sentence) VALUES('#i#' )
                    </cfquery>
                </cfloop>
    
                <cflocation url="../cftask26/viewpage.cfm?desc='#Contents#">
        </cfif>
    </cffunction>
    <cffunction  name="showDetailsByID" access="remote">
        <cfargument  name="detailsId" type="string" required="yes">
        <cfquery name='img_details' datasource='cruddb'>
            SELECT *
            FROM coldfusiion.cftask_image
            WHERE id="#detailsId#" 
         </cfquery>
        <cfreturn img_details>
    </cffunction>

</cfcomponent>