<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

    <cfobject component ="CF_TASK.components.newdefined" name="redirectObject">
    <cfinvoke component="#redirectObject#"
        method="sortedList" returnVariable="page">
    </cfinvoke>

    <cfinvoke component="#redirectObject#"
    method="structTextRetriever" returnVariable="structData">
    <cfinvokeargument  name="description"  value="#desc#"> 
    </cfinvoke>

<cfoutput>
    <br>
    <h5>Results - Alphabetical Order</h5><hr>
    
    </cfoutput>
    <cfloop query="page" >
    <cfif isNumeric('#page.sentence#') EQ 'NO'>
        <cfif Len('#page.sentence#') GT 3>
            <cfif structKeyExists(structData, #page.sentence#)>
                <cfif #structData["#page.sentence#" ]#  EQ 5>
                    <cfoutput>      
                       <h1 class='text-secondary'> 
                       -#page.sentence# ( #structData["#page.sentence#" ]#)          
                       </h1>

                        </cfoutput>
                        <cfelseif #structData["#page.sentence#" ]#  EQ 4>
                        <cfoutput>      
                       <h2 class='text-danger'> 
                       -#page.sentence# ( #structData["#page.sentence#" ]#)
                                
                       </h2>
                        </cfoutput>
                       <cfelseif #structData["#page.sentence#" ]#  EQ 3>
                        <cfoutput>      
                       <h5 class='text-warning'> 
                       -#page.sentence# ( #structData["#page.sentence#" ]#)
                                
                       </h5>
                        </cfoutput>
                        <cfelseif #structData["#page.sentence#" ]#  EQ 2>
                        <cfoutput>      
                       <h4 class='text-success'> 
                        -#page.sentence# ( #structData["#page.sentence#" ]#)
                                
                       </h4>
                        </cfoutput>
                        <cfelseif #structData["#page.sentence#" ]#  EQ 1>
                        <cfoutput>      
                       <h5 class='text-primary'> 
                       -#page.sentence# ( #structData["#page.sentence#" ]#)
                                
                       </h5>
                        </cfoutput>
                    </cfif>
            </cfif>
        </cfif> 
    </cfif>
    </cfloop>
   <br>

    <cfparam  name="desc">
    <cfset cnt = structCount(structData)>
    <cfset sortData = StructSort(structData,"numeric","desc")>

    <cfset newStruct = structNew()>
    <cfloop array="#sortData#" index="i">
        <cfset len=Len(#i#)>
        <cfset StructInsert(newStruct,"#i#",Len(#i#),false)>
    </cfloop>
    <cfset sortLen = StructSort(newStruct,"numeric","desc")>
    
    <h5>Result - Decreasing order of length of text </h5><hr>

    <cfoutput>
        <cfloop array="#sortLen#" index="i" >
            <cfif isNumeric('#i#') EQ 'NO'>
                <cfif Len('#i#') GT 3>
                    <cfif structKeyExists(structData, #i#)>
                            
                        <cfif #structData["#i#" ]#  EQ 5>
                        <cfoutput>      
                           <h1 class='text-secondary'> 
                           -#i# ( #structData["#i#" ]#)
                                    
                           </h1>
                            </cfoutput>
                            <cfelseif #structData["#i#" ]#  EQ 4>
                            <cfoutput>      
                           <h2 class='text-danger'> 
                           -#i# ( #structData["#i#" ]#)
                                    
                           </h2>
                            </cfoutput>
                           <cfelseif #structData["#i#" ]#  EQ 3>
                            <cfoutput>      
                           <h5 class='text-warning'> 
                           -#i# ( #structData["#i#" ]#)
                                    
                           </h5>
                            </cfoutput>
                            <cfelseif #structData["#i#" ]#  EQ 2>
                            <cfoutput>      
                           <h4 class='text-success'> 
                          -#i# ( #structData["#i#" ]#)
                                    
                           </h4>
                            </cfoutput>
                            <cfelseif #structData["#i#" ]#  EQ 1>
                            <cfoutput>      
                           <h5 class='text-primary'> 
                           -#i# ( #structData["#i#" ]#)     
                           </h5>
                            </cfoutput>
                        </cfif>
                    </cfif>
            
                </cfif>
            </cfif>
            
            </cfloop>
    </cfoutput>
    <br>
    <cfoutput>
    <h5>Result - decreasing order of count of words </h5><hr><br>
    </cfoutput>
    <cfloop array="#sortData#" index="i" >
    <cfif isNumeric('#i#') EQ 'NO'>
        <cfif #structData["#i#"]# NEQ 3>
            <cfif structKeyExists(structData, #i#)>
                <cfif #structData["#i#" ]#  EQ 5>
                    <cfoutput>      
                       <h1 class='text-secondary'> 
                       -#i# ( #structData["#i#" ]#)
                                
                       </h1>
                        </cfoutput>
                        <cfelseif #structData["#i#" ]#  EQ 4>
                        <cfoutput>      
                       <h2 class='text-danger'> 
                       -#i# ( #structData["#i#" ]#)
                                
                       </h2>
                        </cfoutput>
                       <cfelseif #structData["#i#" ]#  EQ 3>
                        <cfoutput>      
                       <h5 class='text-warning'> 
                       -#i# ( #structData["#i#" ]#)
                                
                       </h5>
                        </cfoutput>
                        <cfelseif #structData["#i#" ]#  EQ 2>
                        <cfoutput>      
                       <h4 class='text-success'> 
                      -#i# ( #structData["#i#" ]#)
                                
                       </h4>
                        </cfoutput>
                        <cfelseif #structData["#i#" ]#  EQ 1>
                        <cfoutput>      
                       <h5 class='text-primary'> 
                       -#i# ( #structData["#i#" ]#)
                                
                       </h5>
                        </cfoutput>
                    </cfif>
            </cfif>
    
        </cfif>
    </cfif>
    </cfloop>