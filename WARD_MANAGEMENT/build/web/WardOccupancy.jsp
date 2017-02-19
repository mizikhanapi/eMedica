
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>

<%
    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012' ";
    ArrayList<ArrayList<String>> dataIdType;
    Conn conn = new Conn();
    dataIdType = conn.getData(idTYpe);
    String dataSystemStatus = session.getAttribute("SYSTEMSTAT").toString();

    String wname = "select ward_class_code, ward_class_name from wis_ward_class";
    ArrayList<ArrayList<String>> dataWname = conn.getData(wname);

%>

<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         header 
    <div w3-include-html="libraries/header.html"></div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="css/table.css">




     header 
</head>

<body>-->
    <!-- menu top -->
    <!--<div w3-include-html="libraries/topMenus.html"></div>-->
    <!-- menu top -->

    <!--<div class="container-fluid">-->
        <!--<div class="row">-->       
            <!-- menu side -->		
            <!--<div w3-include-html="libraries/sideMenus.jsp"></div>-->
            <!-- menu side -->	

            <!-- main -->		
            <!--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">-->




                <div class="row" id="register">
                    <div class="col-md-12">
                        <div class="thumbnail">
                            <h4>Ward Occupancy
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
                                    <label class="col-md-4 control-label" for="textinput">IC / ID No.</label>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control input-md" id="idInput" name="idInput" placeholder="ID" />
                                    </div>
                                    <button id="search_id" name="search_id" class="btn btn-info "><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>
                                </div>


                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
                                    <div class="col-md-4">
                                        <select id="WardType" name="Dis" class="form-control">
                                            <option value="" selected="" disabled=""> </option>

                                            <%                                int size = dataWname.size();

                                                for (int i = 0; i < size; i++) {
                                            %>
                                            <option value="<%= dataWname.get(i).get(0)%>"><%= dataWname.get(i).get(0)%> ( <%= dataWname.get(i).get(1)%> )</option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <button id="search_ward" name="search_ward" class="btn btn-info"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>
                                </div>   



                                <div class="text-center">
                                    <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                                    <button id="button2id" name="button2id" type="button" class="btn btn-success "><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>

                                </div>
                            </form>
                        </div>


                    </div>
                </div>

            <!--</div>-->

        <!--</div>-->
        <!-- main -->		

    <!--</div>-->





    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://www.w3schools.com/lib/w3data.js"></script>
    <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>

    <script src="assets/js/OPMain.js" type="text/javascript"></script>
    <script src="assets/js/onKeyPress.js" type="text/javascript"></script>
    <script>w3IncludeHTML();</script>  
    <script>
        var regex = new RegExp("^[0-9]+$");
        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        if (regex.test(str)) {
        return true;
        }

        e.preventDefault();
        return false;
        //validate max length of input
        $('#idType').on('change', function (e) {
            var id = $('#idType').val();

            if (id === "pmino") {
                $('#idInput').attr('maxlength', '13');
                $('#idInput').on('keydown', function (e) {
                    isNumberKey(e);
                });
            } else if (id === "pnic") {
                $('#idInput').attr('maxlength', '12');
                $('#idInput').keypress(function (e) {
                    isNumberKey(e);
                });
            } else if (id === "poic") {
                $('#idInput').attr('maxlength', '8');
            } else if (id === "pidno") {
                $('#idInput').attr('maxlength', '8');
            } else if (id === "004") {
                $('#idInput').attr('maxlength', '10');
            } else if (id === "005") {
                $('#idInput').attr('maxlength', '10');
            }
        });

        //seaching patient function   
        function searchPatient() {

            var opt = $('#idType option[disabled]:selected').val();
            $('#myForm2')[0].reset();
            $('#formPMI')[0].reset();
            $('#kinform')[0].reset();
            $('#empform')[0].reset();
            $('#famForm')[0].reset();
            $('#formMed')[0].reset();
            $("table tbody").remove();

            //check if the input text or the select box is empty.

            if ($('#idInput').val() === "" || $('#idInput').val() === " ") {
                //if the id/ic input is empty
                bootbox.alert('Please key in PMI no. or IC no. or IDENTIFICATION no. to continue seaching process');
            } else if (opt === "-") {
                //if the select box is not selected
                bootbox.alert('Please select ID Type first.');
            } else {
                //if the select box is choosen and the input in key-in.

                //show loading icon
                $body.addClass("loading");

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
                        //remove the loading 
                        $body.removeClass("loading");

                        //show console the returned data


                        //split the data into an array
                        var array_data = String(list).split("|");

                        //function when the value that returned either empty/null or has value.
                        //customize this part only
                        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////           
                        Main(array_data);
                        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                    
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        bootbox.alert(err.Message);
                    }
                });
            }

        }
        ;

        //event on click search button
        $('#search_id').on('click', function () {
            //console.log("lalu sini");
            search_id();
            //console.log(" sudah lalu sini");
        });

        //event when press ENTER after inserting the ID
        $("#idInput").on("keydown", function (e) {
            var code = e.keyCode;

            if (code === 13) {
                e.preventDefault();
                search_id();

            }
        });

        //event on click clear buton
        $('#clearSearch').click(function () {
            $('#myForm2')[0].reset();
            $('#formPMI')[0].reset();
            $('#kinform')[0].reset();
            $('#empform')[0].reset();
            $('#famForm')[0].reset();
            $('#formMed')[0].reset();
            $("table tbody").remove();
        });
    </script>
</body>



