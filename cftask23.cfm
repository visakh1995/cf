
<html>
    <head>
        <link rel="stylesheet" href="css/newstyle.css" type="text/css">
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
                        <div class="alert" id="alert"></div>
                        <cfform name="myForm" enctype="multipart/form-data" action="cftask23action.cfm" method = "post">
                            <div class="form-control">
                                <cfselect  
                                class="fullWidth"
                                name = "position" id="position"> 
                                <option value = "">-----Select----</option> 
                                <option value = "1">Interface Designer</option> 
                                <option value = "2">Software Engineer</option> 
                                <option value = "3">System Administrator</option> 
                                <option value = "4">Office Mangaer</option> 
                                </cfselect>
                                <p class="date-label">Which position are you applying for?*</p><br>
                            </div><br>
                            <div class="form-control">
                                <p class="label">Are you willing relocate ?</p><br>
                                <div class="checkboxed">
                                <cfinput class="checkbox1" type="checkbox"
                                name="checks" id="yes"
                                value="1">Yes
                                <cfinput class="checkbox2" type="checkbox"
                                name="checks" id="no"
                                value="0">No
                                </div>
                            </div>
                            <div class="form-control">
                                <cfinput type="date" id="startDate" name="startDate">
                                <p class="date-label">When can you start?*</p>
                            </div>
                            <div class="form-control">
                                <cfinput type="text" name="websiteName"
                                placeholder="http://">
                                <p class="date-label">Portfolio website</p>
                            </div><br><br>
                            <div class="form-control">
                                <p class="date-label">Attach a copy of your resume ?
                                <span class="date-label">(Word or PDF documents only)</span></p>
                                <br>
                                <cfinput class="file-label" type="file" name="resume">
                                
                            </div>
                            <div class="form-control">
                                <cfinput type="text" name="salary" placeholder ="$">
                                <p class="date-label">Salary Requirements</p>
                            </div><br><br>
                            <h3>Your Contact Information</h3>
                            <div class="form-control">
                                <cfinput type="text" name="firstName" id="firstName" 
                                placeholder="First Name*">
                            </div>
                            <div class="form-control">
                                <cfinput type="text" name="lastName" id="lastName"
                                placeholder="Last Name*">
                            </div>

                            <div class="form-control-two">
                                <cfinput type="email" name="email" id="email"
                                placeholder="Email Address*">
                            </div>
                            <div class="form-control">
                                <cfinput type="number" name="phone" id="phone"
                                placeholder="Phone Number*">
                            </div>
                            <br><br><br>
                            <div class="btn">
                                <cfinput type="submit" class="btn" name="Submit" onclick ="return onValidate()">
                            <div>
                            
                        </cfform>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <script>
          function onValidate() {
                var position = document.getElementById("position").value;
                var yes = document.getElementById("yes").value;
                var no = document.getElementById("no").value;
                var startDate = document.getElementById("startDate").value;
                var firstName = document.getElementById("firstName").value;
                var lastName = document.getElementById("lastName").value;
                var email = document.getElementById("email").value;
                var phone = document.getElementById("phone").value;
                var cbox = document.forms["myForm"]["checks"];

                if(position == ""){
                    document.getElementById("alert").innerHTML ="please select the position you are looking for";
                    return false;
                }
                if(cbox[0].checked == false &&cbox[1].checked == false) {
                    document.getElementById("alert").innerHTML ="Please Select checkbox";
                    return false;
                }
                if(startDate == "") {
                    document.getElementById("alert").innerHTML ="Please Select the start date";
                    return false;
                }
                if(firstName == "" ||  lastName == "" || email == "" || phone =="" ) {
                    document.getElementById("alert").innerHTML ="Please fill all fields in contact information";
                    return false;
                }
                if(!isNaN(firstName) || !isNaN(lastName) ) {
                    document.getElementById("alert").innerHTML ="Name field cant allow numbers";
                    return false;
                }
                var phoneNum = phone.replace(/[^\d]/g, '');
                    if(phoneNum.length > 6 && phoneNum.length < 11) { 
                    return true;
                }else{
                    document.getElementById("alert").innerHTML ="please provide valid phone number";
                return false;
                }      
        }
    </script>
</html>