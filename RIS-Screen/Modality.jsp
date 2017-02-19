<%-- 
    Document   : Modality
    Created on : Jan 14, 2017, 1:42:27 PM
    Author     : Huda Athirah
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>
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
										Master Index Lookup Table </a>
									</li>
									<li>
										<a href="#tab_default_2" data-toggle="tab">
										Detail Lookup Table </a>
									</li>
								</ul>
								<!-- tab content -->
								<div class="tab-content">
									<div class="tab-pane active" id="tab_default_1">
										<h4>Master References</h4>
										
										<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;">
											<thead>
												<th>Master Reference Code</th>
												<th>Description</th>
											</thead>
													<tbody>
														<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#index">
															<td>0001</td>
															<td>Country</td>
														</tr>
														<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#index">
															<td>0002</td>
															<td>States</td>
														</tr>
														<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#index">
															<td>0003</td>
															<td>Town</td>
														</tr>
														<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#index">
															<td>0004</td>
															<td>Country</td>
														</tr>
														<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#index">
															<td>0005</td>
															<td>Country</td>
														</tr>
													</tbody>
										</table>
									</div>
									<div class="tab-pane" id="tab_default_2">
										<h4>Search Lookup Detail<small class="pull-right">*This Master Code for Religion</small></h4>
										
										<form class="" >
											<div id="custom-search-input">
												<div class="input-group ">
													<input type="text" class="  search-query form-control" placeholder="Master Reference Code" />
													<span class="input-group-btn">
														<button class="btn btn-default" type="button">
															<i class=" fa fa-search"></i>
														</button>
													</span>
												</div>
											</div>
										</form>
										<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; border-top: none;">
											<thead>
												<th>Master Reference Code</th>
												<th>Detail Reference Code</th>
												<th>Description</th>
											</thead>
													<tbody>
														<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail">
															<td>0001</td>
															<td>01</td>
															<td>Islam</td>
														</tr>
														<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail">
															<td>0002</td>
															<td>02</td>
															<td>Kristian</td>
														</tr>
														<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail">
															<td>0003</td>
															<td>03</td>
															<td>Hindu</td>
														</tr>
														<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail">
															<td>0004</td>
															<td>04</td>
															<td>Budha</td>
														</tr>
														<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail">
															<td>0005</td>
															<td>05</td>
															<td>Country</td>
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

<!-- Modal Index -->
<div class="modal fade" id="index" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
			<h3 class="modal-title" id="lineModalLabel">Master References</h3>
		</div>
		<div class="modal-body">
			
            <!-- content goes here -->
						<form class="" >
							<div id="custom-search-input">
								<div class="input-group " style="margin-bottom: 20px;">
									<input type="text" class="search-query form-control" placeholder="Master Reference Code" />
									<span class="input-group-btn">
										<button class="btn btn-default" type="button">
											<i class="fa fa-plus fa-lg"></i>
										</button>
									</span>
								</div>
								<textarea class="form-control" placeholder="Description" rows="3"></textarea>
							</div>
						</form>
			<!-- content goes here -->
		</div>
		<div class="modal-footer">
			<div class="btn-group btn-group-justified" role="group" aria-label="group button">
				<div class="btn-group" role="group">
					<button type="submit" class="btn btn-success btn-block btn-lg" role="button">Save</button>
				</div>
				<div class="btn-group btn-delete hidden" role="group">
					<button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Delete</button>
				</div>
			</div>
			</form>
		</div>
	</div>
  </div>
</div>
<!-- Modal -->

<!-- Modal Detail -->
<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
			<h3 class="modal-title" id="lineModalLabel">Details</h3>
		</div>
		<div class="modal-body">
			
            <!-- content goes here -->
						<form class="" >
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Master Reference Code">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Detail Reference Code">
							</div>
							<textarea class="form-control" placeholder="Detail Description" rows="3"></textarea>
						</form>
			<!-- content goes here -->
		</div>
		<div class="modal-footer">
			<div class="btn-group btn-group-justified" role="group" aria-label="group button">
				<div class="btn-group" role="group">
					<button type="submit" class="btn btn-success btn-block btn-lg" role="button">Save</button>
				</div>
				<div class="btn-group btn-delete hidden" role="group">
					<button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Delete</button>
				</div>
			</div>
			</form>
		</div>
            <script>
                                $(document).ready(function () {
                                   $("#viewMDpage").load("viewMD.jsp");
                                   
                                   $("#btn_add").click(function () {
                                       var modality_cd = $("#modality_cd").val();
                                       var modality_name = $("#modality_name").val();
                                       var status = $("#status").val();
                                       
                                    if(modality_cd === ""){ 
                                        alert("Complete The Fields"); 
                                        return false; 
                                    }
                                    if(modality_name === ""){ 
                                        alert("Complete The Fields");  
                                        return false; 
                                    }
                                    if(status === ""){ 
                                        alert("Complete The Fields"); 
                                        return false; 
                                    }
                                    
                                    else{
                                       
                                       $.ajax({
                                           url: "tDetailInsert.jsp",
                                           type: "post",
                                           data: {
                                               modality_cd: modality_cd,
                                               modality_name: modality_name,
                                               status: status
                                           },
                                           timeout: 10000,
                                           success: function(data) {
                                                var d = data.split("|");
                                                if (d[1] == '1') {
                                                    $("#viewMDpage").load("viewMD.jsp");
                                                    $("#modality_cd").val("");
                                                    $("#modality_name").val("");
                                                    $("#status").val("Active");
                                                } else {
                                                    alert("Save failed!");
                                                }
                                           },
                                           error: function(err) {
                                               
                                           }
                                       });
                                   }});
                                });
                            </script>  
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
