<html>
    <head>
        <title>Upload File</title>
        <link rel="stylesheet" href="../css/style.css" type="text/css">
    </head>
    <body>
        <div class="main-container">
            <div class="card">
                <div class='container py-5 cform_div'>
                    <h3 class='text-center'>CFTASK 26 - Word Count</h3>
                    <form  method='post' action="../components/taskdefined.cfc?method=structTextRetrieveByFile" 
                        enctype="multipart/form-data" name="img_form" class='col-lg-6 offset-lg-3'>
                        <br><br><br>
                        <div class="form-controls">
                            <input type='file' name='doc_file' accept='.doc,.txt,.pdf'>
                        </div><br><br>
                        <div class="form-btn">
                            <input type="submit" name="Submit"  value="Submit" class="btn btn-primary">
                        <div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
    

    
    
    