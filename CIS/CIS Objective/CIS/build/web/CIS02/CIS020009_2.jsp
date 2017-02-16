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
                              String key = request.getParameter("input2");
                              // String key = "B,X79wb";
                         
                               String DescPe = "";
                               String CodePe = "";
                               
                               ArrayList<String> pe3 = new ArrayList<String>();

                                String searchPE2 = "select * from cis_pe_2 where pe_1_cd like '%" +  key + "%'";
                                String searchPE3 = "select * from cis_pe_3 where pe_2_cd like '%" +  key + "%'";
                                
                              
                                
                                ArrayList<ArrayList<String>> searchPe2 = Conn.getData(searchPE2);
                                ArrayList<ArrayList<String>> searchPe3 = Conn.getData(searchPE3);
                                
                                for(int pe = 0; pe < searchPe2.size(); pe++){
                                    DescPe = DescPe+searchPe2.get(pe).get(1) + "|";
                                }
                                
                                for(int peCd = 0; peCd<searchPe2.size();peCd++){
                                    CodePe = CodePe+searchPe2.get(peCd).get(0) + "|";
                                }
                                

      
if(searchPe2.size()<1){
    out.print("none");
} else{
       out.print(DescPe+"!"+CodePe);
}%>
