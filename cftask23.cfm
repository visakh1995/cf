<html>
    <head>
        <link rel="stylesheet" href="css/newstyle.css" type="text/css">
        <script src="./scripts/script.js"></script>
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="containWrapper">
                    <div class="card">
                        <h3 class="heading">WUFOO
                            <span><p class="heading-paras">by survey monkey</p></span></h3>
                        <div class="heading-two">
                        <h2>Employment Application</h2>
                        <p class="heading-two-para">Infinity Box Inc</p>
                        </div>
                        <div class="alerts" id="alert"></div>
                        <cfif isDefined("aMessages")>
                            <div class="alert-green">
                                <cfoutput>
                                    <p>#aMessages#</p>
                                </cfoutput>
                            </div>
                        </cfif>
                        <form name="myForm" method="post" 
                            enctype="multipart/form-data" 
                            action="components/taskdefined.cfc?method=createFormDetails">
                            <div class="form-control">
                                <select  
                                class="fullWidth"
                                name = "position" id="position"> 
                                <option value = "">-----Select----</option> 
                                <option value = "1">Interface Designer</option> 
                                <option value = "2">Software Engineer</option> 
                                <option value = "3">System Administrator</option> 
                                <option value = "4">Office Mangaer</option> 
                                </select>
                                <p class="date-label">Which position are you applying for?*</p><br>
                            </div><br>
                            <div class="form-control">
                                <p class="label">Are you willing relocate ?</p><br>
                                <div class="checkboxed">
                                <input class="checkbox1" type="radio"
                                name="checks" id="yes"
                                value="1">Yes
                                <input class="checkbox2" type="radio"
                                name="checks" id="no"
                                value="0">No
                                </div>
                            </div>
                            <div class="form-control">
                                <input type="date" id="startDate" name="startDate">
                                <p class="date-label">When can you start?*</p>
                            </div>
                            <div class="form-control">
                                <input type="text" name="websiteName"
                                placeholder="http://">
                                <p class="date-label">Portfolio website</p>
                            </div><br><br>
                            <div class="form-control">
                                <p class="date-label">Attach a copy of your resume ?
                                <span class="date-label">(Word or PDF documents only)</span></p>
                                <br>
                                <input class="file-label" type="file" name="resume">
                                
                            </div>
                            <div class="form-control">
                                <input type="text" name="salary" placeholder ="$">
                                <p class="date-label">Salary Requirements</p>
                            </div><br><br>
                            <h3>Your Contact Information</h3>
                            <div class="form-control">
                                <input type="text" name="firstName" id="firstName" 
                                placeholder="First Name*">
                            </div>
                            <div class="form-control">
                                <input type="text" name="lastName" id="lastName"
                                placeholder="Last Name*">
                            </div>

                            <div class="form-control-two">
                                <input type="email" name="email" id="email"
                                placeholder="Email Address*">
                            </div>
                            <div class="form-control">
                                <input type="number" name="phone" id="phone"
                                placeholder="Phone Number*">
                            </div>
                            <br><br><br>
                            <div class="btn">
                                <input type="submit" class="btn" name="Submit" onclick ="return onValidate()">
                            <div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>