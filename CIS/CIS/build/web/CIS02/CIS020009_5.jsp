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
                              String key = request.getParameter("input5");

                               String DescPe = "";
                               String CodePe = "";


                                String searchPE5 = "select * from cis_pe_5 where pe_4_cd like '%" +  key + "%'";
                                
                                ArrayList<ArrayList<String>> searchPe5 = Conn.getData(searchPE5);

                                //out.print(search);
                                     for(int pe = 0; pe < searchPe5.size(); pe++){
                                    DescPe = DescPe+searchPe5.get(pe).get(1) + "|";
                                }
                                
                                for(int peCd = 0; peCd<searchPe5.size();peCd++){
                                    CodePe = CodePe+searchPe5.get(peCd).get(0) + "|";
                                }
                                

    
if(searchPe5.size()<1){
    out.print("none");
} else{
       out.print(DescPe+"!"+CodePe);
}%>