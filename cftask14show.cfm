<head>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <title>CF TASKS</title>
</head>
<cfif isDefined("url.imgID")>
    <cfquery name='img_details' datasource='cruddb'>
        SELECT *
        FROM coldfusiion.cftask_image
        WHERE id="#url.imgID#" 
     </cfquery>
</cfif>
<div class="card1">
<h3>IMAGE DETAILS</h3>

    <cfoutput query = img_details><br>
    <tr>
        <p>Image id : #id#</p><br>
        <p>Name : #name#</p><br>
        <p>Description :#description#</p><br>
        <cfset path = expandPath("./uploads")& "\" & image>
        <cfimage source="#path#" action="writeToBrowser" height="200vh" width="300">
    </cfoutput>
</div>
