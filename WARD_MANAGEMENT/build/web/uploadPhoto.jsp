<h4>Search Patient
</h4>
<form class="form-horizontal" name="myForm" id="myForm">
    <!-- Select Basic -->
    <div class="form-group">
        <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
        <div class="col-md-4">
            <select id="idType" name="idType" class="form-control" required="">
                <option selected="" disabled="" value="-"> Please select ID type</option>
                <option value="pmino">PMI No</option>
                <option value="icnew">IC No (NEW)</option>
                <option value="icold">IC No (OLD)</option>


                <%--
                
                
                
                <%
                    if(dataSystemStatus.equals("0")){
                        
                    }else if(dataSystemStatus.equals("1")){
                        for (int i = 0; i < dataIdType.size(); i++) {%>
                <option value="<%=dataIdType.get(i).get(1)%>"><%=dataIdType.get(i).get(2)%></option>
                <%  }
                    }
                    
                %>
                
                
                --%>
            </select>
        </div>
    </div>

    <!-- Text input-->
    <div class="form-group">
        <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
        <div class="col-md-4">
            <input type="text" class="form-control input-md" id="idInput" name="idInput" placeholder="ID" />
        </div>
    </div>
    <div class="text-center">
        <button class="btn btn-default" type="button" id="searchPatient" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>
        <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
        <button id="button2id" name="button2id" class="btn btn-success pull-right"><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>
        <button id="takePicture" name="takePicture" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Take Picture</button>
    </div>
    <div class="form-group">
        <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
        <div class="col-md-4">
            <div class="text-center">
                <img src="../assets/profile.jpg" class="avatar img-circle img-thumbnail" alt="avatar">
                <h6>Upload a different photo...</h6>
                <input type="file" class="">
            </div>        </div>
    </div>
</form>