<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String key = request.getParameter("input");
    String searchProblem = "SELECT master_reference_code, description FROM adm_lookup_master WHERE master_reference_code like '%"+key+"%' OR description like '%"+key+"%'";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0)
            {
%>
<ul id="matchList" style="width: 300px; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++)
        {
    %>
    <li value="<%=search.get(i).get(0)%>"><a style="cursor:pointer"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
    <%
        }
    %>
</ul>
    
<%}else{%>
<span>No Record Found!</span>
<% 
    }
%>

