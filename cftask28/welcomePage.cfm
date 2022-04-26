<cfinvoke component = "CF_TASK.components.userDefined"
     method = "retrievePages"
     returnVariable = "allpages">
</cfinvoke>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/uttilities.css"type="text/css">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <title>CMS</title>
    </head>
    <body>
      <nav class="sidebar">
        <div class="logo-content">
            <div class="logo">
                <i class='bx bxl-adobe'></i>
                <div class="logo-name">cms site</div>
            </div>
            <i class='bx bx-menu'></i>
        <div>
          <cfapplication name="login" sessionTimeout="#CreateTimeSpan(0, 0, 60, 60)#"
          sessionManagement="yes">
          <cfif Session.Credentials.role eq 1 OR  Session.Credentials.role eq 2>
        <div class="nav_list">
            <ul class="menu-links">
                <li class="nav-link">
                    <a href="createPage.cfm">
                    <i class='bx bx-grid-alt'></i>
                    <span class="text nav-text">Create Page</span>
                    </a>
                </li>
            </ul>
        </div>
       </cfif>
        <br><br><br><br><br><br>
        <br><br><br><br><br><br>
        <br><br><br><br><br><br>
        <div class="profile_content">
            <div class="profile">
                <div class="profile_details">
                    <div class="name_job">
                      <cfoutput>
                      <cfapplication name="login" sessionTimeout="#CreateTimeSpan(0, 0, 60, 60)#"
                      sessionManagement="yes">
                        <div class="session_name">#Session.Credentials.username#</div><br>
                        <button class="logout" name="logout"><a href="action.cfm?logout">
                          <i class='bx bx-log-out' id="log_out">logout</i>
                        </a></button>
                      </cfoutput>
                    </div>
                </div>
            </div>
        </div>
      </nav>
      
        <div class="main-container">
            <table>
                <thead>
                  <tr>
                    <th class="primary" scope="col">Page ID</th>
                    <th>Page name</th>
                    <th>Page description</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  <cfoutput query = allpages>
                    <tr>
                      <th scope="row">#pageId#</th>
                      <td><a href="pageDetails.cfm?detailsID=#pageId#">#pageName#</a></td>
                      <td>#pageDescription#</td>
                      <td>
                        <cfapplication name="login" sessionTimeout="#CreateTimeSpan(0, 0, 60, 60)#"
                        sessionManagement="yes">
                        <cfif Session.Credentials.role eq 1 OR  Session.Credentials.role eq 2>
                            <button class="button-cms tab"><a href="update.cfm?ID=#pageId#">edit</a></button>
                            <button class="button-cms"><a href="action.cfm?DELETE=#pageId#">delete</a></button>
                        <cfelseif Session.Credentials.role eq 3>
                            <button class="button-cms">ACTIVE</button>
                        </cfif>
                      </td>
                    </tr>
                  </cfoutput>
                </tbody>
              </table>
        </div>
    </body>
</html>