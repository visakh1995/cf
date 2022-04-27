
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>CF TASKS</title>
    </head>
    <body>
        <section>
            <div class="main-container">
                <div class="card">
                    <h3 class="heading">CF TASK 4 CALENDER</h3>
                    <cfoutput>
                        <br>
                        <p><b>Today's Date : #DateFormat(Now())#</b></p><br>
                        <p><b>Current Month In Numeric :#DateFormat(Now(),"mm")#</b></p><br>
                        <p><b>Current Month In Word : #DateFormat(Now(),"mmmm")#</b></p><br>

                        <p><b>Last Friday :
                        <cfset today = dayofweek(now())/>
                            <cfif today eq 7>
                                <span>#dateFormat(dateAdd("d",-1,now()))#</span>
                            <cfelse>
                                <span>#dateformat(dateAdd ("d",-(1+today),now()))#</span></b>
                            </cfif>
                        </p><br>

                        <p><b>Last Day Of Month: 
                            <cfset dStartDate = createDate(year(now()), month(now()), 1 ) />
                            <cfset dEndDate = dateAdd('d', -1, dateAdd('m', 1, dStartDate )) />                        
                            #DateFormat(dEndDate,"dd/mm/yyyy")#
                            </b></p><br><br>

                        <p><b>Last Five Days: </p><br><hr><br>
                            <cfset startDate = Now()-1>
                            <cfset endDate = Now()-5>
                            
                        <cfloop from="#startDate#" to="#endDate#" index="i" step="-1">
                            <cfif DateFormat(i,"dddd") eq "Monday">
                                <p class="col-green"><b>
                                    #DateFormat(i,"dd-mmm-yyyy -dddd")#</b>
                                </p>
                            <cfelseif DateFormat(i,"dddd") eq "Tuesday">
                                <p class="col-orange"><b>
                                    #DateFormat(i,"dd-mmm-yyyy -dddd")#
                                </b></p>

                            <cfelseif DateFormat(i,"dddd") eq "Wednesday">
                                <p class="col-yellow"><b>
                                    #DateFormat(i,"dd-mmm-yyyy -dddd")#
                                </b></p>

                            <cfelseif DateFormat(i,"dddd") eq "Thursday">
                                <p class="col-zero"><b>
                                    #DateFormat(i,"dd-mmm-yyyy -dddd")#
                                </b></p>
                                
                            <cfelseif DateFormat(i,"dddd") eq "Friday">
                                <p class="col-blue"><b>       
                                    #DateFormat(i,"dd-mmm-yyyy -dddd")#
                                </b></p>

                            <cfelseif DateFormat(i,"dddd") eq "Saturday">
                                <p class="col-red"><b>
                                    #DateFormat(i,"dd-mmm-yyyy -dddd")#            
                                </b></p>

                            <cfelseif DateFormat(i,"dddd") eq "Sunday">
                                <p class="col-red"><b>
                                    #DateFormat(i,"dd-mmm-yyyy -dddd")#
                                </b></p>
                            </cfif>
                        </cfloop>
                    </cfoutput>
                </div>
            </div>
        </section>
    </body>
</html>