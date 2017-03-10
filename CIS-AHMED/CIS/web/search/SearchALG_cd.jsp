<%-- 
    Document   : SearchALG_cd
    Created on : 03-Feb-2017, 15:34:46
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    //String key = request.getParameter("input");
     Conn Conn = new Conn();
    String id = request.getParameter("id");
    
    id.toLowerCase();
    String searchProblem = "select ra_code from readcode_allergy where ra_desc like '%" + id + "%' ";
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
               
