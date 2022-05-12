<cfcomponent accessors="TRUE">
    <cffunction name="init" access="public" returntype="struct" >
        <cfargument name="textP" type="string" /> 
        <cfset local.words = reMatch("[[:word:]]+", textP) >
        <cfset local.struct_name = StructNew()> 
        <cfloop index="i" array="#local.words#"> 
            <cfif structKeyExists(struct_name, i)> 
                <cfset local.struct_name[i]++> 
            <cfelse> 
                <cfset local.struct_name[i] = 1> 
            </cfif> 
        </cfloop>
        <cfreturn local.struct_name>
    </cffunction>
</cfcomponent>