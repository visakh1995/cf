<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>Task 11</title>
    </head>
    <body>
        <section>
            <div class="main_container">
                <div class="forms card">
                    <h3>Task 11 - Multiply Function</h3>
                    <hr>
                    <cfset res1=myFun(1,2)>
                    <p>multiply(1,2)= <cfdump var="#res1#">
                    </p>
                    <br>
                    <cfset res2=myFun(1,2,3)>
                    <p>multiply(1,2,3)= <cfdump var="#res2#"></p>                  
                    <br>
                    <cfset result=myFun(1,2,3,4)>
                    <p>multiply(1,2,3,4)= <cfdump var="#result#"></p>                     
                    <br>
                </div>
            </div>
        </section>
    </body>
</html>

<cfscript> 
    function myFun()
    { 
        var arg_count = ArrayLen(Arguments); 
        var mul =1; 
        var i = 0; 
        for( i = 1 ; i LTE arg_count; i = i + 1 ) 
            { mul = mul* Arguments[i]; } 
            return mul;
    } 
</cfscript>