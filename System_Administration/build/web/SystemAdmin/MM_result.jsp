<%-- 
    Document   : MM_result
    Created on : Feb 7, 2017, 2:35:43 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String key = request.getParameter("input");
    String searchProblem = "SELECT system_code, system_name FROM adm_system WHERE system_code like '%"+key+"%' OR system_name like '%"+key+"%'";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0)
            {
%>
<ul id="MM_matchList" style="width: 300px; height: 200px; overflow: auto">
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

