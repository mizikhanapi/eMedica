<%-- 
    Document   : CIS020009_1
    Created on : Feb 7, 2017, 4:05:46 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="org.apache.commons.lang3.*"%>
<%
    Conn Conn = new Conn();
                              String key = request.getParameter("input");
                              // String key = "B,X79wb";
                               String dataPe3;
                               
                               String DescPe = "";
                               String CodePe = "";

                               ArrayList<String> pe3 = new ArrayList<String>();


                                String searchPE6 = "select * from cis_pe_6 where pe_5_cd like '%" +  key + "%'";
                                String searchPE7 = "select * from cis_pe_7 where pe_6_cd like '%" +  key + "%'";
                                String searchPE8 = "select * from cis_pe_8 where pe_7_cd like '%" +  key + "%'";
                                

                                ArrayList<ArrayList<String>> searchPe6 = Conn.getData(searchPE6);
                                ArrayList<ArrayList<String>> searchPe7 = Conn.getData(searchPE7);
                                ArrayList<ArrayList<String>> searchPe8 = Conn.getData(searchPE8);
                                
                                for(int pe = 0; pe < searchPe6.size(); pe++){
                                    DescPe = DescPe+searchPe6.get(pe).get(1) + "|";
                                }
                                
                                for(int peCd = 0; peCd<searchPe6.size();peCd++){
                                    CodePe = CodePe+searchPe6.get(peCd).get(0) + "|";
                                }
                                


if(searchPe6.size()<1){
    out.print("none");
} else{
       out.print(DescPe+"!"+CodePe);
}%>