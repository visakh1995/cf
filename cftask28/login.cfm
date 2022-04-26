
<html>
    <head>
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <link rel="stylesheet" href="css/cms.css" type="text/css">
        <title>CF TASK 28 CMS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading-cms">CMS SIGNIN</h3>
                    <cfif structKeyExists(form,'Submit')>

                        <cfset Username = form.username/>
                        <cfset Password = form.password/>
                        <cfset encodedPassword = hash("#Password#", "SHA-256", "UTF-8")>
                        <cfset errorShower = arrayNew(1)>
                    
                        <cfobject component ="CF_TASK.components.userDefined" name="redirectObject">
                        <cfinvoke component="#redirectObject#"
                        method="CMSverifyCredentials" returnVariable="verfiedResults">
                        <cfinvokeargument  name="username"  value="#Username#"> 
                        <cfinvokeargument  name="password"  value="#Password#"> 
                        </cfinvoke>

                        <cfif verfiedResults != 0>
                            <cfif isUserInRole("1") OR isUserInRole("2") OR isUserInRole("3")>
                                <cflocation  url="./welcomePage.cfm">                  
                            </cfif>
                        <cfelse>
                            <cfset arrayAppend(errorShower, "Invalid login credentials,please try again")> 
                        </cfif>   

                    </cfif>

                    <cfform name="cftask_1" action="#CGI.script_name#?#CGI.query_string#">
                        <cfif isDefined("errorShower") AND NOT arrayIsEmpty(errorShower)>
                            <div class="alert">
                                <cfoutput>
                                    <cfloop array="#errorShower#" index="errorGets">
                                        <p>#errorGets#</p>
                                    </cfloop>
                                </cfoutput>
                            </div>
                        </cfif>
                        <div class="form-control">
                            <cfinput type="text" placeholder="Username"
                             name="username">
                        </div>
                        <div class="form-controls">
                            <cfinput type="password" placeholder="Password"
                             name="password">
                        </div><br><br>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn-cms" name="Submit">
                        <div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
</html>