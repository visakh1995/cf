<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <cfif isDefined("url.imgID")>
            <cfset newInstance = createObject("component","components.taskdefined")> 
            <cfset dispatchedValues = newInstance.showDetailsByID(url.imgID)> 
        </cfif>
        <div class="card1">
        <h3>IMAGE DETAILS</h3>

            <cfoutput query = dispatchedValues><br>
            <tr>
                <p>Image id : #id#</p><br>
                <p>Name : #name#</p><br>
                <p>Description :#description#</p><br>
                <cfset path = expandPath("./uploads")& "\" & image>
                <cfimage source="#path#" action="writeToBrowser" height="200vh" width="300">
            </cfoutput>
        </div>
    </body>
</html>
