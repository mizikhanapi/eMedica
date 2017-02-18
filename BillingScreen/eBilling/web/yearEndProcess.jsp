<%-- 
    Document   : yearEndProcess
    Created on : Jan 15, 2017, 11:26:22 PM
    Author     : Mike Ho
--%>

<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.awt.Desktop"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String action = request.getParameter("action");
    String year =request.getParameter("year");
    
    if (action.equalsIgnoreCase("backup")){
        int status = backup();
        System.out.print(status);
        if(status == 100){
            String infoMessage = "Data has been backup.";
            out.print("-|1|" + infoMessage + "|" +  status);
            return;

        }else{
            String infoMessage = "There is an error during backup process.\n"
                    + "Please contact computer technician for fixing the issue.";
            out.print("-|-1|" + infoMessage + "|" + status);
            return;
        }
        
    } else if (action.equalsIgnoreCase("progress")){
        int status = startProcess(year);
        if(status == 0){
            String infoMessage = "The year end process of current year have been done.\nPlease go to report section to view year end report.";
            out.print("-|1|" + infoMessage + "|" + status);
        } else if(status == 50){
            String infoMessage = "There is an error during processing.\n"
                    + "Please restore the customer data and rerun the year end processing.";
            out.print("-|-1|" + infoMessage + "|" + status);
        }else if (status == 100){
            String infoMessage = "The year end processing is completed.";
            out.print("-|1|" + infoMessage + "|" + status);
        }
        return;
    } else if (action.equalsIgnoreCase("restore")){
        int status = restore();
        if (status == 100){
             String infoMessage = "The data has been restored.";
             out.print("-|1|" + infoMessage + "|" + status);
        } else{
            String infoMessage = "There is an error during restoring process.\n"
                    + "Please contact computer technician for fixing the issue.";
            out.print("-|-1|" + infoMessage + "|" + status);
        }
        return;
    } 
