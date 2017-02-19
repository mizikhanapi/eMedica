<%-- 
    Document   : user
    Created on : Jan 20, 2017, 11:16:15 AM
    Author     : user
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- header -->
<div w3-include-html="libraries/header.html"></div>
<!-- header -->
</head>

  <body>
<!-- menu top -->
<div w3-include-html="libraries/topMenus.html"></div>
	<!-- menu top -->

    <div class="container-fluid">
      <div class="row">       
<!-- menu side -->		
<div w3-include-html="libraries/sideMenus.html"></div>
<!-- menu side -->	
		
<!-- main -->		
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">
			<div class="row">
				<div class="col-md-12">
					<div class="thumbnail">
						<!-- Tab Menu -->
						
						<div class="tabbable-panel">
							<div class="tabbable-line">
								<ul class="nav nav-tabs ">
									<li class="active">
										<a href="#tab_default_1" data-toggle="tab">
										Assign Responsibilities To Role </a>
									</li>
									<li>
										<a href="#tab_default_2" data-toggle="tab">
										Maintain Staff Details </a>
									</li>
									<li>
										<a href="#tab_default_3" data-toggle="tab">
										Assign Roles To Staff </a>
									</li>
								</ul>
								<!-- tab content -->
								<div class="tab-content">
									<div class="tab-pane active" id="tab_default_1">
										<h4 class="text-center">Responsibilities:</h4>
										<form style="width: 500px; margin: 0 auto;">
											<div class="form-group">
												<select class="form-control">
												  <option>Roles</option>
												  <option>2</option>
												</select>
											</div>
											<div class="form-group">
												<select class="form-control">
												  <option>Modules</option>
												  <option>2</option>
												</select>
											</div>
											
											<button class="btn btn-primary btn-block" type="button"><i class=" fa fa-check"></i> Assign</button>
											
										</form>
									</div>
									<div class="tab-pane" id="tab_default_2">
										<h4>Search Lookup Detail
											<span class="pull-right">
												<a data-toggle="modal" data-id="1" data-target="#detail" alt="Add Items" data-toggle="tooltip" data-placement="top" title="Add Items"><i class=" fa fa-plus" style=" padding-right: 5px;"></i></a>
											</span>
										</h4>
										
										<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; ">
											<thead>
												<th>User ID</th>
												<th>Staff Name</th>
												<th>Role</th>
												<th>Health Facility Code</th>
												<th>Discipline</th>
												<th>Sub-Discipline</th>
												<th>Update</th>
												<th>Delete</th>
											</thead>
													<tbody>
                                                                                                            <% String sql = "SELECT a.user_id, a.user_name, a.occupation_code, a.health_facility_code, b.discipline_code, b.subdiscipline_code " + 
                                                                                                                    "FROM adm_user AS a join adm_user_access_role AS b using (user_id) ";
                                                                                                                Conn conn = new Conn();
                                                                                                               ArrayList<ArrayList<String>> dataStaff = conn.getData(sql); 
                                                                                                               
                                                                                                               int size = dataStaff.size();
                                                                                                               for(int i=0; i<size; i++){
                                                                                                               %>
                                                                                                               <tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail">
                                                                                                                   <td><%= dataStaff.get(i).get(0) %></td>
															<td><%=dataStaff.get(i).get(1) %></td>
															<td><%=dataStaff.get(i).get(2)%></td>
															<td><%=dataStaff.get(i).get(3)%></td>
															<td><%=dataStaff.get(i).get(4)%></td>
															<td><%=dataStaff.get(i).get(5)%></td>
															<td><a href="#" data-toggle="modal" data-target="#detail"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: ;color: #337ab7;"></i></a></td>
															<td><a href="#"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: ;color: #d9534f;"></i></a></td>
														</tr>
                                                                                                            
                                                                                                            
                                                                                                            <%
                                                                                                               
                                                                                                               }
                                                                                                            %>
														<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail">
															<td>A001</td>
															<td>DR. SURAYA</td>
															<td>DOCTOR</td>
															<td>Klinik UTeM Induk</td>
															<td>-</td>
															<td>-</td>
															<td><a href="#" data-toggle="modal" data-target="#detail"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: ;color: #337ab7;"></i></a></td>
															<td><a href="#"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: ;color: #d9534f;"></i></a></td>
														</tr>
														<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail">
															<td>A001</td>
															<td>DR. SURAYA </td>
															<td>DOCTOR</td>
															<td>Klinik UTeM Induk</td>
															<td>-</td>
															<td>-</td>
															<td><a href="#" data-toggle="modal" data-target="#detail"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: ;color: #337ab7;"></i></a></td>
															<td><a href="#"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: ;color: #d9534f;"></i></a></td>
														</tr>
														<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail">
															<td>A001</td>
															<td>DR. SURAYA</td>
															<td>DOCTOR</td>
															<td>Klinik UTeM Induk</td>
															<td>-</td>
															<td>-</td>
															<td><a href="#" data-toggle="modal" data-target="#detail"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: ;color: #337ab7;"></i></a></td>
															<td><a href="#"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: ;color: #d9534f;"></i></a></td>
														</tr>
													</tbody>
										</table>
									</div>
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
							<td>
							<select class="form-control">
								<option>Select Health Facility</option>
								<option>2</option>
							</select>
							</td>
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
							<td>
							<select class="form-control">
								<option>Occupation</option>
								<option>2</option>
							</select>
							</td>
						  </tr>
						  <tr>
							<td>Birth Date:</td>
							<td><input type="date" class="form-control" placeholder="dd-mm-yyyy"></td>
						  </tr>
						  <tr>
							<td>Gender:</td>
							<td>
							<select class="form-control">
								<option>Select Gender</option>
								<option>2</option>
							</select>
							</td>
							   
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
							<td>
							<select class="form-control">
								<option>Select Role</option>
								<option>2</option>
							</select>
							</td>
						  </tr>
						  <tr>
							<td>Discipline:</td>
							<td>
							<select class="form-control">
								<option>Select Discipline</option>
								<option>2</option>
							</select>
							</td>
						  </tr>
						  <tr>
							<td>Sub-Discipline:</td>
							<td>
							<select class="form-control">
								<option>Select Sub-Discipline</option>
								<option>2</option>
							</select>
							</td>
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
							<td>
							<select class="form-control">
								<option>1</option>
								<option>2</option>
							</select>
							</td>
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
	w3IncludeHTML();
	</script>
	
</body></html>
