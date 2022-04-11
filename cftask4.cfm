
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
                    <p>Today's Date : 
                    <cfoutput>
                     #DateFormat(Now())#
                    </cfoutput>
                    </p><br>
                    <p>Current Month In Numeric :
                        <cfoutput>
                            #DateFormat(Now(),"mm")#
                        </cfoutput>
                    </p><br>
                    <p>Current Month In Word : 
                        <cfoutput>
                            #DateFormat(Now(),"mmmm")#
                        </cfoutput>
                    </p><br>
                    <p>Last Friday :
                    <cfset today = dayofweek(now())/>
                        <cfif today eq 7>
                            <span>
                                <cfoutput>
                                #dateFormat(dateAdd("d",-1,now()))#
                                </cfoutput>
                            </span>
                        <cfelse>
                            <span>
                                <cfoutput>
                                #dateformat(dateAdd ("d",-(1+today),now()))#</span>
                                </cfoutput>
                        </cfif>

                    </p><br>
                    <p>Last Day Of Month: 
                        <cfset dStartDate = createDate(year(now()), month(now()), 1 ) />
                        <cfset dEndDate = dateAdd('d', -1, dateAdd('m', 1, dStartDate )) />                        
                        <cfoutput>
                            #DateFormat(dEndDate,"dd/mm/yyyy")#
                        </cfoutput>
                    </p><br>
                    <p>Last Five Days: </p><br>

                        <cfset startDate = Now()-1>
                        <cfset endDate = Now()-5>
                        <cfloop from="#startDate#" to="#endDate#" index="i" step="-1">
                            <cfif DateFormat(i,"dddd") eq "Monday">
                                <p style="color:green">
                                    <cfoutput>
                                        #DateFormat(i,"dd-mmm-yyyy -dddd")#
                                    </cfoutput>
                                </p>
                            <cfelseif DateFormat(i,"dddd") eq "Tuesday">
                                <p style="color:orange">
                                    <cfoutput>
                                        #DateFormat(i,"dd-mmm-yyyy -dddd")#
                                    </cfoutput>
                                </p>
                            <cfelseif DateFormat(i,"dddd") eq "Wednesday">
                                <p style="color:yellow">
                                    <cfoutput>
                                        #DateFormat(i,"dd-mmm-yyyy -dddd")#
                                    </cfoutput>
                                </p>
                            <cfelseif DateFormat(i,"dddd") eq "Thursday">
                                <p style="color:#fff">
                                    <cfoutput>
                                        #DateFormat(i,"dd-mmm-yyyy -dddd")#
                                    </cfoutput>
                                </p>
                            
                            <cfelseif DateFormat(i,"dddd") eq "Friday">
                                <p style="color:blue">
                                    <cfoutput>
                                        #DateFormat(i,"dd-mmm-yyyy -dddd")#
                                    </cfoutput>
                                </p>
                            <cfelseif DateFormat(i,"dddd") eq "Saturday">
                                <p style="color:red">
                                    <cfoutput>
                                        #DateFormat(i,"dd-mmm-yyyy -dddd")#
                                    </cfoutput>
                                </p>
                            <cfelseif DateFormat(i,"dddd") eq "Sunday">
                                <p style="color:red">
                                    <cfoutput>
                                        #DateFormat(i,"dd-mmm-yyyy -dddd")#
                                    </cfoutput>
                                </p>
                            </cfif>
                     
                        </cfloop>
                </div>
            </div>
        </section>
    </body>
</html>