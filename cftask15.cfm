    <h3>multiply</h3>
    <p>using cf object and cf invoke</p>
    <cfobject component = "components.userDefined" name ="multipliedOne">
    <cfset newInstance = createObject("component","components.userDefined")> 

    <cfinvoke component ="#multipliedOne#"  method="multipleValueCalc"
    returnVariable = "results">
    <cfinvokeargument  name="one"  value="5,3,2,2">
    </cfinvoke>
    <cfdump var = #results#> 
    <hr>


    <p>using create object instance</p>
    <cfset newInstance = createObject("component","components.userDefined")> 
    <cfset calc = newInstance.multipleValueCalcCreateObject(1,2,3,4)> 
    <cfdump var = #calc#> 













<!--- <cfset res = multiply(2,2,2,2,2,2)> --->
<!--- <cfdump var="#res#"> --->

