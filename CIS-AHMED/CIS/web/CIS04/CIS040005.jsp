<%-- 
    Document   : CIS040005
    Created on : Feb 18, 2017, 12:22:19 PM
    Author     : -D-
--%>
<!--Modal ADD Second Opinion-->
<div class="modal fade" id="CIS040005" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Second Opinion Form</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="hidden" name="SCO" id="codeSCO" class="form-control input-lg" value="SCO" tabindex="4">
                </div>

                <div class="form-group">
                    <div class="form-group">
                        <input class="form-control input-lg" type="text" name="problem"  id="hfc" placeholder="Search Health Facility..." tabindex="4">
                        <div id="matchHFC"></div>
                    </div>   
                </div>
                
                <div class="form-group">
                    <div class="form-group">
                        <input class="form-control input-lg" type="hidden" name="problem"  id="hfc1" tabindex="4">
                    </div>   
                </div>
                
                        <div class="form-group">
                            <select name="site" id="hfcDiscipline" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Health Facility Discipline [Select]</option>
                            </select>
                        </div>
                
                <div class="form-group">
                    <div class="form-group">
                        <input class="form-control input-lg" type="hidden" name="problem"  id="disciplin_cd" tabindex="4">
                    </div>   
                </div>

                 <div class="form-group">
                    <div class="form-group">
                        <input class="form-control input-lg" type="text" name="problem"  id="Searchdoctor" placeholder="Search Doctor & Specialist & Consultant..." tabindex="4">
                        <div id="match101"></div>
                    </div>   
                </div>

                <div class="form-group">
                    <textarea type="text" name="display_name" id="comment10" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" id="acceptBtn11" role="button">Accept</button>
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
<!--End ADD Second Opinion-->

<!--Modal Update Second Opinion-->
<div class="modal fade" id="update_CIS040005" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Update Second Opinion Form</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->

                <div class="form-group">
                    <div class="form-group">
                        <input class="form-control input-lg" type="text" name="problem"  id="PProblem10" placeholder="Search Health Facility..." tabindex="4">
                        <div id="mmatch10"></div>
                    </div>   
                </div>
                 <div class="form-group">
                    <div class="form-group">
                        <input class="form-control input-lg" type="text" name="problem"  id="PProblem100" placeholder="Search Health Facility Discipline..." tabindex="4">
                        <div id="mmatch100"></div>
                    </div>   
                </div>
                 <div class="form-group">
                    <div class="form-group">
                        <input class="form-control input-lg" type="text" name="problem"  id="PProblem101" placeholder="Search Doctor & Specialist & Consultant..." tabindex="4">
                        <div id="mmatch101"></div>
                    </div>   
                </div>

                <div class="form-group">
                    <textarea type="text" name="display_name" id="Pcomment10" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                    <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4"> 
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" id="updateBtn11" role="button">Update</button>
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
<!--End Update Second Opinion-->