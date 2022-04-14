
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 24 </h3>
                    <cfif structKeyExists(form,'Submit')>
                    </cfif>
                    <cfform name="cftask_1" action="">
                        <div class="form-control">
                            <cfinput type="text" placeholder="Name"
                             name="name">
                        </div>
                        <div class="form-control">
                            <cfinput type="text" placeholder="Email"
                             name="email">
                        </div>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" name="Submit" disabled>
                        <div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
</html>