
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <cfset newInstance = createObject("component","components.userDefined")> 
        <cfset captcha = newInstance.makeRandomString()> 
        <cfset captchaHash = hash(captcha)>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 20 captcha-</h3>
                    <cfif isDefined("aMessages")>
                        <div class="alert-green">
                            <cfoutput>
                                <p>#aMessages#</p>
                            </cfoutput>
                        </div>
                    </cfif>
                    <form name="cftask_1" method="post" 
                        action="components/taskdefined.cfc?method=cfCaptcha">
                        <div class="form-control">
                            <input type="text" placeholder="Enter the email"
                             name="email" >
                        </div>
                        <div class="form-control">
                            <input type="text"  placeholder="Enter the text below"
                             name ="enteredValue"><br><br><br>
                             <cfoutput>
                             <input type="hidden" name ="captchaHashed" value="#captchaHash#">
                             </cfoutput>
                             <cfimage action="captcha" width="300" height="75" text="#captcha#">
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