<%-- 
    Document   : CIS020009_1
    Created on : Feb 7, 2017, 4:05:46 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                              String key = request.getParameter("input");
    
                              
                                String DescPe = "";
                                String CodePe ="";
                                String searchPE0 = "select * from cis_physical_exam_system where physical_exam_cd like '%" +  key + "%'";
                                String searchPE1 = "select * from cis_pe_1 where physical_exam_cd like '%" +  key + "%'";

                                //out.print(searchPE0);
                                ArrayList<ArrayList<String>> search = Conn.getData(searchPE0); 
                                ArrayList<ArrayList<String>> searchPe1 = Conn.getData(searchPE1); 

                                String searchPE2 = "select * from cis_pe_2 where pe_1_cd like '%" +  key + "%'";
                                String searchPE3 = "select * from cis_pe_3 where pe_2_cd like '%" +  key + "%'";
                                String searchPE4 = "select * from cis_pe_4 where pe_3_cd like '%" +  key + "%'";
                                String searchPE5 = "select * from cis_pe_5 where pe_4_cd like '%" +  key + "%'";
                                String searchPE6 = "select * from cis_pe_6 where pe_5_cd like '%" +  key + "%'";
                                String searchPE7 = "select * from cis_pe_7 where pe_6_cd like '%" +  key + "%'";
                                String searchPE8 = "select * from cis_pe_8 where pe_7_cd like '%" +  key + "%'";
                                
                                ArrayList<ArrayList<String>> searchPe2 = Conn.getData(searchPE2);
                                ArrayList<ArrayList<String>> searchPe3 = Conn.getData(searchPE3);
                                ArrayList<ArrayList<String>> searchPe4 = Conn.getData(searchPE4);
                                ArrayList<ArrayList<String>> searchPe5 = Conn.getData(searchPE5);
                                ArrayList<ArrayList<String>> searchPe6 = Conn.getData(searchPE6);
                                ArrayList<ArrayList<String>> searchPe7 = Conn.getData(searchPE7);
                                ArrayList<ArrayList<String>> searchPe8 = Conn.getData(searchPE8);
                                //out.print(searchPe1);
                      
                                 for(int pe = 0; pe < searchPe1.size(); pe++){
                                    DescPe = DescPe+searchPe1.get(pe).get(1) + "|"; 
                                }
                                
                              for(int pecd = 0; pecd < searchPe1.size(); pecd++){
                                    CodePe = CodePe+searchPe1.get(pecd).get(0) + "|"; 
                                    //out.print(searchPe1.get(pecd).get(0) + "|" );
                                }

                                
                                out.print(DescPe+"!"+CodePe);
           

%>
