<%-- 
    Document   : CIS040002
    Created on : Feb 18, 2017, 12:06:44 PM
    Author     : -D-
--%>
<!--Modal add Drug Order-->
<div class="modal fade" id="CIS040002" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 65%; height: 100%">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Drug Order Form</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <input type="hidden" name="DTO" id="jsonId" class="form-control input-lg"  tabindex="4">
                            <input class="form-control input-lg" type="text" name="problem"  id="searchDTO" placeholder="Search Drug..." tabindex="4">
                            <input class="form-control input-lg" type="hidden" name="dtoCode"  id="dtoCode" placeholder="Drug Code..." tabindex="4" readonly="">
                            <div id="matchDTO" ></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <h4 class="modal-title" style="font-weight: bold">Drug Details</h4>
                        </div>
                    </div>
                </div>

                <!-- content goes here -->
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group modalTextLabel">
                            <h4 class="modal-title">Drug Name</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="pro" id="drugNameDTO" placeholder="" readonly="">
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Stock</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group ">
                            <input class="form-control input-lg" type="text" name="qty" id="drugQtyDTO" placeholder="" readonly="">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Strength</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="d_strength" id="drugStrDTO" placeholder="">
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Dosage</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="dose" id="doseDTO" placeholder="">
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Duration</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="number" name="dur1" id="durationDTO" placeholder="Duration" max = "31" min="1">
                        </div>
                    </div>

                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Unit</h4>
                        </div>
                    </div>

                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <select name="site" id="unitDTO" class="form-control input-lg">
                                <option value="" disabled="" selected="">Select Here</option>
                                <option value="Day">Day</option>
                                <option value="Week">Week</option>
                                <option value="Month">Month</option>     
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Frequency</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <select name="site" id="drugFrequencyDTO" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Select Here</option>
                                <option value="Once">Once</option>
                                <option value="In the morning">In the morning</option>
                                <option value="At night">At night</option>
                                <option value="Daily">Daily</option>
                                <option value="Twice a day">Twice a day</option>
                                <option value="3 times a day">3 times a day</option>
                                <option value="4 times a day">4 times a day</option>
                                <option value="2 hourly">2 hourly</option>
                                <option value="4 hourly">4 hourly</option>
                                <option value="6 hourly">6 hourly</option>
                                <option value="8 hourly">8 hourly</option>
                                <option value="Immediately">Immediately</option>
                                <option value="As needed">As needed</option>     
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Instruction</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <select name="inst" id="drugInstructionDTO" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Select Here</option>
                                <option value="If required">If required</option>
                                <option value="As directed">As directed</option>
                                <option value="Before meats">Before meats</option>
                                <option value="Every second day">Every second day</option>
                                <option value="Left side">Left side</option>
                                <option value="Right side">Right side</option>
                                <option value="To both side">To both sides</option>
                                <option value="Other">Other</option> 
                            </select>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Cautionary</h4>
                        </div>
                    </div>
                    <div class="col-xs-10 col-sm-10 col-md-10">
                        <div class="form-group">
                            <input type="text" name="display_name" id="cautionaryDTO" class="form-control input-lg" placeholder="" tabindex="3">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Comments</h4>
                            <textarea type="text" name="display_name" id="commentDTO" class="form-control input-lg" placeholder="" tabindex="3"></textarea>
                        </div>
                    </div>
                </div>

            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtnDTO" role="button">Accept</button>
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

<!--End add Drug Order-->

<!--Modal update Drug Order-->
<div class="modal fade" id="update_CIS040002" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 65%; height: 100%">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Update Drug Order</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <input type="hidden" name="DTO" id="codeDTO" class="form-control input-lg" value="DTO" tabindex="4">
                            <input class="form-control input-lg" type="text" name="problem"  id="update_searchDTO" placeholder="Search Drug..." tabindex="4">
                            <input class="form-control input-lg" type="hidden" name="dtoCode"  id="update_dtoCode" placeholder="Drug Code..." tabindex="4" readonly="">
                            <div id="update_matchDTO" ></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <h4 class="modal-title" style="font-weight: bold">Drug Details</h4>
                        </div>
                    </div>
                </div>

                <!-- content goes here -->
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group modalTextLabel">
                            <h4 class="modal-title">Drug Name</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="pro" id="update_pro" placeholder="" readonly="">
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Stock</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group ">
                            <input class="form-control input-lg" type="text" name="qty" id="update_qty" placeholder="" readonly="">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Strength</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="d_strength" id="update_d_strength" placeholder="">
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Dosage</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="dose" id="update_dose" placeholder="">
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Duration</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="number" name="dur1" id="update_dur1" placeholder="Duration" max = "31" min="1">
                        </div>
                    </div>

                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Unit</h4>
                        </div>
                    </div>

                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <select name="site" id="update_ddwwmm" class="form-control input-lg">
                                <option value="" disabled="" selected="">Select Here</option>
                                <option value="Day">Day</option>
                                <option value="Week">Week</option>
                                <option value="Month">Month</option>     
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Frequency</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <select name="site" id="update_freq" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Select Here</option>
                                <option value="Once">Once</option>
                                <option value="In the morning">In the morning</option>
                                <option value="At night">At night</option>
                                <option value="Daily">Daily</option>
                                <option value="Twice a day">Twice a day</option>
                                <option value="3 times a day">3 times a day</option>
                                <option value="4 times a day">4 times a day</option>
                                <option value="2 hourly">2 hourly</option>
                                <option value="4 hourly">4 hourly</option>
                                <option value="6 hourly">6 hourly</option>
                                <option value="8 hourly">8 hourly</option>
                                <option value="Immediately">Immediately</option>
                                <option value="As needed">As needed</option>     
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Instruction</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <select name="inst" id="update_inst" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Select Here</option>
                                <option value="If required">If required</option>
                                <option value="As directed">As directed</option>
                                <option value="Before meats">Before meats</option>
                                <option value="Every second day">Every second day</option>
                                <option value="Left side">Left side</option>
                                <option value="Right side">Right side</option>
                                <option value="To both side">To both sides</option>
                                <option value="Other">Other</option> 
                            </select>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Cautionary</h4>
                        </div>
                    </div>
                    <div class="col-xs-10 col-sm-10 col-md-10">
                        <div class="form-group">
                            <input type="text" name="display_name" id="update_cautionaryDTO" class="form-control input-lg" placeholder="" tabindex="3">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Comments</h4>
                            <textarea type="text" name="display_name" id="update_commentDTO" class="form-control input-lg" placeholder="" tabindex="3"></textarea>
                        </div>
                    </div>
                </div>


            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnDTO" role="button">Update</button>
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