
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <style>
    #alert{
        background-color: red;
        border-radius:5px;
        color:#fff;
        font-size:16px;
        text-align:center;
        font-weight:900;
    }
    .odd{
        font-size:20px;
        color:darkblue;
        font-weight:bold;
    }
    .even{
        font-size:20px;
        color:darkgreen;
        font-weight:bold;
    }
    </style>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 17-</h3>

                    <cfform name="myForm" action="">
                        <div id="alert"></div>
                        <div class="form-control">
                            <cfinput type="text" id = "enteredValue" placeholder="Please enter numeric value"
                             name="number" validate="numeric" message="Please enter numeric value"
                             onError="showErrorMessage">
                        </div>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" name="Submit" >
                        <div>
                    </cfform>
                    <cfif structKeyExists(form,'Submit')>
                        <cfset value = form.number>
                        <cfif isNumeric(value)>
                            <cfloop from ="1" to =#value# index="i">
                                <cfoutput>
                                    <cfif #i# MOD 2 EQ 0>
                                        <span class="even">#i#</span>
                                    <cfelse>
                                        <span class="odd">#i#</span>
                                    </cfif>
                                    <br>
                                </cfoutput>
                             </cfloop>
                        </cfif>

                    </cfif>
                </div>
            </div>
        </section>
    </body>
    <script>
    function showErrorMessage(form, ctrl, value, message) {
     document.getElementById("alert").innerHTML ="Please enter Numeric value";
    // alert("The value " + value +" of the " + ctrl + " field " + message);
    }
    </script>
   

    
</html>