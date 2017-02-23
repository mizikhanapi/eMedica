<nav class="navbar navbar-fixed-top" style="background: #F9F8F6; border-bottom: 1px solid #ccc;">
      <div class="container-fluid">
	  <div class="row">
        <div class="navbar-header col-md-2" style="border-right: 1px solid #ccc;">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
            <a id="Welcome" class="navbar-brand" href="dashboard.jsp">Welcome  <%= session.getAttribute("USER_NAME")%></a>
        </div>
		
        <div id="navbar" class="navbar-collapse collapse">
		<ul class="nav navbar-nav navbar-left back" style="">
            <li><a href="facility.jsp" title="Back"><i class=" fa fa-caret-left"></i></a></li>
          </ul>
		<div class="nav navbar-nav navbar-left">
            <div style="padding: 10px 20px; display: block; font-size: 22px;">
				<span style="font-size: 22px;">Dashboard Main Menu</span>
			</div>
		</div>

		  <ul class="nav navbar-nav navbar-right logout" style="">
            <li><a href="destroySession.jsp" title="Log Out"><i class=" fa fa-power-off"></i></a></li>
          </ul>
		  
        </div>
		
		</div>
		
	 </div>
    </nav>