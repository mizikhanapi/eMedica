<%--
    Document   : search
    Created on : Dec 25, 2016, 3:13:21 AM
    Author     : Mike Ho
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
  Date date = new Date();
  String strDate1 = df2.format(date);
 
  String ic = request.getParameter("ic");
  
    String sql = 
            "SELECT distinct "
                + "pe.episode_date, pom.order_no, pe.PMI_NO, pb.NEW_IC_NO, pb.ID_NO, "
                + "pb.PATIENT_NAME, pb.HOME_ADDRESS, "
                + "pb.MOBILE_PHONE "
                + "FROM pms_episode pe "
                + "INNER JOIN pis_order_master pom "
                + "ON pe.PMI_NO = pom.PMI_NO "
                + "INNER JOIN ehr_central ec "
                + "ON pe.PMI_NO = ec.PMI_NO "
                + "INNER JOIN pms_patient_biodata pb "
                + "ON ec.PMI_NO = pb.PMI_NO "
                + "WHERE (ec.status = 1 OR ec.status = 3) "
                + "AND pe.STATUS ='Discharge' "
                + "AND pom.episode_code like '"+ strDate1 +" %' " 
                + "AND pe.episode_date like '"+ strDate1 +" %' "
                + "AND pb.new_ic_no = '"+ ic +"' "
                + "AND NOT EXISTS ("
                + "SELECT ch.order_no FROM far_customer_hdr ch "
                + "WHERE ch.order_no =  pom.order_no) "
                + "GROUP BY pom.order_no";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);
%>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; border-top: none;">
    <thead>
        <th>Episode Date</th>
        <th>Order No</th>
        <th>PMI No.</th>
        <th>IC No.</th>
        <th>Other ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Phone No.</th>
        <th></th>
    </thead>
    <tbody>
        <%
            if (!data.isEmpty()){
                for(int i = 0; i < data.size(); i++){
        %>
        <tr>
            <td><%=data.get(i).get(0)%></td>
            <td><%=data.get(i).get(1)%></td>
            <td><%=data.get(i).get(2)%></td>
            <td><%=data.get(i).get(3)%></td>
            <td><%=data.get(i).get(4)%></td>
            <td><%=data.get(i).get(5)%></td>
            <td><%=data.get(i).get(6)%></td>
            <td><%=data.get(i).get(7)%></td>
            <td><button id="generate<%=i%>" class="btn btn-success pull-right">Generate Bill</button></td>
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
            $('#generate<%=i%>').click(function(){
                var orderNo = $(this).closest("tr").find("td:nth-child(2)").text();
                var pmiNo = $(this).closest("tr").find("td:nth-child(3)").text();

                $.ajax({
                    url: "generateBillDetail.jsp",
                    type: "post",
                    data: {
                        orderNo: orderNo,
                        pmiNo: pmiNo
                    },
                    timeout: 10000,
                    success: function(data) {
                        $('#generateBill').html(data);
                    },
                    error: function(err) {
                    }
                });
            });
<%}}%>
        });
    </script>