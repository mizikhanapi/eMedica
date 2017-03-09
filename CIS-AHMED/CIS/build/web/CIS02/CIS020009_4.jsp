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
                              String key = request.getParameter("input4");

                               String DescPe = "";
                               String CodePe = "";
 
                                String searchPE4 = "select * from cis_pe_4 where pe_3_cd like '%" +  key + "%'";

                                
                               
                                
                                ArrayList<ArrayList<String>> searchPe4 = Conn.getData(searchPE4);

                                //out.print(search);
                                
                              
     for(int pe = 0; pe < searchPe4.size(); pe++){
                                    DescPe = DescPe+searchPe4.get(pe).get(1) + "|";
                                }
                                
                                for(int peCd = 0; peCd<searchPe4.size();peCd++){
                                    CodePe = CodePe+searchPe4.get(peCd).get(0) + "|";
                                }
                                
    
if(searchPe4.size()<1){
    out.print("none");
} else{
       out.print(DescPe+"!"+CodePe);
}%>