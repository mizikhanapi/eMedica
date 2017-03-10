<%@page import="Config.Config"%>		
<div class="col-sm-3 col-md-2 sidebar">
    <div class="brand"></div>
    <!-- logo -->
		<div class="logo">
		Welcome to <span>iHIS</span>
		</div>
		<!-- logo -->
		
		<!-- profile Sidebar -->
		<div class="profile">
				<div class="profile-userpic">
					<img src="../assets/profile.jpg" class="img-responsive" alt="">
				</div>
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						Marcus Doe
					</div>
					<div class="profile-usertitle-job">
						Developer
					</div>
				</div>
				<!-- SIDEBAR BUTTONS -->
				<div class="profile-userbuttons">
					<button type="button" class="btn btn-success btn-sm">Manage Account</button>
				</div>
		</div>
    <ul id="menu-content" class="nav nav-sidebar">
        <!-- // menu tanpa dropdown -->
        <li>
            <a  href="index.jsp">
                <i class="fa fa-adress-card-o fa-lg"></i> Outpatient Registration
            </a>
        </li>

<!--        <li>
            <a href="queue.jsp">
                <i class="fa fa-ambulance-o fa-lg"></i> List of Queue
            </a>
        </li>-->

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
