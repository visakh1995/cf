

<cfset myQueryOne = queryNew("id,Name,Email","Integer,varchar,varchar",
[
    {id = 1,Name ="One",Email ="ab@mail.com"},
    {id = 2,Name ="Two",Email ="stor@yahoo.com"},
    {id = 3,Name ="Three",Email ="resiliance@redops.com"}
])>
<cfdump var = #myQueryOne#>



<cfscript>
    myQuery=QueryNew("Country,Capital","varchar,varchar");
    /*Add array values in column*/
    myColumnValues=ArrayNew(1);
    myColumnValues[1]=320;
    myColumnValues[2]=250;
    myColumnValues[3]=200;
   QueryAddColumn(myQuery,"Population_millions","varchar",myColumnValues);// Add column Population_millions
    WriteDump(myQuery);
</cfscript>

<cfset myQuerys = QueryNew("ID,Name","Integer,varchar")>
<cfset myArray = arrayNew(1)>
<cfset myArray[1] = "abc@yahoomail.com">
<cfset myArray[2] = "tabloid@yahoo.com">
<cfset myArray[3] = "prots@sturdyn.com">
<cfset QueryAddColumn(myQuerys,"Email","varchar",myArray)>
<cfdump var = "#myQuerys#">


<cfset myNewQuery = QueryNew("ID,Name,Email","Integer,varchar,varchar")>
<cfset myData     = structNew()>
<cfset myData     = {ID = 1, Name :'shawn',Email:'arb@gmail.com'} >
<cfset store = QueryAddRow(myNewQuery,myData)>
<cfset outputs = queryGetRow(myNewQuery, 1)> 
<cfset var = #outputs#>