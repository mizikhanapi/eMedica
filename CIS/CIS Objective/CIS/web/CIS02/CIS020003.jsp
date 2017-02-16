<%-- 
    Document   : CIS020002
    Created on : Jan 31, 2017, 10:00:06 AM
    Author     : -D-
--%>


    <!-- Modal -->
    <div class="modal fade" id="CIS020003" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">—</span><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">Blood Pressure</h3>
                </div>
                <div class="modal-body">

                    <!-- content goes here -->
                    <form role="form" id="BloodPressureForm" >
                        <input type="hidden" id="BPid">
                        <div class="form-group">
                            <h4>Blood Pressure Sitting</h4>
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Systolic</h5>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Diastolic</h5>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Pulse</h5>

                                </div>
                            </div>
                        </div>
                         <div class="row lineSeperator">
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="text" name="sitS" id="sitS" class="form-control input-lg" placeholder="mmHg" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="text" name="sitD" id="sitD" class="form-control input-lg" placeholder="mmHg" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="text" name="sitP" id="sitP" class="form-control input-lg" placeholder="mmHg" tabindex="4">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <h4>Blood Pressure Standing</h4>
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Systolic</h5>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Diastolic</h5>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Pulse</h5>

                                </div>
                            </div>
                        </div>
                        <div class="row lineSeperator">
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="text" name="standS" id="standS" class="form-control input-lg" placeholder="mmHg" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="text" name="standD" id="standD" class="form-control input-lg" placeholder="mmHg" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="text" name="standP" id="standP" class="form-control input-lg" placeholder="mmHg" tabindex="4">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <h4>Blood Pressure Lying</h4>
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Systolic</h5>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Diastolic</h5>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Pulse</h5>

                                </div>
                            </div>
                        </div>
                        <div class="row lineSeperator">
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                
                                <div class="form-group">
                                    <input type="text" name="lyingS" id="lyingS" class="form-control input-lg" placeholder="mmHg" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="text" name="lyingD" id="lyingD" class="form-control input-lg" placeholder="mmHg" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="text" name="lyingP" id="lyingP" class="form-control input-lg" placeholder="mmHg" tabindex="4">
                                </div>
                            </div>
                        </div>

                </div>
                <div class="modal-footer" id="updateBloodP">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-success btn-block btn-lg" id="updateBloodPBtn" role="button">Update</button>
                        </div>
                        <div class="btn-group btn-delete hidden" role="group">
                            <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                        </div>
                    </div>
                    
                </div>
                <div class="modal-footer" id="actionBloodP">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBloodPBtn" role="button">Accept</button>
                        </div>
                        <div class="btn-group btn-delete hidden" role="group">
                            <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
       $(document).ready(function(){
           $('#updateBloodP').hide();
           
       });
        </script>