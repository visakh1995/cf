

<cffunction name ="multipled" returnType="string">
    <!--- <cfargument name ="a" type="string" required="yes"> --->
    <cfset argCount = ArrayLen(Arguments)>
    <cfset multipleValue = 1>
    <cfloop from ="1" to = "#argCount#" index="i" step="1">
        <cfset multipleValue = multipleValue * Arguments[i] >
    </cfloop>
    <cfreturn multipleValue>
    <!--- <cfdump var = #multipleValue#> --->
</cffunction>

<cfset res = multipled(2,2,2,2,2,2)>
<cfdump var="#res#">



<!--- <cfscript>
    function multiply(a,b){
        var argCount = ArrayLen(Arguments);
        // writeDump(argCount);
        var multiple = 1;
        for(i = 1; i LTE argCount;i = i + 1){
            multiple = multiple *  Arguments[i];
        }
        writeDump(multiple);
    }
    multiply(3,5,1,2,3,2,2);
</cfscript> --->



