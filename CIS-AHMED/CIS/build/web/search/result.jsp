
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
                               String key = request.getParameter("input");
                                String searchProblem = "select RCC_DESC from READCODE_CHIEF_COMPLAINT where CONCAT(UPPER(RCC_DESC),LOWER(RCC_DESC)) like '%" +  key + "%'";
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                                 if (search.size() > 0) 
                                        {
%>
<ul id="matchList" style="width: 100%; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) 
                                            {%>
    <li onClick= "selectCountry('<%=search.get(i).get(0)%>');"><%=search.get(i).get(0)%></li>
<%}%>
</ul>
<%}else{%>
<span>No Record Found!</span>
<%}%>
