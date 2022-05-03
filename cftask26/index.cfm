<html>

    <head>
    <title>Upload File</title>
    <link rel="stylesheet" href="../css/style.css" type="text/css">

    </head>
    <body>
        <div class="main-container">
        <div class="card">
        <div class='container py-5 cform_div'>
        <h3 class='text-center'>CFTASK 26 - Word Count</h3>

        <cfform  method='post' action="" enctype="multipart/form-data" 
        name="img_form" class='col-lg-6 offset-lg-3'>
            <br><br><br>
            <div class="form-controls">
                <cfinput type='file' name='doc_file' accept='.doc,.txt,.pdf'>
            </div><br><br>
            <div class="form-btn">
                <cfinput type="submit" name="Submit"  value="Submit" class="btn btn-primary">
            <div>
        </cfform>
        </div>
        </div>
        </div>
    </body>
    </html>
    
    <cfif structKeyExists(form, "Submit")>
    
        <cfset thisDir = expandPath("./uploads")>
        <cfif len(trim(form.doc_file)) >
                <cffile action="upload" fileField="form.doc_file"  destination="#thisDir#" result="fileUpload"
                nameconflict="overwrite">
    
                <cfset file_name=#fileupload.serverfile# >
                <cfset fileLoc=fileupload.serverDirectory & '\' & fileupload.serverfile >
                <cffile action="read" file="#fileLoc#" variable="Contents">
                <cfdump var=#Contents#>

                <cfobject component ="CF_TASK.components.newdefined" name="redirectObject">
                <cfinvoke component="#redirectObject#"
                method="structTextRetriever" returnVariable="structData">
                <cfinvokeargument  name="description"  value="#Contents#"> 
                </cfinvoke>
    
                <cfset skeys = structKeyList(structData)>
                <cfloop list="#skeys#" index="i">
                    <cfquery name="word" datasource="cruddb">
                    INSERT INTO coldfusiion.read_count(sentence) VALUES('#i#' )
                    </cfquery>
                </cfloop>
    
                <cflocation url="viewpage.cfm?desc='#Contents#">
        </cfif>
    
    </cfif>
    
    
    
    