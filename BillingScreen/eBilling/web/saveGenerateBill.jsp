<%-- 
    Document   : saveGenerateBill
    Created on : Feb 2, 2017, 9:16:21 PM
    Author     : Mike Ho
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Class.Month"%>
<%@page import="dbConn.Conn"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String orderNo = request.getParameter("orderNo");
    String pmiNo = request.getParameter("pmiNo");
    String billNo = request.getParameter("billNo");
    String txnDate = request.getParameter("txnDate");
    String patientName = request.getParameter("patientName");
    String tableItem = request.getParameter("tableItem");
    String grandTotal = request.getParameter("grandTotal");
    double totalItemQuantity = 0;
    
    // this parses the json
    JSONArray jArr = new JSONArray(tableItem);
    
    for (int i = 0; i < jArr.length() - 1; i++){
        JSONObject jObj = jArr.getJSONObject(i);
        String itemCode = jObj.get("itemCode").toString();
        String itemDesc = jObj.get("itemDesc").toString();
        String itemQty = jObj.get("itemQty").toString();
        String unitPrice = jObj.get("unitPrice").toString();
        String totalPrice = jObj.get("totalPrice").toString();
        
        String sql1 = "INSERT into far_customer_dtl(bill_no, txn_date, item_cd, item_desc, item_amt, quantity, customer_id) "
                + "VALUES('"+ billNo +"','"+ txnDate +"','"+ itemCode +"','"+ itemDesc +"','"+ totalPrice +"','"+ itemQty +"','"+ pmiNo +"' )";
        Conn.setData(sql1);

        //Calculate total items
        totalItemQuantity += Double.parseDouble(itemQty);
    }
           
    String sql2 = "INSERT into far_customer_hdr(customer_id, bill_no, txn_date, item_desc, item_amt, quantity, order_no, payment, amt_paid)"
            + "VALUES('"+ pmiNo +"','"+ billNo +"','"+ txnDate +"','"+ "" +"','"+ grandTotal +"','"+ totalItemQuantity +"' , '"+ orderNo +"', 'Unpaid', '0')";
    Conn.setData(sql2);

    //Get customer_ledger current month debit add to current bill total
    String debitMonth = new Month().getDebitMonth();
    String sql3 = "SELECT cl."+ debitMonth +" "
            + "FROM far_customer_ledger cl, pms_patient_biodata pb "
            + "WHERE cl.customer_id  = '"+ pmiNo +"' "
            + "AND pb.pmi_no = '"+ pmiNo +"' ";
    ArrayList<ArrayList<String>> data = Conn.getData(sql3);

    if (data.isEmpty()) {
        //When no customer exist, insert
        String sql4 = "INSERT into far_customer_ledger(customer_id, bill_no, txn_date, bill_desc, bill_amt, "+ debitMonth +" )"
                + "VALUES('"+ pmiNo +"', '"+ billNo +"', '"+ txnDate +"', '"+ "" +"', '"+ grandTotal +"', '"+ grandTotal +"' )";
        Conn.setData(sql4);

    } else {
        //When customer exits, update but no value in that month
        if (data.get(0).get(0) == null){
            String sql5 = "UPDATE far_customer_ledger "
                    + "SET "+ debitMonth +" = '"+ grandTotal +"', bill_amt = '"+ grandTotal +"', txn_date = '"+ txnDate +"' "
                    + "WHERE customer_id = '"+ pmiNo +"' ";
            Conn.setData(sql5);

        }else{
            //When current month debit exist update
            double debit = Double.parseDouble(data.get(0).get(0)) + Double.parseDouble(grandTotal);
            String sql5 = "UPDATE far_customer_ledger "
                    + "SET "+ debitMonth +" = '"+ debit +"', bill_amt = '"+ grandTotal +"', txn_date = '"+ txnDate +"' "
                    + "WHERE customer_id = '"+ pmiNo +"' ";
            Conn.setData(sql5);
        }
    }

    String infoMessage = "Bill created successfully.";
    out.print("-|1|" + infoMessage);
%>
