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
                    <form name="cftask_1" method="post" enctype="multipart/form-data"
                        action="components/taskdefined.cfc?method=cfBirthdayWish">
                        <cfif isDefined("aMessages")>
                            <div class="alert-green">
                                <cfoutput>
                                    <p>#aMessages#</p>
                                </cfoutput>
                            </div>
                        </cfif>
                        <div class="form-control">
                            <input type="text" placeholder="Enter the baby name"
                             name="babyName" required>
                        </div>
                        <div class="form-control">
                            <input type="email" placeholder="Enter the email "
                             name="email" required>
                        </div><br><br><br>
                        <div class="form-control">
                            <textarea rows="5" cols="37" class="texts" 
                            name="description" required>
                            </textarea>
                        </div><br><br>
                        <div class="form-control">
                            <input type="file" placeholder="Greetings Image"
                             name="image" accept =".jpg,.png,.gif" required>
                        </div><br><br>
                        <div class="form-btn">
                            <input type="submit" class="btn" name="Submit">
                        <div>
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>