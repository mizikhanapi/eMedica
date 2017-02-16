<%-- 
    Document   : CIS020011_1
    Created on : Feb 15, 2017, 10:00:30 AM
    Author     : -D-
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>

<%
    String pmiNo = session.getAttribute("patientPMINo").toString();
    String hfc_cd = "KLINIK KESIHATAN UTEM";
    
    Conn conn = new Conn();
    
    String orderNo;
    String itemCd;
    String remarks;
    String procedureName;
    String modalityName;
    String bodySystemName;
    String diagnosis;
    
   
    
String sqlRIS = "SELECT lis_order_detail.order_no,lis_order_detail.item_cd,lis_order_detail.item_name,lis_order_detail.spe_source,lis_order_detail.volume,lis_order_detail.comment,lis_order_detail.filler_comments FROM  lis_order_detail INNER JOIN lis_order_master ON lis_order_detail.order_no = lis_order_master.order_no WHERE lis_order_master.pmi_no='"+pmiNo+"' AND lis_order_master.hfc_cd  = '" +hfc_cd+"'";
ArrayList<ArrayList<String>> dataRIS = conn.getData(sqlRIS);
//out.print(dataRIS);
%>
<table class="table table-striped table-filter table-bordered" id="lisTable">
    <thead>
        <tr>
            <th>Order No</th>
            <th>Item Name</th>
            <th>Volume</th>
            <th>Specimen Source</th>
            <th>Comments</th>
            <th>Filler Comments</th>

   
        </tr>
    </thead>
    <tbody>
        <%
            for(int i=0; i<dataRIS.size();i++){
                %>
                <tr>
                    <td><%out.print(dataRIS.get(i).get(0));%></td>
                    <td><%out.print(dataRIS.get(i).get(2));%></td>
                    <td><%out.print(dataRIS.get(i).get(4));%></td>
                    <td><%out.print(dataRIS.get(i).get(3));%></td>
                    <td><%out.print(dataRIS.get(i).get(5));%></td>
                    <td><%out.print(dataRIS.get(i).get(6));%></td>

                
        
           
                </tr>
                <%
            }
            %>




    </tbody>
</table>
<%


    


    
%>
