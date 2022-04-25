
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 24 </h3>
                    <div id="alerts"></div>
                    <cfif structKeyExists(form,'Submit')>
                    </cfif>
                    <cfform name="cftask_1" action="cftask24action.cfm" method = "post">
                        <div class="form-control">
                            <cfinput type="text" placeholder="Name"
                             name="name">
                        </div>
                        <div class="form-control">
                            <cfinput type="email" id="email" placeholder="Email"
                             name="email" required>
                        </div>
                        <cfinput class="checkbox1" type="checkbox"
                        name="checks" id="yes"
                        value="1"> accept terms and conditions
                        <br><br>

                        <div id="buttonOne" class="buttonOne">
                            <cfinput type="submit" id="buttonChange" class="btn" name="Submit" disabled>
                        <div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
    <script>
        $("body").on('change', '#email', function() {
            var selectedValue = $(this).val();
                $.ajax({
                url: 'components/userDefined.cfc',
                type: 'get',
                dataType: "json",
                data: {
                method: "getUserByEmail",
                userEmail: selectedValue
                },
                success: function (data){
                    if(data == 0){
                        document.getElementById("buttonChange").disabled = false;
                    }else{
                         document.getElementById("alerts").innerHTML = "The email id already exist,please try again";
                    }
                 }, 
                error: function (xhr, textStatus, errorThrown){
                    console.log(xhr);
                    // alert('an error occurred');
                }
            });
        });
    </script>
        <style>
            .form-btn-disable{
                padding:5px 15px;
                border:none;
                border-radius: 5px;
                color:#fff;
                text-align: center;
                background-color:red;
            }
                #alerts{
                background-color:red;
                text-align: center;
                color:#fff;
                font-size: 13px;
                border-radius: 5px;
            }
            input[type="email"]{
                border:none;
                padding:3px;
                border-bottom: 1px solid grey;
                font-size:15px;
                width: 100%;
                background-color: #fff;
                margin-top: 50px;
                }
   
        </style>
</html>