
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
                    <form name="cftask_1" action="../components/taskdefined.cfc?method=createPageDetails" 
                    method = "post">
                        <div class="form-control">
                            <input type="text" placeholder="Page name"
                             name="pageName">
                        </div><br>
                        <div class="form-controls">
                            <textarea rows="5" cols="39" class="texts" 
                            name="pageDescription"  placeholder="Page Description"/>
                            </textarea>
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