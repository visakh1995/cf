<html>
    <head>
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 25</h3>
                    <cfif structKeyExists(form,'Submit')>
                        <cfset description = form.description>
                        <cfobject component ="CF_TASK.components.newdefined" name="redirectObject">
                        <cfinvoke component="#redirectObject#"
                        method="structTextRetriever" returnVariable="structResults">
                        <cfinvokeargument  name="description"  value="#description#"> 
                        </cfinvoke>
                        <cfdump var =#structResults#>
                        <cfset data = structKeyList(structResults)>
                        <cfloop list= #data# index="i">
                            <cfquery name = "insertWords" datasource="cruddb">
                                INSERT INTO coldfusiion.words_table(sentence)
                                VALUES(
                                <cfqueryparam value="#i#">
                                 )
                            </cfquery>
                        </cfloop>
                        <cflocation url="showPage.cfm?desc='#form.description#">
                    </cfif>
                    <cfform name="cftask_1" enctype="multipart/form-data" action="">
                        <br><br><br>
                        <div class="form-controls">
                            <cftextarea rows="7" cols="34" class="texts" 
                            name="description"  placeholder=""/>
                        </div><br><br>
                        <div class="form-btn">
                            <cfinput type="submit" class="btn" name="Submit">
                        <div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
</html>