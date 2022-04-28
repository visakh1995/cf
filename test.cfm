<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/uttilities.css"type="text/css">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <title>CMS</title>
    </head>
    <body>
        <nav class="sidebar">
            <div class="logo-content">
                <div class="logo">
                    <i class='bx bxl-adobe'></i>
                    <div class="logo-name">cms site</div>
                </div>
                <i class='bx bx-menu'></i>
            <div>
            
            <div class="nav_list">
                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="">
                        <i class='bx bx-grid-alt'></i>
                        <span class="text nav-text">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="">
                        <i class='bx bx-grid-alt'></i>
                        <span class="text nav-text">User</span>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="profile_content">
                <div class="profile">
                    <div class="profile_details">
                        <div class="name_job">
                            <div class="name">name</div>
                            <div class="job">job</div>
                        </div>
                    </div>
                    <i class='bx bx-log-out' id="log_out"></i>
                </div>
            </div>

            <section>
                <div class="main-container">
                    <cfoutput>      
                            <cfapplication name="login" sessionTimeout="#CreateTimeSpan(0, 0, 60, 60)#"
                            sessionManagement="yes">
                            <h3 class="welcome-heading">welcome
                             <span>#Session.credentials.userName#</span><h3> 
                    </cfoutput>
                    <button class="logout" name="logout"><a href="action.cfm?logout">logout</a></button>
    
                </div>
            </section>



        </nav>



    </body>
</html>

<!--- <cfscript>
    function multiply(a,b){
        var argCount = ArrayLen(Arguments);
        // writeDump(argCount);
        var multiple = 1;
        for(i = 1; i LTE argCount;i = i + 1){
            multiple = multiple *  Arguments[i];
        }
        writeDump(multiple);
    }
    multiply(3,5,1,2,3,2,2);
</cfscript> --->

<cffunction  name="imageProcess" access="remote">
    <cfargument name="name" required="true">
    <cfargument name="description" required="true">
    <cfargument name="image" required="true">
    <cfset thisDir = expandPath("..\uploads\")>
    <cfset imageArray = arrayNew(1)>
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
                <cfoutput>
                    <cfset arrayAppend(imageArray, "File size is greater tah 1 mb,please try again")>
                </cfoutput>
            <cfelse>
                <cfimage action="read" source = "../uploads/#fileUpload.serverfile#" name = "myImage">
                <cfset ImageScaleToFit(myImage,75,75,"bilinear")>
                <cfset newImageName = fileUpload.serverDirectory & "/" &
                    fileUpload.serverFilename & "_thumbnail." &
                    fileUpload.serverFileExt>
        
            <cfimage source ="#myImage#" action="write"
                destination = "#newImageName#" overwrite ="yes">
            <cfset arrayAppend(imageArray, "created a new thumbnail image")>
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
                        <cfqueryparam value="#form.name#">,
                        <cfqueryparam value="#form.description#">,
                        <cfqueryparam value ="#fileupload.serverfile#">          
                          )
                </cfquery>
                    <cflocation url="../cftaskextended.cfm" > 
                <!---    --->
            <cfinvoke component="components.userDefined" 
                method="createImageUpload" returnVariable="insertedData" 
                argumentCollection="#Form#"> 
                <cfinvokeargument  name="imageName" value="#fileupload.serverfile#">
            </cfinvoke>
        </cfif>           
    </cfif>
    </cfif>
    
</cffunction>