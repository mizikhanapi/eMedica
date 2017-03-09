<%-- 
    Document   : CIS040006
    Created on : Feb 18, 2017, 12:26:03 PM
    Author     : -D-
--%>
<!--Modal add Procedure-->
<div class="modal fade" id="CIS040006" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Procedure Form</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="hidden" name="POS" id="codePOS" class="form-control input-lg" value="POS" tabindex="4">
                </div>
                <div class="form-group">
                    <input class="form-control input-lg" type="text" name="problem"  id="Problem18" placeholder="Search Procedure..." tabindex="4">
                    <div id="match18"></div>
                </div>
                <div id="proType1">
                    <div class="form-group">
                        <select name="inst" id="proType" class="form-control input-lg">
                            <option value="1" selected="" disabled="">Procedure Types</option>
                        </select>
                    </div>
                </div>
                  <div class="form-group">
                      <input class="form-control input-lg" type="hidden" name="procedure_cd" id="procedure_cd">
                  </div>
                <div class="form-group">
                    <input  type="hidden" name="ProCode" id="ProCode">
                </div>
            </div>   
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptProcedure" role="button">Accept</button>
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
<!--End add Procedure-->

<!--Modal update Procedure-->
<div class="modal fade" id="update_CIS040006" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Update Procedure</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="hidden" name="POS" id="codePOS" class="form-control input-lg" value="POS" tabindex="4">
                </div>
                <div class="form-group">
                    <input class="form-control input-lg" type="text" name="problem"  id="PProblem19" placeholder="Search Procedure..." tabindex="4">
                    <div id="match19"></div>
                </div>
                
                <div id="pproType1">
                    <div class="form-group">
                        <select name="pproType" id="pproType" class="form-control input-lg">
                            <option value="1" selected="" disabled="">Procedure Types</option>
                        </select>
                    </div>
                </div>
                  
                 <div class="form-group">
                      <input class="form-control input-lg" type="hidden" name="procedure_cd" id="pprocedure_cd">
                  </div>

                <div class="form-group">
                    <input  type="hidden" name="pproCode" id="pproCode">
                    <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4"> 
                </div>
            </div>   
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateProcedure" role="button">Update</button>
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