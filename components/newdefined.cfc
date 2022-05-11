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
    <cffunction name="sortedList" access="public" output="true">
        <cfquery name="page">
            SELECT *FROM coldfusiion.words_table 
        </cfquery>
        <cfreturn page>
    </cffunction>
    <cffunction name="sortedListFile" access="public" output="true">
        <cfquery name="page">
            SELECT *FROM coldfusiion.read_count 
        </cfquery>
        <cfreturn page>
    </cffunction>
</cfcomponent>