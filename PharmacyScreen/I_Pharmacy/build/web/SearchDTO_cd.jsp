<%-- 
    Document   : SearchDTO_cd
    Created on : 07-Feb-2017, 12:46:50
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    //String key = request.getParameter("input");
    String id = request.getParameter("id");
    
      Conn conn = new Conn ();
      
    //id.toLowerCase();
    String searchProblem = "select ud_mdc_code,d_gnr_name,d_stock_qty,d_route_code,d_form_code,d_strength,d_advisory_code,d_caution_code,d_packaging from pis_mdc2 where d_trade_name = '" + id + "' ";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {
        
        for (int i = 0; i < search.size(); i++) {

//            out.println(search.get(i).get(0));
//            out.println(search.get(i).get(1));
//            out.println(search.get(i).get(2));
            out.print(String.join("|", search.get(i)));
        }
    }
%>                           

