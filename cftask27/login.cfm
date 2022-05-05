
<html>
    <head>
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <title>CF TASK 27 LOGIN</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">SIGN IN</h3>
                    <form name="cftask_1" method="post" 
                    action="../components/taskdefined.cfc?method=loginVerified">
                        <cfif isDefined("aMessages")>
                            <div class="alert">
                                <cfoutput>
                                    <p>#aMessages#</p>
                                </cfoutput>
                            </div>
                        </cfif>
                        <div class="form-control">
                            <input type="text" placeholder="Username"
                             name="username">
                        </div>
                        <div class="form-controls">
                            <input type="text" placeholder="Password"
                             name="password">
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