
<cfobject component ="CF_TASK.components.newdefined" name="redirectObject">
<cfinvoke component="#redirectObject#"
    method="sortedListFile" returnVariable="page">
</cfinvoke>

<cfparam  name="desc">

<cfinvoke component="#redirectObject#"
method="structTextRetrieverFile" returnVariable="structData">
<cfinvokeargument  name="description"  value="#desc#"> 
</cfinvoke>

<cfdump var =#structData#>
<cfoutput>
    <h3>Words in alphabetical Order</h3>
    </cfoutput>
    <cfloop query="page" >
    <cfif isNumeric('#page.sentence#') EQ 'NO'>
            <!---<cfif #structData["#page.sentence#"]# NEQ 3> --->
            <cfif structKeyExists(structData, #page.sentence#)>
                <cfoutput>
                <p>-#page.sentence# ( #structData["#page.sentence#" ]#)</p>
                </cfoutput>
            </cfif>
            <!---</cfif> --->
    </cfif>
    </cfloop>

    <!----Sorting in descending order of keys---->
    <cfoutput>
    <h3>Result  in decreasing order of the count of words </h3>
    </cfoutput>
    <cfloop array="#sortData#" index="i" >
    
    <cfif isNumeric('#i#') EQ 'NO'>
        <cfif #structData["#i#"]# NEQ 3>
            <cfif structKeyExists(structData, #i#)>
                <cfoutput>          
                   <p> 
                   -#i# ( #structData["#i#" ]#)      
                   </p>
                 </cfoutput>
            </cfif>
    
        </cfif>
    </cfif>
    </cfloop>