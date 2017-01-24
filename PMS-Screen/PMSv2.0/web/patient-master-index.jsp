<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- header -->
<div id="header"></div>
<!-- header -->
</head>

<body>
<!-- menu top -->
<div id="topMenus"></div>
<!-- menu top -->

<div class="container-fluid">
  <div class="row"> 
    <!-- menu side -->
    <div id="sideMenus"></div>
    <!-- menu side --> 
    
    <!-- main -->
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">
      	  
      <div class="row">
        <div class="col-md-12">
          <div class="thumbnail">
            <h4>Patient Master Index</h4>
            
            <!-- Tab Menu -->
            
            <div class="tabbable-panel">
              <div class="tabbable-line">
                <ul class="nav nav-tabs ">
                  <li class="active"> <a href="#tab_default_1" data-toggle="tab"> Patient Information </a> </li>
                  <li> <a href="#tab_default_2" data-toggle="tab"> Medical Information </a> </li>
                  <li> <a href="#tab_default_3" data-toggle="tab"> Patient Contact </a> </li>
                </ul>
                <!-- tab content -->
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_default_1">
                    <h4 class="text-center">Patient Information</h4>
                    <form style=" margin: 0 auto;" class="form-horizontal">
                      <!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                        <div class="col-md-4">
                          <input id="textinput" name="textinput" type="text" placeholder="Eg: Mobile x-ray" class="form-control input-md">
                        </div>
                      </div>
					  
					  <!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Temporary PMI No.</label>
                        <div class="col-md-4">
                          <input id="textinput" name="textinput" type="text" placeholder="Eg: Mobile x-ray" class="form-control input-md">
                        </div>
                      </div>
                      
                      <!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Name</label>
                        <div class="col-md-4">
                          <input id="textinput" name="textinput" type="text" placeholder="Eg: Mobile x-ray" class="form-control input-md">
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Title</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select Title</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
                      
                      <!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                        <div class="col-md-4">
                          <input id="textinput" name="textinput" type="text" placeholder="Eg: Mobile x-ray" class="form-control input-md">
                        </div>
                      </div>
                      
                      <!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Old IC No.</label>
                        <div class="col-md-4">
                          <input id="textinput" name="textinput" type="text" placeholder="Eg: Mobile x-ray" class="form-control input-md">
                        </div>
                      </div>
                      
                      <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select ID Type</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
                      
                      <!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Identification No.</label>
                        <div class="col-md-4">
                          <input id="textinput" name="textinput" type="text" placeholder="Eg: Mobile x-ray" class="form-control input-md">
                        </div>
                      </div>
				  
				  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Eligibility Category</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select Eligibility Category</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					<!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Eligibility Type</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select Eligibility Type</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Date of Birth</label>
                        <div class="col-md-4">
                          <input id="textinput" name="textinput" type="date" placeholder="Eg: Mobile x-ray" class="form-control input-md">
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Gender</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select Gender</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Martial Status</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select Martial Status</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Race</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select Race</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Nationality</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select Nationality</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Religion</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select Nationality</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
                      <button class="btn btn-primary btn-lg btn-block" type="button"> Next</button>
                    </form>
                  </div>
				  
				  
                  <div class="tab-pane" id="tab_default_2">
                    <h4 class="text-center">Medical Information</h4>
                    <form class="form-horizontal">
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Blood Type</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select ID Type</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Blood Rhesus</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select ID Type</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Allergy</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select ID Type</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Chronic Disease</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select Chronic Disease</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Organ Donor</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Select Organ Donor Status</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
                      <button class="btn btn-primary btn-lg btn-block" type="button"> Next</button>
                    </form>
                  </div>
				  
				  
                  <div class="tab-pane" id="tab_default_3">
                    <h4 class="text-center">Patient Contact</h4>
                    <form class="form-horizontal">
					<div class="row">
					<div class="col-md-6">
					<!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Home Address</label>
                        <div class="col-md-4">
                          <input id="textinput" name="textinput" type="text" placeholder="Eg: Mobile x-ray" class="form-control input-md">
                        </div>
                      </div>
					
					<!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">District</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Normal</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Town</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Normal</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Postcode</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Normal</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">State</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Normal</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Country</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Normal</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Phone No.(Home)</label>
                        <div class="col-md-4">
                          <input id="textinput" name="textinput" type="text" placeholder="Eg: Mobile x-ray" class="form-control input-md">
                        </div>
                      </div>
					  
					  </div>
					  <div class="col-md-6">
					  
					  <!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Postal Address</label>
                        <div class="col-md-4">
                          <input id="textinput" name="textinput" type="text" placeholder="Eg: Mobile x-ray" class="form-control input-md">
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">District</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Normal</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Town</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Normal</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Postcode</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Normal</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">State</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Normal</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Select Basic -->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Country</label>
                        <div class="col-md-4">
                          <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">Normal</option>
                            <option value="2">Inactive</option>
                          </select>
                        </div>
                      </div>
					  
					  <!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Phone No.(Home)</label>
                        <div class="col-md-4">
                          <input id="textinput" name="textinput" type="text" placeholder="Eg: Mobile x-ray" class="form-control input-md">
                        </div>
                      </div>
					  
					  </div>
					  </div>
					  
					  <div class="text-center">
						  <button class="btn btn-primary btn-lg " type="button"> Register</button>
						  <button class="btn btn-default btn-lg " type="button"> Appointment List</button>
						  <button class="btn btn-default btn-lg " type="button"> Clear</button>
					  </div>
					</form>
                  </div>
                </div>
              </div>
            
            <!-- Tab Menu --> 
            
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- main --> 
  
