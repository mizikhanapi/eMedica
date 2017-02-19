<%-- 
    Document   : atcTable
    Created on : Jan 25, 2017, 12:33:56 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>



<%
    Conn conn = new Conn();
%>


<table  id="supplierTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Id</th>
    <th>Name</th>
    <th>Email</th>
    <th>Office No.</th>
    <th>Mobile No.</th>
    <th>Fax No.</th>
    <th>Address1</th>
    <th>Address2</th>
    <th>Address3</th>
    <th>District Code</th>
    <th>Town Code</th>
    <th>Postcode</th>
    <th>State Code</th>
    <th>Country Code</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String sql = " SELECT Supplier_ID, Supplier_Name,NULLIF(Email,''),Office_Tel_No,NULLIF(Mobile_No,''),NULLIF(Fax_No,''),NULLIF(ADDRESS1,''),NULLIF(ADDRESS2,''),NULLIF(ADDRESS3,''),NULLIF(DISTRICT_CODE,''),NULLIF(TOWN_CODE,''),NULLIF(POSTCODE,''),NULLIF(STATE_CODE,''),NULLIF(COUNTRY_CODE,'') FROM pis_supplier_info";
        ArrayList<ArrayList<String>> dataSupplier = conn.getData(sql);

        int size = dataSupplier.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
        <td><%= dataSupplier.get(i).get(0)%></td>
        <td><%= dataSupplier.get(i).get(1)%></td>
        <td><%= dataSupplier.get(i).get(2)%></td>
        <td><%= dataSupplier.get(i).get(3)%></td>
        <td><%= dataSupplier.get(i).get(4)%></td>
        <td><%= dataSupplier.get(i).get(5)%></td>
        <td><%= dataSupplier.get(i).get(6)%></td>
        <td><%= dataSupplier.get(i).get(7)%></td>
        <td><%= dataSupplier.get(i).get(8)%></td>
        <td><%= dataSupplier.get(i).get(9)%></td>
        <td><%= dataSupplier.get(i).get(10)%></td>
        <td><%= dataSupplier.get(i).get(11)%></td>
        <td><%= dataSupplier.get(i).get(12)%></td>
        <td><%= dataSupplier.get(i).get(13)%></td>
        <td>

            <!-- Update Part Start -->
            <a data-toggle="modal" data-target="#supplierUpdateModal_<%=i%>"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <!-- Modal Update -->

            <!-- Modal Update Supplier New Start -->
            <div class="modal fade" id="supplierUpdateModal_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                <div class="modal-dialog"  style="width:50%;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                            <h3 class="modal-title" id="lineModalLabel">Update Supplier</h3>
                        </div>
                        <div class="modal-body">

                            <!-- content goes here -->
                            <form class="form-horizontal" >
                                <div class="row">
                                    <div class="col-md-6">

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Supplier ID:</label>
                                            <div class="col-md-8">
                                                <input id="updateSupplier_ID_<%=i%>" type="text" class="form-control" placeholder="Supplier ID" value="<%= dataSupplier.get(i).get(0)%>" readonly>
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Supplier Name:</label>
                                            <div class="col-md-8">
                                                <input id="updateSupplier_Name_<%=i%>" type="text" class="form-control" placeholder="Supplier ID" value="<%= dataSupplier.get(i).get(1)%>">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Office No:</label>
                                            <div class="col-md-8">
                                                <input id="updateOffice_Tel_No_<%=i%>" type="text" class="form-control" placeholder="Office No" value="<%= dataSupplier.get(i).get(3)%>">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Email:</label>
                                            <div class="col-md-8">
                                                <input id="updateEmail_<%=i%>" type="text" class="form-control" placeholder="Email" value="<%= dataSupplier.get(i).get(2)%>">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Address 1:</label>
                                            <div class="col-md-8">
                                                <input id="updateADDRESS1_<%=i%>" type="text" class="form-control" value="<%= dataSupplier.get(i).get(6)%>">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Address 2:</label>
                                            <div class="col-md-8">
                                                <input id="updateADDRESS2_<%=i%>" type="text" class="form-control" value="<%= dataSupplier.get(i).get(7)%>">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Address 3:</label>
                                            <div class="col-md-8">
                                                <input id="updateADDRESS3_<%=i%>" type="text" class="form-control" value="<%= dataSupplier.get(i).get(8)%>">
                                            </div>
                                        </div>


                                    </div>

                                    <div class="col-md-6">

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">District Code:</label>
                                            <div class="col-md-8">
                                                <input id="updateDISTRICT_CODE_<%=i%>" type="text" class="form-control" value="<%= dataSupplier.get(i).get(9)%>">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Town Code:</label>
                                            <div class="col-md-8">
                                                <input id="updateTOWN_CODE_<%=i%>" type="text" class="form-control" value="<%= dataSupplier.get(i).get(10)%>">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Postcode:</label>
                                            <div class="col-md-8">
                                                <input id="updatePOSTCODE_<%=i%>" type="text" class="form-control" value="<%= dataSupplier.get(i).get(11)%>">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">State Code:</label>
                                            <div class="col-md-8">
                                                <input id="updateSTATE_CODE_<%=i%>" type="text" class="form-control" value="<%= dataSupplier.get(i).get(12)%>">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Country Code:</label>
                                            <div class="col-md-8">
                                                <input id="updateCOUNTRY_CODE_<%=i%>" type="text" class="form-control" value="<%= dataSupplier.get(i).get(13)%>">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Mobile No:</label>
                                            <div class="col-md-8">
                                                <input id="updateMobile_No_<%=i%>" type="text" class="form-control" value="<%= dataSupplier.get(i).get(4)%>">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Fax No:</label>
                                            <div class="col-md-8">
                                                <input id="updateFax_No_<%=i%>" type="text" class="form-control" value="<%= dataSupplier.get(i).get(5)%>">
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </form>
                            <!-- content goes here -->
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                <div class="btn-group" role="group">
                                    <button type="submit" id="updateSupplierButton_<%=i%>" class="btn btn-success btn-block btn-lg" role="button">Update</button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="button" id="updateSupplierReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Update Supplier New End -->




            <!-- Modal Update -->

        </td>
        <!-- Update Part End -->

        <!-- Delete Part Start -->
        <td>
            <!-- Delete Button Start -->
            <a id="supllierDeleteButton_<%=i%>" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
            <!-- Delete Button End -->

            <script type="text/javascript" charset="utf-8">

                $(document).ready(function () {
                    $("#supllierDeleteButton_<%=i%>").click(function () {

                        var conf = confirm('Are you sure want to delete?');
                        if (conf) {

                            var data = {
                                iditem: "<%=dataSupplier.get(i).get(0)%>"
                            };

                            $.ajax({
                                url: "supplierDelete.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000, // 10 seconds
                                success: function (datas) {

                                    if (datas.trim() === 'Success') {
                                        $('#contentSupplierTable').load('supplierTable.jsp');
                                        alert("Delete Success");
                                    } else if (datas.trim() === 'Failed') {
                                        alert("Delete failed!");
                                    }

                                },
                                error: function (err) {
                                    alert("Error! Deletion failed!!");
                                }

                            });

                        }

                    });

                    $("#updateSupplierButton_<%=i%>").click(function () {

                        var Supplier_ID = $('#updateSupplier_ID_<%=i%>').val();
                        var Supplier_Name = $('#updateSupplier_Name_<%=i%>').val();
                        var Office_Tel_No = $('#updateOffice_Tel_No_<%=i%>').val();
                        var Email = $('#updateEmail_<%=i%>').val();
                        var ADDRESS1 = $('#updateADDRESS1_<%=i%>').val();
                        var ADDRESS2 = $('#updateADDRESS2_<%=i%>').val();
                        var ADDRESS3 = $('#updateADDRESS3_<%=i%>').val();

                        var DISTRICT_CODE = $('#updateDISTRICT_CODE_<%=i%>').val();
                        var TOWN_CODE = $('#updateTOWN_CODE_<%=i%>').val();
                        var POSTCODE = $('#updatePOSTCODE_<%=i%>').val();
                        var STATE_CODE = $('#updateSTATE_CODE_<%=i%>').val();
                        var COUNTRY_CODE = $('#updateCOUNTRY_CODE_<%=i%>').val();
                        var Mobile_No = $('#updateMobile_No_<%=i%>').val();
                        var Fax_No = $('#updateFax_No_<%=i%>').val();


                        var data = {
                            Supplier_ID: Supplier_ID,
                            Supplier_Name: Supplier_Name,
                            Office_Tel_No: Office_Tel_No,
                            Email: Email,
                            ADDRESS1: ADDRESS1,
                            ADDRESS2: ADDRESS2,
                            ADDRESS3: ADDRESS3,
                            DISTRICT_CODE: DISTRICT_CODE,
                            TOWN_CODE: TOWN_CODE,
                            POSTCODE: POSTCODE,
                            STATE_CODE: STATE_CODE,
                            COUNTRY_CODE: COUNTRY_CODE,
                            Mobile_No: Mobile_No,
                            Fax_No: Fax_No
                        };

                        $.ajax({
                            url: "supplierUpdate.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000,
                            success: function (datas) {
                                if (datas.trim() === 'Success') {
                                    $('#contentSupplierTable').load('supplierTable.jsp');
                                    $(".modal-backdrop").hide();
                                    alert("Update Success");
                                } else if (datas.trim() === 'Failed') {
                                    alert("Update failed!");

                                }
                            },
                            error: function (err) {
                                alert("Error update!");
                            }

                        });
                    });

                });
            </script>  
        </td>
        <!-- Delete Part End -->


    </tr>

    <%
        }
    %>

</tbody>
</table>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#supplierTable').DataTable();
    });
</script>