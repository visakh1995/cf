<cfinvoke component = "components.userDefined"
     method = "listImageInfo"
     returnVariable = "allInfo">
</cfinvoke>

<html>
    <head>
        <link rel="stylesheet" href="css/newstyle.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <table width="100%" cellpadding="5" 
            cellspacing="8">
            <tr>
                <th>Id</th>
                <th>name</th>
                <th>description</th>
                <th>thumbnail</th>
            </tr>
            <cfoutput query = allInfo>
            <tr>
                <td>#id#</td>
                <td>#name#</td>
                <td>#description#</td>
                <td><a href="cftask14show.cfm?imgID=#id#">
                <img width="30%" src="uploads/#getFileFromPath(image)#"></a>
                </td>
            </tr>
            </cfoutput>
        </table>
    </body>
</html

