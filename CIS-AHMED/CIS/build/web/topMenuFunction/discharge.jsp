<%-- 
    Document   : discharge
    Created on : Mar 3, 2017, 4:58:40 PM
    Author     : -D-
--%>

<%-- 
    Document   : RecieveData
    Created on : 19-Jan-2017, 16:43:33
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String notes = request.getParameter("notes");
    String pmino = request.getParameter("pmino");
    String episodedate = request.getParameter("episodedate");
    String status = request.getParameter("status");


    Conn conn = new Conn();

   boolean stats = conn.setData("INSERT INTO ehr_central(pmi_no, c_txndate, c_txndata, status) "
            + "VALUES('"+pmino+"','"+episodedate+"','"+notes+"','"+status+"') ");
    
   boolean updatePatientQueue = conn.setData("UPDATE pms_patient_queue SET status = '"+status+"' WHERE pmi_no = '"+pmino+"' AND episode_date = '"+episodedate+"';");
    boolean updatePMSEpisode = conn.setData("UPDATE pms_episode SET status = '"+status+"' WHERE pmi_no = '"+pmino+"' AND episode_date = '"+episodedate+"';");
    
    if (stats) {
            if (updatePatientQueue) {
                if (updatePMSEpisode) {
                    out.print("|1|");
                } else {
                    out.print("updatePMSEpisode not run");
                }
            } else {
                out.print("updatePatientQueue not run");
            }
        } else {
            out.print("|2|");
        }
    

            
%>