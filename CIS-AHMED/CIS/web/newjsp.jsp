<%-- 
    Document   : newjsp
    Created on : 09-Mar-2017, 10:48:28
    Author     : ahmed
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
//    Config.getBase_url(request);
//    Config.getFile_url(session);
    Conn conn = new Conn();
   
//    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//    Date date = new Date();

    String pmi_no = request.getParameter("pmi_no");
    String episodeDate = request.getParameter("episodeDate");
    String sql = "";
    //out.println(pmi_no);
    //out.println(episodeDate);


    
        sql = "select icd10_description from lhr_family_history where pmi_no = '"+pmi_no+"' and episode_date = '"+episodeDate+"'";
        ArrayList<ArrayList<String>> searchEpisode = conn.getData(sql);
    //out.println(searchEpisode);
    
%>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;">
                        <tbody id="detailbyepisode">
                            <tr data-status="pagado">
                                <%
                                      if(searchEpisode.size() > 0){
                                for (int i = 0; i < searchEpisode.size(); i++) {
          
                                %>
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary">Chief Complaint : <%=searchEpisode.get(i).get(0)%></p>
                                        </div>
                                    </div>
                                </td>
                                <%}}%>
                            </tr>
                             <tr data-status="pagado">
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary">Back pain Moderate, Right</p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                             <tr data-status="pagado">
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary">Back pain Moderate, Right</p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr data-status="pagado">
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary">Back pain Moderate, Right</p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr data-status="pagado">
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary">Back pain Moderate, Right</p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                             <tr data-status="pagado">
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary">Back pain Moderate, Right</p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
    </body>
</html>
