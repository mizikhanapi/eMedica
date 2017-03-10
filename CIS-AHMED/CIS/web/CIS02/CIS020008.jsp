<%-- 
    Document   : CIS020002
    Created on : Jan 31, 2017, 10:00:06 AM
    Author     : -D-
--%>


    <!-- Modal -->
    <div class="modal fade" id="CIS020008" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">—</span><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">Others</h3>
                </div>
                
                <div class="modal-body">

                    <!-- content goes here -->
                    <form role="form" id="myForm2" method="post">
                        <input type="hidden" name="otherId" id="otherId" class="form-control input-lg" placeholder="cm" tabindex="4">
                        <div class="row">
                            <div class="col-xs-2 col-sm-2 col-md-2"><h5>Height</h5></div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    
                                    <input type="text" name="bmiHeight" id="bmiHeight" class="form-control input-lg" placeholder="cm" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group slider">
                                    <div id="bmiHeightSlider"></div>
                                </div>
                            </div>
                       
                        </div>
                        <div class="row">
                            <div class="col-xs-2 col-sm-2 col-md-2"><h5>Weight</h5></div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="text" name="bmiWeight" id="bmiWeight" class="form-control input-lg" placeholder="kg" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group slider">
                                    <div id="bmiWeightSlider"></div>
                                </div>
                            </div>
                           
                        </div>
                        <div class="row ">
                            <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2"><h4>BMI</h4></div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="text" name="bmi" id="bmi" class="form-control input-lg" placeholder="kg/m2" tabindex="4">
                                </div>
                            </div>
                            
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="btn-group" role="group">
                                    <a class="btn btn-primary btn-block btn-lg calcBMI " id="calcBMI" >Calculate BMI</a>
                                </div>
                            </div>
                  
                        </div>
                        <div class="row lineSeperator">
                            <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2"><h4>Weight Status</h4></div>
                            <div class="col-xs-5 col-sm-5 col-md-4">
                                <div class="form-group">
                                    <input type="text" name="bmiStatus" id="bmiStatus" class="form-control input-lg" placeholder="" tabindex="4">
                                </div>
                            </div>
                              </div>
                        <div class="row">
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group">

                                </div>
                            </div>
                        </div>
                            <div class="row lineSeperator">
                                <div class="col-xs-2 col-sm-2 col-md-2">
                                    <div class="form-group">
                                        <h5>Head Circumference</h5></div>
                                    </div>
                                <div class="col-xs-4 col-sm-4 col-md-4">
                                    <div class="form-group">

                                        <input type="text" name="headCir" id="headCir" class="form-control input-lg" placeholder="cm" tabindex="4">
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group slider">
                                        <div id="headCirSlider"></div>
                                    </div>
                                </div>
                              
                            </div>
                        <div class="row">
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group">

                                </div>
                            </div>
                        </div>
                            <div class="row lineSeperator">
                                <div class="col-xs-2 col-sm-2 col-md-3"></div>
                                <div class="col-xs-2 col-sm-2 col-md-2"><h5>Blood Glucose</h5></div>
                                <div class="col-xs-4 col-sm-4 col-md-4">
                                    <div class="form-group">

                                        <input type="text" name="bloodGlucose" id="bloodGlucose" class="form-control input-lg" placeholder="mmol/L" tabindex="4">
                                    </div>
                                </div>

                                <div class="col-xs-2 col-sm-2 col-md-3"></div>
                            </div>
                </div>
                
                
                <div class="modal-footer" id="updateOther">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="submit" class="btn btn-success btn-block btn-lg" id="updateOtherBtn" role="button">Update</button>
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
                
                <div class="modal-footer" id="actionOther">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="submit" class="btn btn-success btn-block btn-lg"id="acceptOtherBtn" role="button">Accept</button>
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
              $('#updateOther').hide();
              $('#bmiHeightSlider').slider({
                  value:0,
                  min:140,
                  max:220,
                  step:1,
                  slide:function(event,ui){
                      $('#bmiHeight').val(ui.value+" cm");
                  }
              });
              $('#bmiHeight').on('change',function(e){
                 var bmiInput = parseInt($('#bmiHeight').val()) ;
                  $('#bmiHeightSlider').slider("option","value",bmiInput);
                  $('#bmiHeight').val(bmiInput+" cm");
              });
              $('#bmiWeightSlider').slider({
                  value:0,
                  min:0,
                  max:150,
                  step:1,
                  slide:function(event,ui){
                      $('#bmiWeight').val(ui.value+" kg");
                  }
              });
             $('#bmiWeight').on('change',function(e){
                 var bmiWInput = parseInt($('#bmiWeight').val()) ;
                  $('#bmiWeightSlider').slider("option","value",bmiWInput);
                  $('#bmiWeight').val(bmiWInput+" kg");
              });
              $('#calcBMI').on('click',function(e){
                  var height =   $('#bmiHeight').val().split(" ");
                  height = parseFloat(height[0])/100;
                  height = height*height;
                  
                  var weight = $('#bmiWeight').val().split(" ");
                  weight = parseFloat(weight[0]);
                  console.log(height);
                  console.log(weight);
                 // result = weight/height;
                  //result = parseInt(result)
                  var result = calcBMI(height,weight);
                  $('#bmi').val(result[0]);
                  $('#bmiStatus').val((result[1]));
                  console.log(result);
                  
              });
        $('#headCirSlider').slider({
                  value:0,
                  min:50,
                  max:100,
                  step:1,
                  slide:function(event,ui){
                      $('#headCir').val(ui.value + "cm");
                  }
              });
          
          $('#headCir').on('change',function(e){
              var headCir = parseInt($('#headCir').val());
              $('#headCirSlider').slider("option","value",headCir);
              $('#headCir').val(headCir + " cm");
          })
   
          });
        </script>
  
    