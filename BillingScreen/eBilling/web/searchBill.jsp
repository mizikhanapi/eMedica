<%-- 
    Document   : searchBill
    Created on : Dec 25, 2016, 8:27:18 PM
    Author     : Mike Ho
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ic = request.getParameter("ic");
    String status = request.getParameter("status");
    DecimalFormat df = new DecimalFormat("0.00");
    
    String query =
        "SELECT ch.bill_no, ch.customer_id, pb.patient_name, pb.new_ic_no, pb.id_no, "
        + "pb.home_address, pb.mobile_phone, ch.quantity, (ch.item_amt-ch.amt_paid), ch.txn_date "
        + "FROM far_customer_hdr ch, pms_patient_biodata pb "
        + "WHERE ch.payment = '"+ status +"' "
        + "AND pb.pmi_no = ch.customer_id "
        + "AND pb.new_ic_no = '"+ ic +"'";
    ArrayList<ArrayList<String>> data = Conn.getData(query);%>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; border-top: none;">
    <thead>
        <th>Transaction Date</th>
        <th>Bill No.</th>
        <th>Customer ID</th>
        <th>Name</th>
        <th>IC No.</th>
        <th>Other ID</th>
        <th>Phone No.</th>
        <th>Outstanding (RM)</th>
        <th></th>
    </thead>
    <tbody>
    <%
        if (!data.isEmpty()){
            System.out.print(data);
            for(int i = 0; i < data.size(); i++){
    %>
    <tr>
        <td><%=data.get(i).get(9)%></td>
        <td><%=data.get(i).get(0)%></td>
        <td><%=data.get(i).get(1)%></td>
        <td><%=data.get(i).get(2)%></td>
        <td><%=data.get(i).get(3)%></td>
        <td><%=data.get(i).get(4)%></td>
        <td><%=data.get(i).get(6)%></td>
        <td><%=data.get(i).get(8)%></td>
        <td><button id="select<%=i%>" class="btn btn-success pull-right" type="button">Select</button></td>
    </tr>
    <%}}%>
    </tbody>
</table>
    <script type="text/javascript">
        $(document).ready(function(){
<%
    if (!data.isEmpty()){
        for (int i = 0; i < data.size(); i++){  
%>
            $('#select<%=i%>').click(function(){
                var billNo = $(this).closest("tr").find("td:nth-child(2)").text();
                var custID = $(this).closest("tr").find("td:nth-child(3)").text();
                var status = $('#rbStatus a.active').html();
                status = String(status).toLowerCase();
                
                $.ajax({
                    url: "historyBillDetail.jsp",
                    type: "post",
                    data: {
                        custID:custID,
                        billNo: billNo,
                        status: status
                    },
                    timeout: 10000,
                    success: function(data) {
                        $('#loadBill').html(data);
                    },
                    error: function(err) {
                    }
                });
            });
<%}}%>
        });
    </script>
