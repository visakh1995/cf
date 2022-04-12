<cfif isDefined("url.imgID")>
    <cfquery name='img_details' datasource='cruddb'>
        SELECT *
        FROM coldfusiion.cftask_image
        WHERE id="#url.imgID#" 
     </cfquery>
</cfif>
<div class="card">
<h3>IMAGE DETAILS</h3>

    <cfoutput query = img_details>
    <tr>
        <p>IMAGE ID : #id#</p>
        <p>NAME : #name#</p>
        <p>DESCRIPTION :#description#</p>
        <p>IMAGE : #image#</p>

    </cfoutput>
</div>
