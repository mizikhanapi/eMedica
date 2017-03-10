<%-- 
    Document   : searchDiscipline_cd
    Created on : 17-Feb-2017, 21:08:52
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    //String key = request.getParameter("input");
    String id = request.getParameter("id");
    
    //id.toLowerCase();
    String searchProblem = "SELECT discipline_cd FROM adm_discipline where discipline_name = '"+id+"'";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    //out.println(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

//            out.println(search.get(i).get(0));
//            out.println(search.get(i).get(1));
//            out.println(search.get(i).get(2));
            out.print(String.join("|", search.get(i).get(0)));
        }
    }
%>          
