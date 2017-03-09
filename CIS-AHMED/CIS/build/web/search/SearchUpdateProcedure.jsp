<%-- 
    Document   : SearchUpdateProcedure
    Created on : 01-Feb-2017, 15:50:21
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
   // String key = request.getParameter("input");
    String id = request.getParameter("id");
    
    id.toLowerCase();
    String searchProblem = "select p.procedure_cd,p1.procedure_1_cd, p1.procedure_1_name from cis_procedure p, cis_procedure_1 p1 where p.`PROCEDURE_CD` = p1.`PROCEDURE_CD` and CONCAT(UPPER(PROCEDURE_NAME),LOWER(PROCEDURE_NAME)) like '%" + id + "%' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
   
//            out.println(search.get(i).get(0));
//            out.println(search.get(i).get(1));
//            out.println(search.get(i).get(2));
//            out.print(String.join("|", search.get(i)));
//        }
//    }
%>
  <div class="form-group">
                    <select name="pproType1" id="pproType" class="form-control input-lg">
                        <option value="1" selected="" disabled="">Procedure Types</option>
                        <% if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {
                         out.print(String.join("|", search.get(i).get(1)));
                        %>
                        <option value="<%=search.get(i).get(2)%>"><%=search.get(i).get(2)%></option>
                        <%}}%>
                    </select>
</div>