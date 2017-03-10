<%-- 
    Document   : CIS020002
    Created on : Jan 31, 2017, 10:00:06 AM
    Author     : -D-
--%>


    <!-- Modal -->
    <div class="modal fade" id="CIS020004" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">—</span><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">Respiratory Rate</h3>
                </div>
                <div class="modal-body">

                    <!-- content goes here -->
                    <form role="form" id="myForm2" method="post">
                        <div class="form-group">
                            <h4>Respitatory Rate</h4>
                        </div>

                        <div class="row">
                            <div class="col-xs-2 col-sm-2 col-md-2">
   
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="text" name="rrRate" id="rrRate" class="form-control input-lg" placeholder="Respiratory Rate" tabindex="4">
                                    <input type="hidden" id="RRid">
                                   
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h4>breaths / min</h4>
                                </div>
                            </div>
                            <div class="col-xs-2 col-sm-2 col-md-2">

                            </div>
                        </div>

                 
                     


                </div>
                <div class="modal-footer" id="updateRR">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="updateRRBtn">Update</button>
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
                <div class="modal-footer" id="actionRR">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="acceptRRBtn">Accept</button>
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
        $('#updateRR').hide();
        </script>