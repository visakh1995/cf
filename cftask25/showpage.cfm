
<cfobject component ="CF_TASK.components.newdefined" name="redirectObject">
<cfinvoke component="#redirectObject#"
    method="sortedList" returnVariable="getInfo">
</cfinvoke>

<cfparam  name="desc">
<cfinvoke component="#redirectObject#"
method="structTextRetriever" returnVariable="structRes">
<cfinvokeargument  name="description"  value="#desc#"> 
</cfinvoke>

<cfdump var =#structRes#>
<p>words in alpabetical order</p>
    <cfloop query="getInfo">
        <cfif isNumeric('#getInfo.sentence#' EQ 'NO')>
            <cfif #structRes["#getInfo.sentence#"]# NEQ 3>
                <cfif structKeyExists(structRes,#getInfo.sentence#)>
                    <cfoutput>
                        <p>#getInfo.sentence#(#structRes["#getInfo.sentence#"]#)</p>
                    </cfoutput>
                </cfif>
            </cfif>
        </cfif>

    </cfloop>
<p>sort- descending order basis of count</p>
    <cfloop query="getInfo">
        <cfif isNumeric('#getInfo.sentence#' EQ 'NO')>
            <cfif #structRes["#getInfo.sentence#"]# NEQ 3>
                <cfif structKeyExists(structRes,#getInfo.sentence#)>
                    <cfoutput>
                        <p>#getinfo.sentence#</p>
                    </cfoutput>
                </cfif>
            </cfif>
        </cfif>
    </cfloop>


    


