<cfset jsonData = [{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}]>
<cfset dData = serializeJSON(jsonData)> 
<cfset sData = deserializeJSON(dData)> 

<table width="100%" cellpadding="5" 
cellspacing="8" style="border: 1px solid black">
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
<style>
    td,th{
        border :1px solid #000;
        width:300px;
    }
</style>

<!--- <cfset check = isJSON(dData)> --->
<!--- <cfdump var = #sData#> --->
<!--- <cfdump var = #check#> --->