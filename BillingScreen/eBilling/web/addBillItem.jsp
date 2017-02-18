<%-- 
    Document   : addBillItem
    Created on : Feb 4, 2017, 7:10:56 PM
    Author     : Mike Ho
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Class.Month"%>
<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String itemType = request.getParameter("itemType");
    String custId = request.getParameter("custID");
    String billNo = request.getParameter("billNo");
    String itemCode = request.getParameter("itemCode");
    String name = request.getParameter("itemName");
    String unitPrice = request.getParameter("unitPrice");

    Date date = new Date();
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
    DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
    String strDate = dateFormat.format(date);
    String txnDate = dateFormat1.format(date);
    
    if (itemType.equalsIgnoreCase("M")) {
        double totalPrice = Double.parseDouble(unitPrice);
        double priceBeforeTax = totalPrice;

        //Search and add billing parameters
        String sql1 = 
            "SELECT param_code, param_name, param_value "
                + "FROM far_billing_parameter "
                + "WHERE enable = 'yes'";
        ArrayList<ArrayList<String>> billingParameters = Conn.getData(sql1);

        double[] amount = calculateAmount(billingParameters, totalPrice);
        totalPrice = amount[0];

        //Get bill's month debit and add the item price
        Month month = new Month();
        month.setMonth(billNo.substring(10,12));
        month.determineDebitMonth();

        String sql2 = "SELECT cl."+ month.getDebitMonth() +" "
                + "FROM far_customer_ledger cl, pms_patient_biodata pb "
                + "WHERE cl.customer_id = '"+ custId +"' "
                + "AND pb.pmi_no = '"+ custId +"'";
        ArrayList<ArrayList<String>> data1 = Conn.getData(sql2);
        String currentDebit = data1.get(0).get(0);

        currentDebit = String.valueOf(Double.parseDouble(currentDebit) + totalPrice);

        //Update customer ledger
        String sql3 = "UPDATE far_customer_ledger "
        + "SET "+ month.getDebitMonth() +" = '"+ currentDebit +"', txn_date = '"+ txnDate +"' "
        + "WHERE customer_id = '"+ custId +"' ";
        Conn.setData(sql3);

        //Update customer dtl
        String sql4 = "INSERT into far_customer_dtl (txn_date, item_cd, item_desc, item_amt, quantity, bill_no, customer_id) "
        + "VALUES('"+ txnDate +"', '"+ itemCode +"','"+ name +"','"+ priceBeforeTax +"','"+ 1 +"','"+ billNo +"','"+ custId +"')";
        ;
        Conn.setData(sql4);
        
        updateCustomerBillParameter(billingParameters, billNo, amount);

        //Get current bill_amt and add item price;
        String sql5 = "SELECT item_amt, quantity "
        + "FROM far_customer_hdr "
        + "WHERE customer_id = '"+ custId +"' "
        + "AND bill_no = '"+ billNo +"'";
        ArrayList<ArrayList<String>> data2 = Conn.getData(sql5);
        String itemAmt = data2.get(0).get(0);
        String quantity = data2.get(0).get(1);

        itemAmt = String.valueOf(Double.parseDouble(itemAmt) + totalPrice);
        quantity = String.valueOf(Integer.parseInt(quantity) + 1);

        //Update customer hdr
        String sql6 = "UPDATE far_customer_hdr "
        + "SET txn_date = '"+ txnDate +"', item_amt = '"+ itemAmt +"', quantity = '"+ quantity +"', payment = 'Unpaid' "
        + "WHERE bill_no = '"+ billNo +"' "
        + "AND customer_id = '"+ custId +"'";
        Conn.setData(sql6);

        String infoMessage = "Selected item added to bill successfully.";
        out.print("-|1|" + infoMessage);

    } else if (itemType.equalsIgnoreCase("D")) {
    
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double totalPrice = quantity * Double.parseDouble(unitPrice);
        double priceBeforeTax = totalPrice;
                
        //Search and add billing parameters
        String sql1 = 
            "SELECT param_code, param_name, param_value "
                + "FROM far_billing_parameter "
                + "WHERE enable = 'yes'";
        ArrayList<ArrayList<String>> billingParameters = Conn.getData(sql1);

        double[] amount = calculateAmount(billingParameters, totalPrice);
        totalPrice = amount[0];
        
        //Get bill's month debit and add the item price
        Month month = new Month();
        month.setMonth(billNo.substring(10,12));
        month.determineDebitMonth();

        String sql2 = "SELECT cl."+ month.getDebitMonth() +" "
                + "FROM far_customer_ledger cl, pms_patient_biodata pb "
                + "WHERE cl.customer_id = '"+ custId +"' "
                + "AND pb.pmi_no = '"+ custId +"'";
        ArrayList<ArrayList<String>> data1 = Conn.getData(sql2);

        String currentDebit = "";
        if (data1.get(0).get(0) == null){
            currentDebit = "0"; 
        } else {
            currentDebit = data1.get(0).get(0);
        }

        currentDebit = String.valueOf(Double.parseDouble(currentDebit) + totalPrice);
        
        //Update customer ledger
        String sql3 = "UPDATE far_customer_ledger "
                + "SET "+ month.getDebitMonth() +" = '"+ currentDebit +"', txn_date = '"+ txnDate +"' "
                + "WHERE customer_id = '"+ custId +"' ";
        Conn.setData(sql3);

        //Update customer dtl
        String sql4 = "INSERT into far_customer_dtl (txn_date, item_cd, item_desc, item_amt, quantity, bill_no, customer_id) "
        + "VALUES('"+ strDate +"', '"+ itemCode +"','"+ name +"','"+ priceBeforeTax +"','"+ quantity +"','"+ billNo +"', '"+ custId +"')";
        Conn.setData(sql4);

        updateCustomerBillParameter(billingParameters, billNo, amount);

        //Get current bill_amt and add item price;
        String sql5 = "SELECT item_amt, quantity "
                + "FROM far_customer_hdr "
                + "WHERE customer_id = '"+ custId +"' "
                + "AND bill_no = '"+ billNo +"'";
        ArrayList<ArrayList<String>> data2 = Conn.getData(sql5);
        String itemAmt = data2.get(0).get(0);
        String qty = data2.get(0).get(1);

        itemAmt = String.valueOf(Double.parseDouble(itemAmt) + totalPrice);
        qty = String.valueOf(Integer.parseInt(qty) + quantity);

        //Update customer hdr
        String sql6 = "UPDATE far_customer_hdr "
                + "SET item_amt = '"+ itemAmt +"', quantity = '"+ qty +"', payment = 'Unpaid' "
                + "WHERE bill_no = '"+ billNo +"' "
                + "AND customer_id = '"+ custId +"'";
        Conn.setData(sql6);

        String infoMessage = "Selected item added to bill successfully.";
        out.print("-|1|" + infoMessage);
    }
