<html>
    <head>
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 25</h3>
                    <form name="cftask_1" method="post" enctype="multipart/form-data" 
                    action="../components/taskdefined.cfc?method=structTextRetriever">
                        <br><br><br>
                        <div class="form-controls">
                            <textarea rows="7" cols="34" class="texts" 
                            name="description"  placeholder="">
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