</div>
</div>

<!-- Modal Detail -->
<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
        <h3 class="modal-title" id="lineModalLabel">Form Of Staff</h3>
      </div>
      <div class="modal-body"> 
        
        <!-- content goes here -->
        <form class="" >
          <div class="row">
            <div class="col-md-6">
              <table class="table table-user-information">
                <tbody>
                  <tr>
                    <td>User ID:</td>
                    <td><input type="text" class="form-control" placeholder="User ID"></td>
                  </tr>
                  <tr>
                    <td>Health Facility Code:</td>
                    <td><select class="form-control">
                        <option>Select Health Facility</option>
                        <option>2</option>
                      </select></td>
                  </tr>
                  <tr>
                    <td>Password:</td>
                    <td><input type="password" class="form-control" placeholder="Password"></td>
                  </tr>
                  <tr>
                    <td>Re-enter Password:</td>
                    <td><input type="password" class="form-control" placeholder="Re-enter Password"></td>
                  </tr>
                  <tr>
                    <td>Full Name:</td>
                    <td><input type="text" class="form-control" placeholder="Full Name"></td>
                  </tr>
                  <tr>
                    <td>Occupation:</td>
                    <td><select class="form-control">
                        <option>Occupation</option>
                        <option>2</option>
                      </select></td>
                  </tr>
                  <tr>
                    <td>Birth Date:</td>
                    <td><input type="date" class="form-control" placeholder="dd-mm-yyyy"></td>
                  </tr>
                  <tr>
                    <td>Gender:</td>
                    <td><select class="form-control">
                        <option>Select Gender</option>
                        <option>2</option>
                      </select></td>
                  </tr>
                  <tr>
                    <td>IC No:</td>
                    <td><input type="text" class="form-control" placeholder="IC No."></td>
                  </tr>
                  <tr>
                    <td>Home Phone No.:</td>
                    <td><input type="text" class="form-control" placeholder="Home Phone No."></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="col-md-6">
              <table class="table table-user-information">
                <tbody>
                  <tr>
                    <td>Office Phone No.:</td>
                    <td><input type="text" class="form-control" placeholder="Office Phone No."></td>
                  </tr>
                  <tr>
                    <td>Mobile Phone No.:</td>
                    <td><input type="text" class="form-control" placeholder="Mobile Phone No."></td>
                  </tr>
                  <tr>
                    <td>Email:</td>
                    <td><input type="email" class="form-control" placeholder="example@mail.com"></td>
                  </tr>
                  <tr>
                    <td>Role:</td>
                    <td><select class="form-control">
                        <option>Select Role</option>
                        <option>2</option>
                      </select></td>
                  </tr>
                  <tr>
                    <td>Discipline:</td>
                    <td><select class="form-control">
                        <option>Select Discipline</option>
                        <option>2</option>
                      </select></td>
                  </tr>
                  <tr>
                    <td>Sub-Discipline:</td>
                    <td><select class="form-control">
                        <option>Select Sub-Discipline</option>
                        <option>2</option>
                      </select></td>
                  </tr>
                  <tr>
                    <td>Start Date:</td>
                    <td><input type="text" class="form-control" placeholder="DD-MM-YYYY"></td>
                  </tr>
                  <tr>
                    <td>End Date:</td>
                    <td><input type="text" class="form-control" placeholder="DD-MM-YYYY"></td>
                  </tr>
                  <tr>
                    <td>Room No.:</td>
                    <td><select class="form-control">
                        <option>1</option>
                        <option>2</option>
                      </select></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </form>
        <!-- content goes here --> 
      </div>
      <div class="modal-footer">
        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
          <div class="btn-group" role="group">
            <button type="submit" class="btn btn-success btn-block btn-lg" role="button">Add</button>
          </div>
          <div class="btn-group btn-delete hidden" role="group">
            <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
          </div>
          <div class="btn-group" role="group">
            <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Update</button>
          </div>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- Modal --> 

<!-- Bootstrap core JavaScript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<!-- Bootstrap core JavaScript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script src="http://www.w3schools.com/lib/w3data.js"></script> 
<script>
	//w3IncludeHTML();
        $( "#header" ).load( "libraries/header.jsp" );
        $( "#topMenus" ).load( "libraries/topMenus.html" );
        $( "#sideMenus" ).load( "libraries/sideMenus.html" );
	</script>
</body>
</html>