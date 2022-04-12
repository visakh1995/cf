<cfinvoke component = "components.userDefined"
     method = "listImageInfo"
     returnVariable = "allInfo">
</cfinvoke>

<table width="100%" cellpadding="5" 
cellspacing="8" style="border: 1px solid black">
    <tr>
        <th>id</th>
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
        <img src="uploads/#getFileFromPath(image)#"></a>
        </td>

    </tr>
</cfoutput>
</table>
<style>
    td,th{
        border :1px solid #000;
        width:300px;
    }
</style>
