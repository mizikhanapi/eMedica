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
                              String key = request.getParameter("input3");
                              // String key = "B,X79wb";
                               
                               String DescPe = "";
                               String CodePe = "";
                               ArrayList<String> pe3 = new ArrayList<String>();

                               
                                String searchPE3 = "select * from cis_pe_3 where pe_2_cd like '%" +  key + "%'";
                                String searchPE4 = "select * from cis_pe_4 where pe_3_cd like '%" +  key + "%'";
                                String searchPE5 = "select * from cis_pe_5 where pe_4_cd like '%" +  key + "%'";
                                String searchPE6 = "select * from cis_pe_6 where pe_5_cd like '%" +  key + "%'";
                                String searchPE7 = "select * from cis_pe_7 where pe_6_cd like '%" +  key + "%'";
                                String searchPE8 = "select * from cis_pe_8 where pe_7_cd like '%" +  key + "%'";
                                
                               
                                ArrayList<ArrayList<String>> searchPe3 = Conn.getData(searchPE3);
                                ArrayList<ArrayList<String>> searchPe4 = Conn.getData(searchPE4);
                                ArrayList<ArrayList<String>> searchPe5 = Conn.getData(searchPE5);
                                ArrayList<ArrayList<String>> searchPe6 = Conn.getData(searchPE6);
                                ArrayList<ArrayList<String>> searchPe7 = Conn.getData(searchPE7);
                                ArrayList<ArrayList<String>> searchPe8 = Conn.getData(searchPE8);
                                //out.print(search);
                                
     for(int pe = 0; pe < searchPe3.size(); pe++){
                                    DescPe = DescPe+searchPe3.get(pe).get(1) + "|";
                                }
                                
                                for(int peCd = 0; peCd<searchPe3.size();peCd++){
                                    CodePe = CodePe+searchPe3.get(peCd).get(0) + "|";
                                }
                                

      
if(searchPe3.size()<1){
    out.print("none");
} else{
       out.print(DescPe+"!"+CodePe);
}%>