<cfset jsonData = [{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}]>
<cfset dData = serializeJSON(jsonData)> 
<cfset sData = deserializeJSON(dData)> 

<html>
    <head>
        <link rel="stylesheet" href="css/newstyle.css" type="text/css">
    </head>
    <body>
        <table width="100%" cellpadding="2" 
            cellspacing="7">
            <tr>
                <th>Name</th>
                <th>Age</th>
                <th>Location</th>
            </tr>
            <cfloop array ="#sData#" index="idex">
                <cfoutput>
                    <tr>
                        <td>#idex.Name#</td>
                        <td>#idex.Age#</td>
                        <td>#idex.LOCATION#</td>
                    </tr>
                </cfoutput>
            </cfloop>
        </table>
    </body>
</html>


