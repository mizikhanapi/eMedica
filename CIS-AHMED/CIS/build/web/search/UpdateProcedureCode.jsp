<%-- 
    Document   : UpdateProcedureCode
    Created on : 02-Feb-2017, 17:01:21
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
    //String key = request.getParameter("input");
    String id = request.getParameter("id");
    
    id.toLowerCase();
    String searchProblem = "select procedure_1_cd from cis_procedure_1 where CONCAT(UPPER(procedure_1_name),LOWER(procedure_1_name)) like '%" + id + "%' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

//            out.println(search.get(i).get(0));
//            out.println(search.get(i).get(1));
//            out.println(search.get(i).get(2));
            out.print(String.join("|", search.get(i)));
        }
    }
%>                        