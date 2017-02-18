<%-- 
    Document   : deleteItem
    Created on : Jan 23, 2017, 12:32:12 AM
    Author     : Mike Ho
--%>

<%@page import="Class.Month"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String billNo = request.getParameter("billNo");
    String custID = request.getParameter("custID");
    String itemCode = request.getParameter("itemCode");
    String qty = request.getParameter("qty");
    String itemAmt = request.getParameter("itemAmt");
    
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
    String txnDate = dateFormat.format(new Date());

    //Delete from customer dtl
    String sql1 = "DELETE FROM  far_customer_dtl "
           + "WHERE bill_no = '"+ billNo +"' "
           + "AND item_cd = '"+ itemCode +"' ";
    dbConn.Conn.setData(sql1);

    String month = new Month().getDebitMonth();

    //Get current credit of customer
    String sql2 = "SELECT  "+ month +" "
            + "FROM far_customer_ledger "
            + "WHERE customer_id = '"+ custID +"' ";
    ArrayList<ArrayList<String>> data1 = dbConn.Conn.getData(sql2);
    String currentDebit = data1.get(0).get(0);
    
    if (currentDebit == null){
        currentDebit = "0";
    }
    currentDebit = String.valueOf(Double.parseDouble(currentDebit) - Double.parseDouble(itemAmt));

    //Update customer ledger
    String sql3 = "UPDATE far_customer_ledger "
            + "SET "+ month +" = '"+ currentDebit +"' "
            + "WHERE customer_id = '"+ custID +"' ";
    dbConn.Conn.setData(sql3);

    //Get current bill_amt and minus item price;
    String sql4 = "SELECT item_amt, quantity "
            + "FROM far_customer_hdr "
            + "WHERE customer_id = '"+ custID +"' "
            + "AND bill_no = '"+ billNo +"'";
    ArrayList<ArrayList<String>> data2 = dbConn.Conn.getData(sql4);
    String itemAmt1 = data2.get(0).get(0);
    String quantity = data2.get(0).get(1);

    itemAmt1 = String.valueOf(Double.parseDouble(itemAmt1) - Double.parseDouble(itemAmt));
    quantity = String.valueOf(Integer.parseInt(quantity) - Integer.parseInt(qty));

    //Update customer hdr
    String sql5 = "UPDATE far_customer_hdr "
            + "SET txn_date = '"+ txnDate +"', item_amt = '"+ itemAmt1 +"', quantity = '"+ quantity +"' "
            + "WHERE bill_no = '"+ billNo +"' "
            + "AND customer_id = '"+ custID +"'";
    dbConn.Conn.setData(sql5);
%>