<%-- 
    Document   : CIS040008
    Created on : Feb 18, 2017, 12:28:10 PM
    Author     : -D-
--%>


<!--Modal ADD MC & Time Slip-->
<div class="modal fade" id="CIS040008" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Medical Certification (MC) and Time Slip</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->

                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="DateFrom" id="DateFrom" placeholder="Date From">
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="DateTo" id="DateTo" placeholder="Date To">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="number" name="num1" id="num1" min="00" max="23" placeholder="....">
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="number" name="num2" id="num2" min="00" max="59" placeholder="....">
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="number" name="num3" id="num3" min="00" max="59" placeholder="....">
                        </div>
                    </div>
                </div>
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-primary btn-block btn-lg" id="btnMC">Generate MC</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-primary btn-block btn-lg" id="btnTimeSlip">Generate Time Slip</button>
                    </div>
                </div>

                <div class="modal-footer">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-success btn-block btn-lg" id="acceptMCTS" role="button">Accept</button>
                        </div>
                        <div class="btn-group btn-delete hidden" role="group">
                            <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!--End ADD MC & Time Slip-->

    <!--Modal Update MC & Time Slip-->
    <div class="modal fade" id="update_CIS040008" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">Update Medical Certification (MC) and Time Slip</h3>
                </div>
                <div class="modal-body">
                    <!-- content goes here -->

                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <div class="form-group">
                                <input class="form-control input-lg" type="text" name="DDateFrom" id="DDateFrom" placeholder="Date From">
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <div class="form-group">
                                <input class="form-control input-lg" type="text" name="DDateTo" id="DDateTo" placeholder="Date To">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <input class="form-control input-lg" type="number" name="nnum1" id="nnum1" min="00" max="23" placeholder="....">
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <input class="form-control input-lg" type="number" name="nnum2" id="nnum2" min="00" max="59" placeholder="....">
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <input class="form-control input-lg" type="number" name="nnum3" id="nnum3" min="00" max="59" placeholder="....">
                                <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4"> 

                            </div>
                        </div>
                    </div>

                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-primary btn-block btn-lg" id="btnMC">Generate MC</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-primary btn-block btn-lg" id="btnTimeSlip">Generate Time Slip</button>
                        </div>
                    </div>

                </div>     
                <div class="modal-footer">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="submit" class="btn btn-success btn-block btn-lg" id="updateMCTS" role="button">Update</button>
                        </div>
                        <div class="btn-group btn-delete hidden" role="group">
                            <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>