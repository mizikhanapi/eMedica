<%-- 
    Document   : UM_result
    Created on : Feb 17, 2017, 10:50:52 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String key = request.getParameter("input");
    String searchProblem = "SELECT hfc_cd, hfc_name FROM adm_health_facility WHERE hfc_cd like '%"+key+"%' OR hfc_name like '%"+key+"%'";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0)
            {
%>
<ul id="UM_hfc_matchlist" style="width: 300px; height: 100px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++)
        {
    %>
    <li><a style="cursor:pointer"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
    <%
        }
    %>
</ul>
    
<%}else{%>
<span>No Record Found!</span>
<% 
    }
%>