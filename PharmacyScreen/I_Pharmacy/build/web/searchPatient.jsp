<%-- 
    Document   : searchPatient
    Created on : Feb 6, 2017, 2:53:34 PM
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012' ";
    ArrayList<ArrayList<String>> dataIdType;
    Conn conn = new Conn();
    dataIdType = conn.getData(idTYpe);
    String dataSystemStatus = "1"; //session.getAttribute("SYSTEMSTAT").toString();
%>
<div class="thumbnail">
    <h4>Search Patient
        <button id="button2id" name="button2id" class="btn btn-success pull-right"><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>
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
                    <!--<option value="matricno">Matric No</option>
                    <option value="staffno">Staff No</option>-->
                    <%                                if (dataSystemStatus.equals("0")) {

                        } else if (dataSystemStatus.equals("1")) {
                            for (int i = 0; i < dataIdType.size(); i++) {%>
                    <option value="<%=dataIdType.get(i).get(1)%>"><%=dataIdType.get(i).get(2)%></option>
                    <%  }
                        }

                    %>
                </select>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
            <div class="col-md-4">
                <input type="text" class="form-control input-md" id="idInput" name="idInput" placeholder="ID" maxlength="0"/>
            </div>
        </div>
        <div class="text-center">
            <button class="btn btn-primary" type="button" id="searchPatient" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

            <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
        </div>
    </form>
</div>


<script>
    //validate max length of input
    $('#idType').on('change', function () {
        var id = $('#idType').val();
        if (id === "pmino") {
            $('#idInput').attr('maxlength', '13');
        } else if (id === "icnew") {
            $('#idInput').attr('maxlength', '12');
        } else if (id === "icold") {
            $('#idInput').attr('maxlength', '8');
        } else if (id === "004") {
            $('#idInput').attr('maxlength', '10');
        } else if (id === "005") {
            $('#idInput').attr('maxlength', '10');
        }
    });


    //event on click search button
    $('#searchPatient').on('click', function () {
        searchPatient();
    });


    //seaching patient function   
    function searchPatient() {

        var opt = $('#idType option[disabled]:selected').val();

        //check if the input text or the select box is empty.

        if ($('#idInput').val() === "" || $('#idInput').val() === " ") {
            //if the id/ic input is empty
            bootbox.alert('Please key in PMI no. or IC no. or IDENTIFICATION no. to continue seaching process');
        } else if (opt === "-") {
            //if the select box is not selected
            bootbox.alert('Please select ID Type first.');
        } else {
            //if the select box is choosen and the input in key-in.

            //get value from text box and select box
            var idType = $('#idType').find(":selected").val();
            var idInput = $('#idInput').val();

            //run the MAIN ajax function
            $.ajax({
                async: true,
                type: "POST",
                url: "resultPatient.jsp",
                data: {'idType': idType, 'idInput': idInput},
                timeout: 10000,
                success: function (list) {

                    //split the data into an array
                    var array_data = String(list).split("|");

                    //function when the value that returned either empty/null or has value.
                    //customize this part only
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                    var pmiNo = array_data[0];
                    var name = array_data[2];
                    var icno = array_data[4];
                    var blood = array_data[16];
                    var oldicno = array_data[5];
                    var bdate = array_data[10];

                    $('#idInput').prop('readonly', true);
                    $('#pmino').val($.trim(pmiNo));
                    $('#pname').val($.trim(name));
                    $('#pnic').val($.trim(icno));
                    $('#pbtype').val($.trim(blood));
                    $('#poic').val($.trim(oldicno));
                    $('#pbdate').val($.trim(bdate));
                    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    bootbox.alert(err.Message);
                }
            });
        }
    }


    //event when press ENTER after inserting the ID
    $("#idInput").on("keydown", function (e) {

        var code = e.keyCode;
        if (code === 13) {
            e.preventDefault();
            searchPatient();
        }

    });


    //event on click clear buton
    $('#clearSearch').click(function () {
        $('#idInput').prop('readonly', false);
        $('#myForm2')[0].reset();
        $('#myForm')[0].reset();
    });
</script>