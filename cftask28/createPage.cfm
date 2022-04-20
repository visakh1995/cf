
<html>
    <head>
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">ADD PAGE</h3>

                    <cfform name="cftask_1" action="action.cfm" method = "post">
                        <div class="form-control">
                            <cfinput type="text" placeholder="Page name"
                             name="pageName">
                        </div>
                        <div class="form-controls">
                            <cftextarea rows="5" cols="39" class="texts" 
                            name="pageDescription"  placeholder="Page Description"/>
                        </div>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" name="Submit">
                        <div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
</html>