
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
                    <h3 class="heading">CF TASK 25 </h3>
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
                        <div id="buttonOne" class="buttonOne">
                            <cfinput type="submit" id="buttonChange" class="btn" name="Submit" disabled>
                        <div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
</html>