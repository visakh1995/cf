
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
                    
                    <cfif structKeyExists(form,'Submit')>
                        <cfset aErrorMessages = arrayNew(1)>
                        <cfparam name="form.name" default="">
                        <cfparam name="form.email" default="">
                        <cfparam name="form.enteredValue" default="">
                        <cfparam name="form.captchaHashed" default="">

                         <cfset email = form.email>
                         <cfset enteredValue = form.enteredValue>
                         <cfset captchaHashed = form.captchaHashed>

                         <cfif hash(ucase(form.enteredValue)) neq form.captchaHashed>
                            <cfset arrayAppend(aErrorMessages,'You did not enter the right text.Please try again')/>
                        <cfelseif form.email EQ '' OR NOT isValid("email",form.email)>
                            <cfset arrayAppend(aErrorMessages,'Please provide valid email')/>
                        <cfelse>
                            <cfset arrayAppend(aErrorMessages,'Email Address successfully subscribed our newsletter')/>
                        </cfif>
                    </cfif>
                    <cfform name="cftask_1" action="#cgi.script_name#">

                        <cfif isDefined('aErrorMessages') AND NOT arrayIsEmpty(aErrorMessages)>
                            <div class="alert">
                                <cfoutput>
                                    <cfloop array = #aErrorMessages# index = "message">
                                        <p>#message#</p>
                                    </cfloop>
                                </cfoutput>
                            </div>
                        </cfif>

                        <div class="form-control">
                            <cfinput type="text" placeholder="Enter the email"
                             name="email" >
                        </div>
                        <div class="form-control">
                            <cfinput type="text"  placeholder="Enter the text below"
                             name ="enteredValue"><br><br><br>
                             <cfinput type="hidden" name ="captchaHashed" value="#captchaHash#">
                             <cfimage action="captcha" width="300" height="75" text="#captcha#">
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