%>
<%!
    public int backup(){
        boolean bool = true;
        try{
            String sql1 = "DROP TABLE IF EXISTS far_customer_ledger_backup";
            bool = dbConn.Conn.setData(sql1);
            if (bool == false)
                return 0;
            String sql2 = "CREATE TABLE far_customer_ledger_backup LIKE far_customer_ledger";
            bool = dbConn.Conn.setData(sql2);
            if (bool == false)
                return 0;
            String sql3 = "INSERT far_customer_ledger_backup SELECT * FROM far_customer_ledger";
            bool = dbConn.Conn.setData(sql3);
            if (bool == false)
                return 0;
            
            String sql4 = "UPDATE far_year_end_parameter "
                    + "SET process_status = '1' "
                    + "WHERE code = 'yep'";
            dbConn.Conn.setData(sql4);
            
            return 100;
            
        } catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public int startProcess(String currentYear){
        try{
            String sql0 = "SELECT process_status, processed_year "
                    + "FROM far_year_end_parameter "
                    + "WHERE code = 'yep'";
            ArrayList<ArrayList<String>> yep= dbConn.Conn.getData(sql0);
            String processStatus = yep.get(0).get(0);
            String year = yep.get(0).get(1);
            
            String strYear = currentYear;
            strYear = String.valueOf(Integer.parseInt(strYear) - 1);

            if(processStatus.equals("1") && year.equals(strYear)){
                String sql1 = "SET autocommit = 0";
                dbConn.Conn.setData(sql1);

                String sql2 = 
                        "SELECT "
                        + "pb.pmi_no, "
                        //total credit of a year
                        + "IFNULL(cl.cr_amt_1, 0)+IFNULL(cl.cr_amt_2, 0)+IFNULL(cl.cr_amt_3, 0)+IFNULL(cl.cr_amt_4, 0)+"
                        + "IFNULL(cl.cr_amt_5, 0)+IFNULL(cl.cr_amt_6, 0)+IFNULL(cl.cr_amt_7, 0)+IFNULL(cl.cr_amt_8, 0)+"
                        + "IFNULL(cl.cr_amt_9, 0)+IFNULL(cl.cr_amt_10, 0)+IFNULL(cl.cr_amt_11, 0)+IFNULL(cl.cr_amt_12, 0)+"
                        + "IFNULL(cl.cr_amt_13, 0), "
                        //total debit of a year
                        + "IFNULL(cl.dr_amt_1, 0)+IFNULL(cl.dr_amt_2, 0)+IFNULL(cl.dr_amt_3, 0)+IFNULL(cl.dr_amt_4, 0)+"
                        + "IFNULL(cl.dr_amt_5, 0)+IFNULL(cl.dr_amt_6, 0)+IFNULL(cl.dr_amt_7, 0)+IFNULL(cl.dr_amt_8, 0)+"
                        + "IFNULL(cl.dr_amt_9, 0)+IFNULL(cl.dr_amt_10, 0)+IFNULL(cl.dr_amt_11, 0)+IFNULL(cl.dr_amt_12, 0)+"
                        + "IFNULL(cl.dr_amt_13, 0) "
                        + "FROM far_customer_ledger cl, pms_patient_biodata pb "
                        + "WHERE cl.customer_id = pb.pmi_no";
                ArrayList<ArrayList<String>> data = dbConn.Conn.getData(sql2);

                int flag = 0;
                for (int i = 0; i < data.size() && flag == 0; i++){
                    String pmiNo = data.get(i).get(0);
                    String totalYearCredit = data.get(i).get(1);
                    String totalYearDebit = data.get(i).get(2);
                    String sql3 = "UPDATE far_customer_ledger SET "
                            + "cr_amt_1 = '0', cr_amt_2 = '0', cr_amt_3 = '0', cr_amt_4 = '0', "
                            + "cr_amt_5 = '0', cr_amt_6 = '0', cr_amt_7 = '0', cr_amt_8 = '0', "
                            + "cr_amt_9 = '0', cr_amt_10 = '0', cr_amt_11 = '0', cr_amt_12 = '0', cr_amt_13 = '"+ totalYearCredit +"', "
                            + "dr_amt_1 = '0', dr_amt_2 = '0', dr_amt_3 = '0', dr_amt_4 = '0', "
                            + "dr_amt_5 = '0', dr_amt_6 = '0', dr_amt_7 = '0', dr_amt_8 = '0', "
                            + "dr_amt_9 = '0', dr_amt_10 = '0', dr_amt_11 = '0', dr_amt_12 = '0', dr_amt_13 = '"+ totalYearDebit +"' "
                            + "WHERE customer_id = '"+ pmiNo +"'";
                    boolean bool = dbConn.Conn.setData(sql3);

                    if(bool == false){
                        flag = 1;

                        String sql4 = "ROLLBACK";
                        dbConn.Conn.setData(sql4);

                        String sql6 = "SET autocommit = 1";
                        dbConn.Conn.setData(sql6);

                        return 50;
                    } else {
                        String sql5 = "COMMIT";
                        dbConn.Conn.setData(sql5);

                        if(i == (data.size()-1)){
                            String sql6 = "SET autocommit = 1";
                            dbConn.Conn.setData(sql6);
                            String sql7 = "UPDATE far_year_end_parameter "
                                    + "SET process_status = '0', processed_year = '"+ currentYear +"' "
                                    + "WHERE code = 'yep'";
                            dbConn.Conn.setData(sql7);

                            return 100;
                        }
                    }
                }
            } else {
                return 0;
            }
            return 0;
        }catch(Exception e){
            e.printStackTrace();
            return 50;
        }
    }

    public int restore(){
        boolean bool = true;
        try{
            String sql1 = "DROP TABLE IF EXISTS far_customer_ledger";
            dbConn.Conn.setData(sql1);
            if (bool == false)
                return 0;
            String sql2 = "CREATE TABLE far_customer_ledger LIKE far_customer_ledger_backup";
            dbConn.Conn.setData(sql2);
            if (bool == false)
                return 0;
            String sql3 = "INSERT far_customer_ledger SELECT * FROM far_customer_ledger_backup";
            dbConn.Conn.setData(sql3);
            if (bool == false)
                return 0;
           
            return 100;
            
        } catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
%>

