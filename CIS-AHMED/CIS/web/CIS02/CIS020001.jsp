<%-- 
    Document   : CIS020001
    Created on : Jan 31, 2017, 9:55:20 AM
    Author     : -D-
--%>

<%
    
     //Config Config = new Config();
    String sqlGcs = "SELECT * FROM gcs_response WHERE response_type ='gcs'";
    ArrayList<ArrayList<String>> dataGcs = Conn.getData(sqlGcs);  

%>
    <!-- Modal -->
    <div class="modal fade" id="CIS020001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog"  id="mainModal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">—</span><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">Glasgow Coma Scale</h3>
                </div>
                <div class="modal-body">

                    <!-- content goes here -->
                    <form role="form" id="myForm2">

                        <div class="form-group">
                            <input type="text" name="resultMain" id="resultMain" class="form-control input-lg" placeholder="Result" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input type="text" name="pointMain" id="pointMain" class="form-control input-lg" placeholder="Point" tabindex="4">
                            <input type="hidden" name="Jsonid" id="Jsonid" class="form-control input-lg" placeholder="Jsonid" tabindex="4">
                        </div>
                        <div class="form-group">
                            <table class="table table-striped" align="center" id="gcs_table">
                                    <thead>
                                    <td style="width: 80%">Response</td>
                                    <td>Points</td>
                                    </thead>
                                    <tbody>
                                        <tr id="rowEOR">
                                            <td>-</td>
                                            <td>0 Point</td>
                                        </tr>
                                        <tr id="rowMR">
                                            <td>-</td>
                                            <td>0 Point</td>
                                        </tr>
                                        <tr id="rowVR">
                                            <td>-</td>
                                            <td>0 Point</td>
                                        </tr>      
                                    </tbody>
                                </table>
                        </div>

                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group" id="IGCSBtn">
                                <button  class="btn btn-primary btn-block btn-lg " id="InsertBtn" role="button">Insert Glasgow Coma Scale</button>
                            </div>
                        </div>


                </div>
                <div class="modal-footer" id="updateGSC">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <a class="btn btn-success btn-block btn-lg gcsUpdate " id="gcsUpdate" >Update</a>
                        </div>
                   
                        <div class="btn-group" role="group">
                            <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                        </div>
                    </div>
                    </form>
                </div>
                <div class="modal-footer" id="actionGSC">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <a class="btn btn-success btn-block btn-lg gcsAccept " id="gcsAccept" >Accept</a>
                        </div>
                      
                        <div class="btn-group" role="group">
                            <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!--SUB MODAL-->
        <div class="modal-dialog" id="subModal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">—</span><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">Glasgow Coma Scale</h3>
                </div>
                <div class="modal-body">

                    <!-- content goes here -->
                    <form role="form" id="myForm2">

                        <div class="form-group">
                            <input type="text" id="tpoint" class="form-control input-lg" placeholder="Total Point" tabindex="4">
                        </div>
                        <div class="form-group">
                            <input type="text"  id="result" class="form-control input-lg" placeholder="Result" tabindex="4">
                          
                        </div>
                      <div class="form-group">
                            <div class="col-lg-12 col-xs-12 col-sm-12 col-md-12">
                                <br>
                                <% for(int i = 0; i<dataGcs.size(); i++){
                                    %>
                                    <h4><%out.print(dataGcs.get(i).get(1));%></h4>
                              <table class="table table-striped" align="center" id="gcs_table">
                                    <thead>
                                    <td>Response</td>
                                    <td></td>
                                    </thead>
                                    <tbody>
                                        
                                        <%
                                                String sqlGcsScale = "SELECT * FROM emedica.gcs_scale WHERE response_code='"+dataGcs.get(i).get(0)+"'";
                                                    ArrayList<ArrayList<String>> dataGcsScale = Conn.getData(sqlGcsScale);


                                                    for(int ii = 0; ii<dataGcsScale.size(); ii++){
                                                        %>
                                                        <tr>
                                                            <td><%out.print(dataGcsScale.get(ii).get(2));%></td>
                                                            <td><input type="radio" name="<%out.print(dataGcsScale.get(ii).get(0));%>" id="<%out.print(dataGcsScale.get(ii).get(0));%>"value="<%out.print(dataGcsScale.get(ii).get(3));%>"></td>
                                                        </tr>
                                                        <%
                                                    }
                                            %>
      
                                                                    
                                    </tbody>
                                </table>
                                <%}%>

                            </div>
                            
                        </div>

                </div>
                <div class="modal-footer"id="subModalAction" >
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <a class="btn btn-success btn-block btn-lg  " id="gcsDone" >Done</a>
                        </div>
                        <div class="btn-group btn-delete hidden" role="group">
                            <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg"   role="button">Clear</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" id="backGcs" class="btn btn-danger btn-block btn-lg"  role="button">Back</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        
    </div>
    

    
    <script type='text/javascript'>

        $(document).ready(function(){
            
           var eor=0;
            var mr=0;
            var vr=0;
            var tPoint=0;
            var result;
            
            $('#updateGSC').hide();

            console.log('loading...');
            $('#subModal').hide();
            
            $('input[type=radio][name=gcs_eor]').change(function(){
                eor = this.value.split(" ");
                eor = parseInt(eor[0]);
                var response =  $(this).closest('tr').children('td').text();
                var point = this.value;
                $('#rowEOR').replaceWith("<tr id='rowEOR'><td>"+response+"</td><td>"+point+"</td></tr>");
                console.log(response);
               var result =  calcPoint(eor,mr,vr);
                $('#result').val(result[0]);
                $('#tpoint').val(result[1]+" Points");

            });
            
          $('input[type=radio][name=gcs_mr]').change(function(){
                mr = this.value.split(" ");
                mr = parseInt(mr[0]);
                var response =  $(this).closest('tr').children('td').text();
                var point = this.value;
                $('#rowMR').replaceWith("<tr id='rowMR'><td>"+response+"</td><td>"+point+"</td></tr>");
                var result =  calcPoint(eor,mr,vr);
                $('#result').val(result[0]);
                $('#tpoint').val(result[1]+" Points");

            });
            
           $('input[type=radio][name=gcs_vr]').change(function(){
                vr = this.value.split(" ");
                vr = parseInt(vr[0]);
                var response =  $(this).closest('tr').children('td').text();
                var point = this.value;
                $('#rowVR').replaceWith("<tr id='rowVR'><td>"+response+"</td><td>"+point+"</td></tr>");
                var result =  calcPoint(eor,mr,vr);
                $('#result').val(result[0]);
                $('#tpoint').val(result[1]+" Points");

            });

            $('#IGCSBtn').on('click','#InsertBtn',function(e){
                e.preventDefault();
                $('#mainModal').hide();
                $('#subModal').show();  
            });
            
            $('#subModalAction').on('click','#backGcs',function(e){
                e.preventDefault();
                $('#mainModal').show();
                $('#subModal').hide();  
            });

       $('#subModalAction').on('click','#gcsDone',function(e){
                e.preventDefault();
                $('#mainModal').show();
                $('#subModal').hide();  
                $('#resultMain').val($('#result').val());
                $('#pointMain').val($('#tpoint').val());
                
            });
        });
        
        
        </script>