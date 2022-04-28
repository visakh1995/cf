
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF Task 14 - Form</h3>
                    <cfif isDefined("aMessages")>
                        <div class="alerts">
                            <cfoutput>
                                <p>#aMessages#</p>
                            </cfoutput>
                        </div>
                    </cfif>
                    <form name="cftask_1" method="post" enctype="multipart/form-data" 
                    action="components/taskdefined.cfc?method=imageProcess">
                        <div class="form-control">
                            <input type="text" placeholder="Image Name"
                             name="name">
                        </div><br>
                        <div class="form-controls">
                            <p class="date-label">description</p>
                            <textarea rows="5" cols="5" class="texts" 
                            name="description">
                            </textarea>
                        </div><br>
                        <div class="form-control">
                            <input type="file" placeholder="Upload Image"
                             name="image" accept =".jpg,.png,.gif">
                        </div>
                        <cfoutput>
                        </cfoutput><br><br>
                        <div class="form-btn">
                            <input type="submit" class="btn" value = "Submit" 
                            name="Submit">
                        <div>
                    </form>
                </div>
        </section>
    </body>
</html>