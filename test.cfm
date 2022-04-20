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
            
            <div class="nav_list">
                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="">
                        <i class='bx bx-grid-alt'></i>
                        <span class="text nav-text">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="">
                        <i class='bx bx-grid-alt'></i>
                        <span class="text nav-text">User</span>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="profile_content">
                <div class="profile">
                    <div class="profile_details">
                        <div class="name_job">
                            <div class="name">name</div>
                            <div class="job">job</div>
                        </div>
                    </div>
                    <i class='bx bx-log-out' id="log_out"></i>
                </div>
            </div>

            <section>
                <div class="main-container">
                    <cfoutput>      
                            <cfapplication name="login" sessionTimeout="#CreateTimeSpan(0, 0, 60, 60)#"
                            sessionManagement="yes">
                            <h3 class="welcome-heading">welcome
                             <span>#Session.credentials.userName#</span><h3> 
                    </cfoutput>
                    <button class="logout" name="logout"><a href="action.cfm?logout">logout</a></button>
    
                </div>
            </section>



        </nav>



    </body>
</html>