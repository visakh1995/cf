
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
                    <cfif isDefined("aMessages")>
                        <div class="alert-green">
                            <cfoutput>
                                <p>#aMessages#</p>
                            </cfoutput>
                        </div>
                    </cfif>
                    <form name="cftask_1" method = "post"
                    action="components/taskdefined.cfc?method=insertVerifiedEmailData">
                        <div class="form-control">
                            <input type="text" placeholder="Name"
                             name="name">
                        </div>
                        <div class="form-control">
                            <input type="email" id="email" placeholder="Email"
                             name="email" required>
                        </div>
                        <input class="checkbox1" type="checkbox"
                        name="checks" id="yes"
                        value="1"> accept terms and conditions
                        <br><br>

                        <div id="buttonOne" class="buttonOne">
                            <input type="submit" id="buttonChange" class="btn" name="Submit" disabled>
                        <div>
                    </form>
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

</html>