%>
<%!
    public double[] calculateAmount(ArrayList<ArrayList<String>> billingParameters, double totalPrice){
        DecimalFormat df = new DecimalFormat("0.00");
        double gst = 0;
        double serviceCharge = 0;
        double discount = 0;
        double discountAmount = 0;
        double serviceChargeAmount = 0;
        double gstAmount = 0;

        for (int i = 0 ; i < billingParameters.size() ; i++){
            if (billingParameters.get(i).get(1).equalsIgnoreCase("gst")){
                gst = Double.parseDouble(billingParameters.get(i).get(2));
            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("service charge")){
                serviceCharge = Double.parseDouble(billingParameters.get(i).get(2));
            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("discount")){
                discount = Double.parseDouble(billingParameters.get(i).get(2));
            }
        }

        //Calculate grand total
        discountAmount = totalPrice * discount;
        discountAmount = Double.parseDouble(df.format(discountAmount));
        totalPrice =  totalPrice - discountAmount;

        serviceChargeAmount = totalPrice * serviceCharge;
        serviceChargeAmount = Double.parseDouble(df.format(serviceChargeAmount));
        totalPrice = totalPrice + serviceChargeAmount;

        gstAmount = totalPrice * gst;
        gstAmount = Double.parseDouble(df.format(gstAmount));
        totalPrice = totalPrice + gstAmount;

        //Round the grand total
        totalPrice = Math.round(totalPrice * 20) / 20.0;
        
        return new double[]{totalPrice, gst, gstAmount, serviceCharge, serviceChargeAmount, discount, discountAmount};
    }    

    private void updateCustomerBillParameter(ArrayList<ArrayList<String>> billingParameters, String billNo, double[] amount){
        double gstAmount = amount[2];
        double serviceChargeAmount = amount[4];
        double discountAmount = amount[6];

        for (int i = 0 ; i < billingParameters.size() ; i++){
            if (billingParameters.get(i).get(1).equalsIgnoreCase("gst")){
                String sql5 = "SELECT item_amt "
                        + "FROM far_customer_dtl "
                        + "WHERE item_desc = 'gst' AND bill_no = '"+ billNo +"'";
                ArrayList<ArrayList<String>> itemAmt = Conn.getData(sql5);
                gstAmount = gstAmount + Double.parseDouble(itemAmt.get(0).get(0));

                String sql6 = "UPDATE far_customer_dtl "
                        + "SET item_amt = '"+ gstAmount +"' "
                        + "WHERE item_desc = 'gst' "
                        + "AND bill_no = '"+ billNo +"'";
                Conn.setData(sql6);

            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("service charge")){
                String sql5 = "SELECT item_amt "
                        + "FROM far_customer_dtl "
                        + "WHERE item_desc = 'service charge' AND bill_no = '"+ billNo +"'";
                ArrayList<ArrayList<String>> itemAmt = Conn.getData(sql5);
                serviceChargeAmount = serviceChargeAmount + Double.parseDouble(itemAmt.get(0).get(0));

                String sql6 = "UPDATE far_customer_dtl "
                        + "SET item_amt = '"+ serviceChargeAmount +"' "
                        + "WHERE item_desc = 'service charge' "
                        + "AND bill_no = '"+ billNo +"'";
                Conn.setData(sql6);

            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("discount")){
                String sql5 = "SELECT item_amt "
                        + "FROM far_customer_dtl "
                        + "WHERE item_desc = 'discount' AND bill_no = '"+ billNo +"'";
                ArrayList<ArrayList<String>> itemAmt = Conn.getData(sql5);

                discountAmount = discountAmount + Double.parseDouble(itemAmt.get(0).get(0));

                String sql6 = "UPDATE far_customer_dtl "
                        + "SET item_amt = '"+ discountAmount +"' "
                        + "WHERE item_desc = 'discount' "
                        + "AND bill_no = '"+ billNo +"'";
                Conn.setData(sql6);
            }
        }
    }
%>