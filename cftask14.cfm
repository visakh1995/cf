<cfif structKeyExists(form,'Submit')>
    <cfset thisDir = expandPath(".\uploads\")>
    <cfset name = form.name>
    <cfset description = form.description>
    <cfset image = form.image>
    <cfset imageArray = arrayNew(1)>

    <cfif len(trim(form.image))>
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
                <cfimage action="read" source = "./uploads/#fileUpload.serverfile#" name = "myImage">
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
                    File Uploaded and thumbnail created!!
                    <p>
                    <cfimage source="#newImageName#" action="writeToBrowser">
                    </div>
                </cfoutput>
                <cfinvoke component="components.userDefined" 
                method="createImageUpload" returnVariable="insertedData" 
                argumentCollection="#Form#"> 
                        <cfinvokeargument  name="imageName" value=" #fileupload.serverfile#">
                </cfinvoke>
            </cfif>           
        </cfif>
    </cfif>
</cfif>

<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <style>
    .texts{
        width:100%;
    }
    </style>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF Task 14 - Form</h3>
                    <cfif isDefined("imageArray") AND NOT arrayIsEmpty(imageArray)>
                        <cfloop array = #imageArray# index = "value">
                            <div class="alert">
                                <cfoutput>
                                    <p>#value#<p>
                                </cfoutput>
                            </div>
                        </cfloop>
                    </cfif>
                    <cfform name="cftask_1" enctype="multipart/form-data" action="">
                        <div class="form-control">
                            <cfinput type="text" placeholder="Image Name"
                             name="name">
                        </div>
                        <div class="form-controls">
                            <cftextarea rows="5" cols="5" class="texts" 
                            name="description"  placeholder="description"/>
                        </div>
                        <div class="form-control">
                            <cfinput type="file" placeholder="Upload Image"
                             name="image" accept =" .jpg,.png,.gif">
                        </div>
                        <cfoutput>
<!---                             <cfset theDir=GetDirectoryFromPath(GetCurrentTemplatePath())> --->
<!---                             <cfset theFile=theDir & "uploads/#getFileFromPath(newImageName)#"> --->
<!---                             <cfif  FileExists(theFile)> --->
<!---                                <img src="uploads/#getFileFromPath(newImageName)#"> --->
<!---                             </cfif> --->

                        </cfoutput>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" value = "Submit" 
                            name="Submit">
                        <div>
                    </cfform>
                </div>
        </section>
    </body>
</html>