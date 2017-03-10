<%-- 
    Document   : CIS030002
    Created on : Feb 18, 2017, 3:12:14 PM
    Author     : -D-
--%>

   <!--Modal ADD Progress Notes-->
        <div class="modal fade" id="CIS030002" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Progress Notes Form</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                          <div class="form-group">
                            <input type="hidden" name="PNT" id="codePNT" class="form-control input-lg" value="PNT" tabindex="4">
                        </div>
                        <div class="form-group">
                            <textarea  name="display_name" id="PNT" class="form-control input-lg" placeholder="Notes..." tabindex="3"></textarea>
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtnPNT" role="button">Accept</button>
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
        <!--End ADD Progress Notes-->

        <!--Modal UPDATE Progress Notes-->
        <div class="modal fade" id="update_CIS030002" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Update Progress Notes Form</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <textarea  name="display_name" id="update_PNT" class="form-control input-lg" placeholder="Notes..." tabindex="3"></textarea>
                            <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnPNT" role="button">Update</button>
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
        <!--End UPDATE Progress Notes-->