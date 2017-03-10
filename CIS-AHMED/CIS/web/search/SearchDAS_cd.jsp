<%-- 
    Document   : SearchDAS_cd
    Created on : 06-Feb-2017, 11:42:25
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
    //String key = request.getParameter("input");
    String id = request.getParameter("id");
    
    //id.toLowerCase();
    String searchProblem = "SELECT rd_code FROM readcode_disability where rd_desc = '"+id+"' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    //out.print(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

               // out.println(search.get(i).get(0)));
//            out.println(search.get(i).get(1));
//            out.println(search.get(i).get(2));
            out.print(String.join("|", search.get(i)));
            
        }
    }
%>                
