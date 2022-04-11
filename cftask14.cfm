<cfif structKeyExists(form,'Submit') and len(trim(form.image))>
    <cfset thisDir = expandPath(".\uploads\")>
    <cfset name = form.name>
    <cfset description = form.description>
    <cfset image = form.image>
    <cfset imageArray = arrayNew(1)>
    <cfset fileSizeLimit = 60000 />

        <cfif cgi.content_length LTE fileSizeLimit>
            <cffile action="upload"
            fileField="image"
            accept="image/png, image/gif, image/jpeg" 
            nameconflict="overwrite"
            result = "fileupload"
            allowedExtensions =".png,.jpeg"
            destination="#thisDir#">
                <cfif fileUpload.fileWasSaved>
                        <!---<cfif isImageFile("#fileupload.serverfile#")> --->
                        <cfimage action="read" source = "./uploads/#fileUpload.serverfile#"
                        name = "myImage">
                            <cfset ImageScaleToFit(myImage,75,75,"bilinear")>
                            <cfset newImageName = fileUpload.serverDirectory & "/" &
                            fileUpload.serverFilename & "_thumbnail." &
                            fileUpload.serverFileExt>
                            <cfimage source ="#myImage#" action="write"
                            destination = "#newImageName#" overwrite ="yes">
                            <cfset arrayAppend(imageArray, "created a new thumbnail image")>


                            <cfinvoke component="components.userDefined" 
                            method="createImageUpload" returnVariable="insertedData" 
                            argumentCollection="#Form#"> 
                            <cfinvokeargument  name="imageName"  value=" #fileUpload.serverFilename & "_thumbnail."&
                            fileUpload.serverFileExt#">
                            </cfinvoke>


                            <!---</cfif> --->
                </cfif>
        <cfelse>
        <cfset arrayAppend(imageArray, "large image or wrong format,cant upload,please try again")>
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
                    <h3 class="heading">CF TASK 14 FORM</h3>
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
                             name="image">
                        </div>
                        <cfoutput>
<!---                             <cfset theDir=GetDirectoryFromPath(GetCurrentTemplatePath())> --->
<!---                             <cfset theFile=theDir & "uploads/#getFileFromPath(newImageName)#"> --->
<!---                             <cfif  FileExists(theFile)> --->
<!---                                <img src="uploads/#getFileFromPath(newImageName)#"> --->
<!---                             </cfif> --->

                        </cfoutput>


                        <div class="form-btn">
                            <cfinput type="submit" class="btn" value = "Send Image" 
                            name="Submit">
                        <div>
                    </cfform>
                </div>
        </section>
    </body>
</html>