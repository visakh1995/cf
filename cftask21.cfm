
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 21</h3>
                    <cfif structKeyExists(form,'Submit')>
                        <cfset thisDir = expandPath(".\uploads\")>
                        <cfset babayName = form.babyName>
                        <cfset email = form.email>
                        <cfset description = form.description>
                        <cfset image = form.image>
                        <cfset imageArray = arrayNew(1)>

                        <cfif len(trim(form.image))>
                            <cffile action="upload" fileField="image"
                            nameconflict="overwrite" result = "fileupload"
                            destination="#thisDir#">
                            <cfif fileUpload.fileWasSaved>
                                <p>uploaded successfully, mail function goes here</p>
                                <cfmail
                                from="Sender@Company.com"
                                to="#email#"
                                subject="Sample e-mail from ColdFusion">
                                This is a sample e-mail message to show basic e-mail capability.
                                </cfmail>
                            </cfif>
                        </cfif>
                    </cfif>
                    <cfform name="cftask_1" enctype="multipart/form-data" action="">
                        <div class="form-control">
                            <cfinput type="text" placeholder="Enter the baby name"
                             name="babyName" message="Please enter number between 1 and 5">
                        </div>
                        <div class="form-control">
                            <cfinput type="text" placeholder="Enter the email "
                             name="email">
                        </div>
                        <div class="form-controls">
                            <cftextarea rows="5" cols="39" class="texts" 
                            name="description"  placeholder="Birthday Wishes"/>
                        </div>
                        <div class="form-control">
                            <cfinput type="file" placeholder="Greetings Image"
                             name="image" accept =" .jpg,.png,.gif">
                        </div>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" name="Submit">
                        <div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
</html>