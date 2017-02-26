<%-- 
    Document   : printPaidReceipt
    Created on : Feb 25, 2017, 5:58:23 PM
    Author     : Mike Ho
--%>

<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String billNo = request.getParameter("billNo");
    String custId = request.getParameter("custID");
    
    String sql = "SELECT item_cd, item_desc, item_amt "
            + "FROM far_customer_dtl "
            + "WHERE bill_no = '"+ billNo +"' "
            + "AND customer_id = '"+ custId +"'";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);

    String sql1 = "SELECT item_amt "
            + "FROM far_customer_hdr "
            + "WHERE bill_no = '"+ billNo +"'"
            + "AND customer_id = '"+ custId +"'";
    ArrayList<ArrayList<String>> data1 = Conn.getData(sql1);
    String grandTotal = data1.get(0).get(0);

    String gstAmount = "0.00";
    String serviceChargeAmount = "0.00";
    String discountAmount = "0.00";
    double subtotalBeforeTax = 0;
    double rounding = 0;
    double subtotal = 0;

    for (int i = 0 ; i < data.size() ; i++){
        if (data.get(i).get(0).contains("BP") == false){
            subtotalBeforeTax += Double.parseDouble(data.get(i).get(2));
        } else {
            if (data.get(i).get(1).equalsIgnoreCase("gst")){
                gstAmount = data.get(i).get(2);
            } else if (data.get(i).get(1).equalsIgnoreCase("service charge")){
                serviceChargeAmount = data.get(i).get(2);
            } else if (data.get(i).get(1).equalsIgnoreCase("discount")){
                discountAmount = data.get(i).get(2);
            }
        }
        subtotal += Double.parseDouble(data.get(i).get(2));
    }

    rounding = Double.parseDouble(grandTotal) - subtotal;    
    out.print("-|1|" + "" + "|" + subtotal + "|" + grandTotal + "|" + "0.00" + "|" + gstAmount + "|" 
            + serviceChargeAmount + "|" + discountAmount + "|" + rounding);
%>