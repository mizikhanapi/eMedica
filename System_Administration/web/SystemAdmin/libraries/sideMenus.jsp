<%-- 
    Document   : sideMenus
    Created on : Feb 7, 2017, 10:18:19 AM
    Author     : user
--%>

<div class="col-sm-3 col-md-2 sidebar">
    <div class="brand">Brand Logo</div>
    <ul id="menu-content" class="nav nav-sidebar">
        <!-- // menu tanpa dropdown -->
        <li>
            <a href="Lookup-Maintenance.jsp">
                <i class="fa fa-search fa-lg"></i> Lookup Code Maintenance
            </a>
        </li>
        <li>
            <a href="User_Administration_Maintenance.jsp">
                <i class="fa fa-users fa-lg"></i> Maintain User Administration
            </a>
        </li>
        <li  data-toggle="collapse" data-target="#cis" class="collapsed">
            <a href="#"><i class="fa fa-code fa-lg"></i> CIS Code Maintenance <span class="arrow"></span></a>
            <ul class="sub-menu collapse" id="cis">
                <li><a href="">Subjective</a></li>
                <li><a href="CIS.html">Objective</a></li>
                <li><a href="">Assessment</a></li>
                <li><a href="">Plan</a></li>


            </ul>

        </li>

        <li>
            <a href="queue_1.html">
                <i class="fa fa-files-o fa-lg"></i> Maintain Queue
            </a>
        </li>
        
         <li>
            <a href="Health_Facility_Maintenance.jsp">
                <i class="fa fa-hospital-o fa-lg"></i> Health Facility Code Maintenance
            </a>
        </li>
        
         <li>
            <a href="System_Maintenance.jsp">
                <i class="fa fa-desktop fa-lg"></i> System Maintenance
            </a>
        </li>

        <!-- // menu tanpa dropdown -->

        <!-- Menu with dropdown -->
        <!-- <li  data-toggle="collapse" data-target="#Subjective" class="collapsed active">
          <a href="#"><i class="fa fa-gift fa-lg"></i> Subjective <span class="arrow"></span></a>
        </li>
        <ul class="sub-menu collapse" id="Subjective">
        <li><a data-toggle="modal" data-target="#squarespaceModal" href="">Complaints</a></li>
        </ul> -->
        <!-- Menu with dropdown -->
    </ul>
</div>
