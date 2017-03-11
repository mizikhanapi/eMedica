<%-- 
    Document   : CIS030001
    Created on : Feb 18, 2017, 3:09:35 PM
    Author     : -D-
--%>

<div class="modal fade" id="CIS030001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Diagnosis Form</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                          <div class="form-group">
                            <input type="hidden" name="DGS" id="codeDGS" class="form-control input-lg" value="DGS" tabindex="4">
                        </div>
                        <div class="form-group">
                            <select name="mild" id="Type" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Type</option>
                                <option value="Final">Final</option>
                                <option value="Provision">Provision</option>
                            </select>
                        </div>

                        <div class="form-group">
                             <input class="form-control input-lg" type="text" name="date4" id="date4" placeholder="Diagnosis Date">
                        </div>

                        <div class="form-group">
                            <div class="form-group">
                                <input class="form-control input-lg" type="text" name="problem"  id="Problem8" placeholder="Search..." tabindex="4">
                                <div id="match8"></div>
                            </div>   
                        </div>

                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="mild" id="Severity1" class="form-control input-lg">
                                        <option value="1" selected="" disabled="">Severity [Select]</option>
                                        <option value="Mild">Mild</option>
                                        <option value="Normal">Normal</option>
                                        <option value="Acute">Acute</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="site" id="Site1" class="form-control input-lg">
                                        <option value="1" selected="" disabled="">Site [Select]</option>
                                        <option value="Right">Right</option>
                                        <option value="Left">Left</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <select name="site" id="Laterality1" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Laterality [Select]</option>
                                <option value="Right">Right</option>
                                <option value="Left">Left</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <textarea type="text" name="display_name" id="comment8" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="submit" class="btn btn-success btn-block btn-lg" id="acceptBtn9" role="button">Accept</button>
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
        <!--End ADD Diagnosis-->

        <!--Modal Update Diagnosis-->
        <div class="modal fade" id="update_CIS030001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Diagnosis Form</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <select name="mild" id="TType" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Type</option>
                                <option value="Final">Final</option>
                                <option value="Provision">Provision</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="ddate4" id="ddate4" placeholder="Diagnosis Date">
                        </div>

                        <div class="form-group">
                            <div class="form-group">
                                <input class="form-control input-lg" type="text" name="problem"  id="PProblem8" placeholder="Search..." tabindex="4">
                                <div id="match8"></div>
                            </div>   
                        </div>

                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="mild" id="SSeverity1" class="form-control input-lg">
                                        <option value="1" selected="" disabled="">Severity [Select]</option>
                                        <option value="Mild">Mild</option>
                                        <option value="Normal">Normal</option>
                                        <option value="Acute">Acute</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="site" id="SSite1" class="form-control input-lg">
                                        <option value="1" selected="" disabled="">Site [Select]</option>
                                        <option value="Right">Right</option>
                                        <option value="Left">Left</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <select name="site" id="LLaterality1" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Laterality [Select]</option>
                                <option value="Right">Right</option>
                                <option value="Left">Left</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <textarea type="text" name="display_name" id="Pcomment8" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                            <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4"> 
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="submit" class="btn btn-success btn-block btn-lg" id="updateBtn9" role="button">Update</button>
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
        <!--End Update Diagnosis-->