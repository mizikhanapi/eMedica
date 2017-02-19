
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String key = request.getParameter("input");
    //String key1 = request.getParameter("input2");

    Conn conn = new Conn();

    String searchProblem = "select d_trade_name from pis_mdc2 where CONCAT(UPPER(d_trade_name),LOWER(d_trade_name)) like '%" + key + "%'";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {
%>
<ul id="matchList" style="width: 100%; height: 200px; overflow: auto;padding-bottom: 5%">
    <% for (int i = 0; i < search.size(); i++) {%>
    <li onClick= "'<%=search.get(i).get(0)%>';"><%=search.get(i).get(0)%></li>
        <%}%>
</ul>
<%} else {%>
<span>No Record Found!</span>
<%}%>
