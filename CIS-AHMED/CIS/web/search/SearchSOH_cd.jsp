<%-- 
    Document   : SearchSOH_cd
    Created on : 07-Feb-2017, 11:16:52
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
    //String key = request.getParameter("input");
    String id = request.getParameter("id");

    String searchProblem = "SELECT rsh_code FROM readcode_social_history where rsh_desc = '" + id + "' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
   // out.print(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

//            out.println(search.get(i).get(0));
//            out.println(search.get(i).get(1));
//            out.println(search.get(i).get(2));
            out.print(String.join("|", search.get(i)));
        }
    }
%>        

