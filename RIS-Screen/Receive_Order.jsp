<%-- 
    Document   : Receive_order
    Created on : Feb 19, 2017, 5:33:19 PM
    Author     : Huda Athirah
--%>

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
						<h4>
						Receive Order
						<span class="pull-right">
						<a href="#"  data-toggle="tooltip" data-placement="top" title="Refresh"><i class=" fa fa-refresh" style=" padding-right: 5px;"></i></a>
						</span>	
						</h4>
						<form class="" >
                                                    <div class="radios" style="margin: 5px 0;">
						    <label style="padding-right: 5px;">Search by:</label>
							<label class="radio-inline">
							  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> PMI Number
							</label>
							<label class="radio-inline">
							  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> IC NO
							</label>
							<label class="radio-inline">
							  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Name 
							</label>
						  </div>
						<div id="custom-search-input">
                            <div class="input-group ">
                                <input type="text" class="  search-query form-control" placeholder="Search" />
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
								<th>PMI No</th>
								<th>Patient Name</th>
								<th>Order date</th>
								<th>HFC</th>
								<th>Episode date</th>
								<th>Order by</th>
							</thead>
							<tbody>
								<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail">
									<td>6602060152617</td>
									<td>Mohd Khanapi</td>
									<td>1/1/2017</td>
									<td>K.K Utem</td>
									<td>1/1/2017</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					
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
			<h3 class="modal-title" id="lineModalLabel">Physical Exam System</h3>
		</div>
		<div class="modal-body">
			
            <!-- content goes here -->
						<form class="" >
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Physical Exam Code">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Physical Exam Name">
							</div>
							<div class="form-group">
								<select class="form-control">
									<option>Status</option>
									<option>Active</option>
								</select>
							</div>
						</form>
			<!-- content goes here -->
		</div>
		<div class="modal-footer">
			<div class="btn-group btn-group-justified" role="group" aria-label="group button">
				<div class="btn-group" role="group">
					<button type="submit" class="btn btn-primary btn-block btn-lg" role="button">Update</button>
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
