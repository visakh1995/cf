<cfcomponent accessors="TRUE"> 
    <cffunction name="init"> 
        <cfreturn this> 
    </cffunction> 
    <cffunction name="structTextRetriever"> 
    <cfargument  name="description" type="string" required="yes">
    <cfset words = reMatch("[[:word:]]+", description)>
    <cfset mySentence = structNew()>
        <cfloop array= #words# index="i">
            <cfif structKeyExists(mySentence, i)>
                <cfset mySentence[i]++>
            <cfelse>
                <cfset mySentence[i] = 1>
            </cfif>
        </cfloop >
     <cfreturn mySentence>
    </cffunction> 
    <cffunction name="sortedList">
        <cfquery name="page" datasource="cruddb">
            SELECT *FROM coldfusiion.words_table ORDER BY sentence DESC
        </cfquery>
        <cfreturn page>
    </cffunction>
    <cffunction name="sortedListFile">
        <cfquery name="page" datasource="cruddb">
            SELECT *FROM coldfusiion.read_count ORDER BY sentence DESC
        </cfquery>
        <cfreturn page>
    </cffunction>
</cfcomponent>