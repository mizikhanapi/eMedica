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
                               String DescPe = "";
                               String CodePe = "";

                                String searchPE7 = "select * from cis_pe_7 where pe_6_cd like '%" +  key + "%'";
                                String searchPE8 = "select * from cis_pe_8 where pe_7_cd like '%" +  key + "%'";

                                ArrayList<ArrayList<String>> searchPe7 = Conn.getData(searchPE7);
                                ArrayList<ArrayList<String>> searchPe8 = Conn.getData(searchPE8);
                                
                                for(int pe = 0; pe < searchPe7.size(); pe++){
                                    DescPe = DescPe+searchPe7.get(pe).get(1) + "|";
                                }
                                
                                for(int peCd = 0; peCd<searchPe7.size();peCd++){
                                    CodePe = CodePe+searchPe7.get(peCd).get(0) + "|";
                                }
                                


if(searchPe7.size()<1){
    out.print("none");
} else{
       out.print(DescPe+"!"+CodePe);
}%>