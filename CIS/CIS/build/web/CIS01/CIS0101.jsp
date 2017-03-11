<%-- 
    Document   : CIS0101
    Created on : 31-Jan-2017, 10:17:36
    Author     : ahmed
--%>

  <!-- Modal add complaint -->
        <div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Chief Complaint</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <form>
                            <div class="form-group">
                                <input type="hidden" name="ccn" id="codeCCN" class="form-control input-lg" value="CCN" tabindex="4">
                            </div>
                            <div class="form-group">
                                <input class="form-control input-lg" type="text" name="problem"  id="problem" placeholder="Search CCN Problem..." tabindex="4">
                                <div id="match50"></div>
                            </div>
                            <div class="form-group">
                                <input class="form-control input-lg" type="hidden" name="ccnCode"  id="ccnCode"  tabindex="4">
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <select name="mild" id="Mild" class="form-control input-lg" placeholder="Severity">
                                            <option>Severity</option>
                                            <option value="Mild">Mild</option>
                                            <option value="Moderate">Moderate</option>
                                            <option value="Severe">Severe</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <select name="site" id="Site" class="form-control input-lg">
                                            <option value="1" selected="" disabled="">Site</option>
                                            <option value="Right">Right</option>
                                            <option value="Left">Left</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input class="form-control input-lg" type="number" name="dur" id="duration" placeholder="Duration" max="31" min="1">
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <select name="lat" id="sdur" class="form-control input-lg">
                                            <option value="1" selected="" disabled="">Select One</option>
                                            <option value="Minutes">Minutes</option>
                                            <option value="Hour">Hour</option>
                                            <option value="Day">Day</option>
                                            <option value="Week">Week</option>
                                            <option value="Month">Month</option>
                                            <option value="Year">Year</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <select name="lat" id="Laterality" class="form-control input-lg">
                                    <option value="1" selected="" disabled="">Laterality</option>
                                    <option value="Right">Right</option>
                                    <option value="Left">Left</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <textarea type="text" name="display_name" id="Comment" class="form-control input-lg" placeholder="Comment..." tabindex="3"></textarea> 
                            </div>
                    </div>     
                    </form>
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtn" role="button">Accept</button>
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
        <!--End Modal add complaint -->
        
         <!-- modal update complain-->
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Chief Complaint Update</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="uproblem"  id="uproblem" placeholder="Search CCN Problem..." tabindex="4">
                            <div id="match1"></div>
                        </div>
                        <div class="form-group">
                                <input class="form-control input-lg" type="hidden" name="uccnCode"  id="uccnCode"  tabindex="4">
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="mild" id="uMild" class="form-control input-lg">
                                        <option value="1" selected="" disabled="">Severity</option>
                                        <option value="Mild">Mild</option>
                                        <option value="Moderate">Moderate</option>
                                        <option value="Severe">Severe</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="site" id="uSite" class="form-control input-lg">
                                        <option value="1" selected="" disabled="">Site</option>
                                        <option value="Right">Right</option>
                                        <option value="Left">Left</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input class="form-control input-lg" type="number" name="dur" id="uduration" placeholder="Duration" max="31" min="1">
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="lat" id="ssdur" class="form-control input-lg">
                                        <option value="1" selected="" disabled="">Select One</option>
                                        <option value="Minutes">Minutes</option>
                                        <option value="Hour">Hour</option>
                                        <option value="Day">Day</option>
                                        <option value="Week">Week</option>
                                        <option value="Month">Month</option>
                                        <option value="Year">Year</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <select name="lat" id="uLaterality" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Laterality</option>
                                <option value="Right">Right</option>
                                <option value="Left">Left</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="uComment" class="form-control input-lg" placeholder="Comment..." tabindex="3"></textarea> 
                            <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtn" role="button">Update</button>
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
        <!--End modal update complain-->
        
          <!-- Modal HPI -->
        <div class="modal fade" id="squarespaceModal2" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">History of Present Illness (HPI)</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <input type="hidden" name="hpi" id="codeHPI" class="form-control input-lg" value="HPI" tabindex="4">
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="details" class="form-control input-lg" placeholder="details.." tabindex="3"></textarea>
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtn1" role="button">Accept</button>
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
        <!--End ADD HPI-->

        <!-- modal update HPI-->
        <div class="modal fade" id="updateModal1" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">History of Present Illness (HPI) Update</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="udetails" class="form-control input-lg" placeholder="details.." tabindex="3"></textarea>
                            <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtn1" role="button">Update</button>
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
        <!--End HPI modal-->
        
           <!-- Modal ADD PMH -->
        <div class="modal fade" id="squarespaceModal3" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Past Medical History (PMH)</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <input type="hidden" name="pmh" id="codePMH" class="form-control input-lg" value="PMH" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="problem"  id="Problem1" placeholder="Search PMH Problem..." tabindex="4">
                            <div id="match2"></div>
                        </div>
                        <div class="form-group">
                                <input class="form-control input-lg" type="text" name="pmhCode"  id="pmhCode"  tabindex="4">
                        </div>
                        <div class="form-group">
                            <select name="mild" id="Status" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Status</option>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="comment1" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtn2" role="button">Accept</button>
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
        <!--End ADD PMH-->

        <!-- Modal Update PMH -->
        <div class="modal fade" id="updateModal2" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Past Medical History (PMH) Update</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="problem"  id="PProblem2"  placeholder="Search PMH Problem..." tabindex="4">
                            <div id="match3"></div>
                        </div>
                         <div class="form-group">
                                <input class="form-control input-lg" type="hidden" name="upmhCode"  id="upmhCode"  tabindex="4">
                        </div>
                        <div class="form-group">
                            <select name="mild" id="PStatus" class="form-control input-lg">
                                <option></option>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="Pcomment1" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                            <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtn2" role="button">Update</button>
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
        <!--End Update PMH-->
        
         <!-- Modal ADD FMH -->
        <div class="modal fade" id="squarespaceModal4" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Family Health History (FMH) </h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                         <div class="form-group">
                            <input type="hidden" name="FMH" id="codeFMH" class="form-control input-lg" value="FMH" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="problem3"  id="Problem3" placeholder="Search FMH Problem..." tabindex="4">
                            <div id="match17"></div>
                        </div>
                         <div class="form-group">
                                <input class="form-control input-lg" type="hidden" name="fmhCode"  id="fmhCode" tabindex="4">
                        </div>
                        <div class="form-group">
                            <select name="mild" id="f_relationship" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Select Family Relationship</option>
                                <option value="Adopted child">Adopted child</option>
                                <option value="Biological child">Biological child</option>
                                <option value="cousin">cousin</option>
                                <option value="Ex-husband">Ex-husband</option>
                                <option value="Ex-wife">Ex-wife</option>
                                <option value="Father">Father</option>
                                <option value="Friend">Friend</option>
                                <option value="Grandchild">Grandchild</option>
                                <option value="Grandmother">Grandmother</option>
                                <option value="Guardian">Guardian</option>
                                <option value="Husband">Husband</option>
                                <option value="Mother">Mother</option>
                                <option value="Neighbor">Neighbor</option>
                                <option value="Other">Other</option>
                                <option value="Sibling">Sibling</option>
                                <option value="Step child">Step child</option>
                                <option value="Wife">Wife</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="comment2" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtn3" role="button">Accept</button>
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
        <!--End ADD FMH-->
        
        <!-- Modal Update FMH -->
        <div class="modal fade" id="updateModal3" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Family Health History (FMH) Update</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="problem"  id="PProblem3" placeholder="Search FMH Problem..." tabindex="4">
                            <div id="match16"></div>
                        </div>
                         <div class="form-group">
                                <input class="form-control input-lg" type="hidden" name="ufmhCode"  id="ufmhCode" tabindex="4">
                        </div>
                        <div class="form-group">
                            <select name="mild" id="ff_relationship" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Select Family Relationship</option>
                                <option value="Adopted child">Adopted child</option>
                                <option value="Biological child">Biological child</option>
                                <option value="cousin">cousin</option>
                                <option value="Ex-husband">Ex-husband</option>
                                <option value="Ex-wife">Ex-wife</option>
                                <option value="Father">Father</option>
                                <option value="Friend">Friend</option>
                                <option value="Grandchild">Grandchild</option>
                                <option value="Grandmother">Grandmother</option>
                                <option value="Guardian">Guardian</option>
                                <option value="Husband">Husband</option>
                                <option value="Mother">Mother</option>
                                <option value="Neighbor">Neighbor</option>
                                <option value="Other">Other</option>
                                <option value="Sibling">Sibling</option>
                                <option value="Step child">Step child</option>
                                <option value="Wife">Wife</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="Pcomment2" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                            <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtn3" role="button">Update</button>
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
        <!--End Update FMH-->
        
          <!-- Modal ADD Social History -->
        <div class="modal fade" id="squarespaceModal5" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Social History</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                         <div class="form-group">
                            <input type="hidden" name="SOH" id="codeSOH" class="form-control input-lg" value="SOH" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="problem"  id="Problem4" placeholder="Search SOH Problem..." tabindex="4">
                            <div id="match4"></div>
                        </div>
                        <div class="form-group">
                                <input class="form-control input-lg" type="hidden" name="sohCode"  id="sohCode" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="date" id="date" placeholder="Social History Date">
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="comment3" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtn4" role="button">Accept</button>
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
        <!--End ADD Social History-->

        <!-- Modal Update Social History -->
        <div class="modal fade" id="updateModal4" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Social History Update</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="problem"  id="PProblem4" placeholder="Search SOH Problem..." tabindex="4">
                            <div id="match5"></div>
                        </div>
                         <div class="form-group">
                                <input class="form-control input-lg" type="hidden" name="usohCode"  id="usohCode" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="ddate" id="ddate" placeholder="Social History Date">
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="Pcomment3" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                            <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtn4" role="button">Update</button>
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
        <!--End Update Social History-->
        
         <!-- Modal ADD Blood Group/G6PD -->
        <div class="modal fade" id="squarespaceModal6" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Blood Group/G6PD</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                          <div class="form-group">
                            <input type="hidden" name="BLD" id="codeBLD" class="form-control input-lg" value="BLD" tabindex="4">
                        </div>
                        <div class="form-group">
                            <select name="mild" id="blood" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Blood Type</option>
                                <option value="AB">AB</option>
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="O">O</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <select name="mild" id="Rhesus_Type" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Rhesus Type</option>
                                <option value="Positive">Positive</option>
                                <option value="Negative">Negative</option>
                            </select>                  
                        </div>

                        <div class="form-group">
                            <select name="mild" id="G6PD_Status" class="form-control input-lg">
                                <option value="1" selected="" disabled="">G6PD Status</option>
                                <option value="Normal">Normal</option>
                                <option value="Deficient">Deficient</option>
                            </select>           
                        </div>

                        <div class="form-group">
                            <textarea type="text" name="display_name" id="comment4" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtn5" role="button">Accept</button>
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
        <!--End ADD Blood Group/G6PD-->

        <!-- Modal Update Blood Group/G6PD -->
        <div class="modal fade" id="updateModal5" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Blood Group/G6PD Update</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="modal-body">
                            <!-- content goes here -->
                            <div class="form-group">
                                <select name="mild" id="b_blood" class="form-control input-lg">
                                    <option value="1" selected="" disabled="">Blood Type</option>
                                    <option value="AB">AB</option>
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="O">O</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <select name="mild" id="RRhesus_Type" class="form-control input-lg">
                                    <option value="1" selected="" disabled="">Rhesus Type</option>
                                    <option value="Positive">Positive</option>
                                    <option value="Negative">Negative</option>
                                </select>                  
                            </div>

                            <div class="form-group">
                                <select name="mild" id="GG6PD_Status" class="form-control input-lg">
                                    <option value="1" selected="" disabled="">G6PD Status</option>
                                    <option value="Normal">Normal</option>
                                    <option value="Deficient">Deficient</option>
                                </select>           
                            </div>
                            <div class="form-group">
                                <textarea type="text" name="display_name" id="Pcomment4" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                                <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                            </div>
                        </div>     
                        <div class="modal-footer">
                            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtn5" role="button">Update</button>
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
        <!--End Update Blood Group/G6PD -->
        
         <!-- Modal ADD Allergy -->
        <div class="modal fade" id="squarespaceModal7" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Allergy</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <input type="hidden" name="Allergy" id="codeALG" class="form-control input-lg" value="ALG" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="problem"  id="Problem5" placeholder="Search ALG Problem..." tabindex="4">
                            <div id="match22"></div>
                        </div>
                          <div class="form-group">
                              <input class="form-control input-lg" type="hidden" name="ALG_cd"  id="ALG_cd" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="date1" id="date1" placeholder="Allergy Date">
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="comment5" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtn6" role="button">Accept</button>
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
        <!--End ADD Allergy-->

        <!-- Modal Update Allergy -->
        <div class="modal fade" id="updateModal6" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Allergy Update</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="problem"  id="PProblem5" placeholder="Search ALG Problem..." tabindex="4">
                            <div id="match23"></div>
                        </div>
                        <div class="form-group">
                              <input class="form-control input-lg" type="hidden" name="uALG_cd"  id="uALG_cd" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="ddate1" id="ddate1" placeholder="Allergy Date">
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="Pcomment5" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                            <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtn6" role="button">Update</button>
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
        <!--End Update Allergy-->
        
         <!-- Modal ADD Immunization -->
        <div class="modal fade" id="squarespaceModal8" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Immunization</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                          <div class="form-group">
                            <input type="hidden" name="IMU" id="codeIMU" class="form-control input-lg" value="IMU" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="problem"  id="Problem6" placeholder="Search IMU Problem..." tabindex="4">
                            <div id="match6"></div>
                        </div>
                         <div class="form-group">
                              <input class="form-control input-lg" type="hidden" name="IMU_cd"  id="IMU_cd" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="date2" id="date2" placeholder="Immunization Date">
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="comment6" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtn7" role="button">Accept</button>
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
        <!--End ADD Immunization-->

        <!-- Modal Update Immunization -->
        <div class="modal fade" id="updateModal7" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Immunization Update</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="problem"  id="PProblem6" placeholder="Search IMU Problem..." tabindex="4">
                            <div id="match25"></div>
                        </div>
                        <div class="form-group">
                              <input class="form-control input-lg" type="hidden" name="uIMU_cd"  id="uIMU_cd" tabindex="4">
                        </div>
                        <div class="form-group">
                              <input class="form-control input-lg" type="text" name="ddate2" id="ddate2" placeholder="Immunization Date">
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="Pcomment6" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                            <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtn7" role="button">Update</button>
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
        <!--End Update Immunization-->
        
         <!-- Modal ADD Disability -->
        <div class="modal fade" id="squarespaceModal9" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Disability</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                          <div class="form-group">
                            <input type="hidden" name="DAB" id="codeDAB" class="form-control input-lg" value="DAB" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="problem"  id="Problem32" placeholder="Search DAS Problem..." tabindex="4">
                            <div id="match32"></div>
                        </div>
                        <div class="form-group">
                              <input class="form-control input-lg" type="hidden" name="DAS_cd"  id="DAS_cd" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="date3" id="date3" placeholder="Disability Date">
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="comment7" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtn8" role="button">Accept</button>
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
        <!--End ADD Disability-->

        <!-- Modal Update Disability -->
        <div class="modal fade" id="updateModal8" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Disability Update</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="problem"  id="PProblem32" placeholder="Search DAS Problem..." tabindex="4">
                            <div id="mmatch32"></div>
                        </div>
                        <div class="form-group">
                              <input class="form-control input-lg" type="hidden" name="uDAS_cd"  id="uDAS_cd" tabindex="4">
                        </div>
                        <div class="form-group">
                           <input class="form-control input-lg" type="text" name="ddate3" id="ddate3" placeholder="Disability Date">
                        </div>
                        <div class="form-group">
                            <textarea type="text" name="display_name" id="Pcomment7" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                            <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtn8" role="button">Update</button>
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
        <!--End Update Disability-->





