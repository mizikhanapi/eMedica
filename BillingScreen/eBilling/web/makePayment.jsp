<%-- 
    Document   : makePayment
    Created on : Feb 4, 2017, 10:10:14 PM
    Author     : Mike Ho
--%>

<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Class.Month"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
    Date date = new Date();
    String txnDate = dateFormat.format(date);
    
    String subtotal = request.getParameter("subTotal"); 
    String grandTotal = request.getParameter("grandTotal");
    String amount = request.getParameter("amtReceived");
    String method = request.getParameter("paymentMethod");
    String custId = request.getParameter("custID");
    String billNo = request.getParameter("billNo");
            
    //cash = csh
    //credit card = crc
    //cheque = chq

    if (method != null) {
        switch (method) {
            case "Cash":
                method = "csh";
                break;
            case "Credit Card":
                method = "crc";
                break;
            case "Cheque":
                method = "chq";
                break;
        }
    }
    
    Month month = new Month();
    month.setMonth(billNo.substring(10,12));
    month.determineCreditMonth();

    //Get current credit from customer ledger
    String sql = "SELECT cl." + month.getCreditMonth() + " "
            + "FROM far_customer_ledger cl, pms_patient_biodata pb "
            + "WHERE cl.customer_id = '" + custId + "' "
            + "AND pb.pmi_no = '" + custId + "'";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);
    String creditMonth = "0";

    if (data.isEmpty()){
        String infoMessage = "Customer ledger data not found.";
        out.print("|-1|" + infoMessage);
    } else {
        creditMonth = data.get(0).get(0);

        if (creditMonth == null)
            creditMonth = "0";
        
    if ((Double.parseDouble(amount) - Double.parseDouble(grandTotal)) > 1)
        creditMonth = String.valueOf(Double.parseDouble(creditMonth) + Double.parseDouble(grandTotal));
    else
        creditMonth = String.valueOf(Double.parseDouble(creditMonth) + Double.parseDouble(amount));

    //Update customer ledger credit
    String sql1 = "UPDATE far_customer_ledger "
            + "SET pay_method = '" + method + "', " + month.getCreditMonth() + " = '" + creditMonth + "', txn_date = '" + txnDate + "' "
            + "WHERE customer_id = '" + custId + "' ";
    Conn.setData(sql1);

    double cash = Double.parseDouble(amount);
    double amtPaid =0;
    String payment;
    if ((cash - Double.parseDouble(grandTotal)) >= 0){
        amtPaid = Double.parseDouble(grandTotal);
        payment = "Paid";
    } else {
        amtPaid = cash;
        payment = "Unpaid";
    }

    //Get amt_paid from customer
    String sql2 = "SELECT amt_paid "
            + "FROM far_customer_hdr "
            + "WHERE bill_no = '"+ billNo +"'";
    ArrayList<ArrayList<String>> data1 = Conn.getData(sql2);
    double amountPaid = Double.parseDouble(data1.get(0).get(0));

    amtPaid = amountPaid + amtPaid;

    //Update customer hdr bill 
    String sql3 = "UPDATE far_customer_hdr "
            + "SET payment = '"+ payment +"', txn_date = '" + txnDate + "', amt_paid = '"+ amtPaid +"' "
            + "WHERE bill_no = '" + billNo + "'";
    Conn.setData(sql3);

    String infoMessage = "Payment success.";
    out.print("-|1|" + infoMessage);

    //Print Receipt
    String gstAmount = "";
    String serviceChargeAmount = "";
    String discountAmount = "";
    double rounding = 0;
    
    String sql4 = "SELECT cd.item_desc, cd.item_amt "
            + "FROM far_customer_dtl cd, pms_patient_biodata pb "
            + "WHERE cd.item_cd LIKE 'BP%' "
            + "AND cd.bill_no = '"+ billNo +"' "
            + "AND cd.customer_id = '"+ custId +"' "
            + "AND pb.pmi_no = '"+ custId +"'";
    ArrayList<ArrayList<String>> bp = Conn.getData(sql4);

    if (bp != null){
        for (int i = 0 ; i < bp.size() ; i++){
            if (bp.get(i).get(0).equalsIgnoreCase("gst")){
                gstAmount = bp.get(i).get(1);
            } else if (bp.get(i).get(0).equalsIgnoreCase("service charge")){
                serviceChargeAmount = bp.get(i).get(1);
            } else if (bp.get(i).get(0).equalsIgnoreCase("discount")){
                discountAmount = bp.get(i).get(1);
            } 
            System.out.println(subtotal);
            subtotal += Double.parseDouble(bp.get(i).get(1));
        }
    }

    rounding = Double.parseDouble(grandTotal) - Double.parseDouble(subtotal);

    System.out.println("grand" + grandTotal);
    System.out.println("sub" + subtotal);
    System.out.println("round" + rounding);

    }    
%>