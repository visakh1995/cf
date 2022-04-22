
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card1">
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
                                <cfset arrayAppend(imageArray, "file uploaded")>
                                <cfmail
                                from="Sender@Company.com"
                                to="#email#"
                                subject="#description#"
                                type="html">
                                <!---<p><img src="#thisDir#/#image# width="350" height="261" alt="" /><br /></p> --->
                                </cfmail>
                                <cfset arrayAppend(imageArray, "& mail forwarded successfully")>
                            </cfif>
                        </cfif>
                    </cfif>
                    <cfform name="cftask_1" enctype="multipart/form-data" action="">
                        <cfif isDefined('imageArray') AND NOT arrayIsEmpty(imageArray)>
                            <div class="alert">
                                <cfoutput>
                                    <cfloop array = #imageArray# index = "Detail">
                                        <p>#Detail#</p>
                                    </cfloop>
                                </cfoutput>
                            </div>
                        </cfif>
                        <div class="form-control">
                            <cfinput type="text" placeholder="Enter the baby name"
                             name="babyName">
                        </div>
                        <div class="form-control">
                            <cfinput type="email" placeholder="Enter the email "
                             name="email">
                        </div><br><br><br>
                        <div class="form-control">
                            <cftextarea rows="5" cols="37" class="texts" 
                            name="description"  placeholder="Birthday Wish here"/>
                        </div><br><br>
                        <div class="form-control">
                            <cfinput type="file" placeholder="Greetings Image"
                             name="image" accept =" .jpg,.png,.gif">
                        </div><br><br>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" name="Submit">
                        <div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>

</html>