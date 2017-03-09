<%-- 
    Document   : physicalExamDirectory
    Created on : Feb 4, 2017, 5:58:55 PM
    Author     : -D-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@page import="Bean.PhysicalExamBean" %>
<%@ page buffer="8192kb" %>
<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn Conn = new Conn();

    String column = "physical_exam_cd, physical_exam_name, status";
    String table = "cis_physical_exam_system";
    String sqlpe0 = "SELECT " + column + " FROM " + table + " ";
    ArrayList<ArrayList<String>> datape0 = Conn.getData(sqlpe0);

    String column1 = "pe_1_cd, pe_1_name, physical_exam_cd, status";
    String table1 = "cis_pe_1";
    String sqlpe1 = "SELECT  DISTINCT " + column1 + " FROM " + table1 + " ";
    ArrayList<ArrayList<String>> datape1 = Conn.getData(sqlpe1);

    String column2 = "pe_2_cd, pe_2_name, pe_1_cd, status";
    String table2 = "cis_pe_2";
    String sqlpe2 = "SELECT DISTINCT " + column2 + " FROM " + table2 + " ";
    ArrayList<ArrayList<String>> datape2 = Conn.getData(sqlpe2);

    String column3 = "pe_3_cd, pe_3_name, pe_2_cd, status";
    String table3 = "cis_pe_3";
    String sqlpe3 = "SELECT  DISTINCT " + column3 + " FROM " + table3 + " ";
    ArrayList<ArrayList<String>> datape3 = Conn.getData(sqlpe3);

    String column4 = "pe_4_cd, pe_4_name, pe_3_cd, status";
    String table4 = "cis_pe_4";
    String sqlpe4 = "SELECT " + column4 + " FROM " + table4 + " ";
    ArrayList<ArrayList<String>> datape4 = Conn.getData(sqlpe4);

    String column5 = "pe_5_cd, pe_5_name, pe_4_cd, status";
    String table5 = "cis_pe_5";
    String sqlpe5 = "SELECT " + column5 + " FROM " + table5 + " ";
    ArrayList<ArrayList<String>> datape5 = Conn.getData(sqlpe5);

    String column6 = "pe_6_cd, pe_6_name, pe_5_cd, status";
    String table6 = "cis_pe_6";
    String sqlpe6 = "SELECT " + column6 + " FROM " + table6 + " ";
    ArrayList<ArrayList<String>> datape6 = Conn.getData(sqlpe6);

    String column7 = "pe_7_cd, pe_7_name, pe_6_cd, status";
    String table7 = "cis_pe_7";
    String sqlpe7 = "SELECT " + column7 + " FROM " + table7 + " ";
    ArrayList<ArrayList<String>> datape7 = Conn.getData(sqlpe7);

    String column8 = "pe_8_cd, pe_8_name, pe_7_cd, status";
    String table8 = "cis_pe_8";
    String sqlpe8 = "SELECT " + column8 + " FROM " + table8 + " ";
    ArrayList<ArrayList<String>> datape8 = Conn.getData(sqlpe8);
%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="libraries/header.jsp" %> 
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <%
                //            out.print(datape0.get(0).get(0));
            %></h1>

        <%//            out.print(datape1.get(0).get(1));
//        out.print(datape1.get(8).get(1));
//       out.print(datape2);
//        out.print(datape1.get(14).get(1));
//        out.print(datape1.get(15).get(1));
//        out.print(datape1.get(85).get(1));

        %>

        <div class="col-xs-6 col-sm-6 col-md-6">

            <div id="menu">
                <div class="panel list-group">
                    <% for (int a = 0; a < datape0.size(); a++) {
                            if (datape0.get(a).get(2).equals("Active")) {
                    %>
                    <a href="#" class="list-group-item" data-toggle="collapse" data-target="#_datape0_<%out.print(a);%>_<%out.print(datape0.get(a).get(0));%>" data-parent="#menu" >
                        <%out.print(datape0.get(a).get(1));%>
                    </a>
                    <div id="_datape0_<%out.print(a);%>_<%out.print(datape0.get(a).get(0));%>" class=" collapse"  style="background-color: aquamarine">
                        <%
                            for (int b = 0; b < datape1.size(); b++) {
                                if (datape1.get(b).get(2).equals(datape0.get(a).get(0))) {
                                    String id = datape1.get(b).get(0);
                                    String[] id2 = StringUtils.split(id, ",");
                        %>

                        <a href="#" class="list-group-item" data-toggle="collapse" data-target="#_datape1_<%out.print(b);%>_<%out.print(StringUtils.normalizeSpace(id2[1]));%>" data-parent="#<%out.print(StringUtils.normalizeSpace(datape0.get(a).get(0)));%>" >
                            <%
                                out.print(datape1.get(b).get(1));
                            %>
                        </a>
                        <div id="_datape1_<%out.print(b);%>_<%out.print(StringUtils.normalizeSpace(id2[1]));%>" class="collapse" style="background-color: blanchedalmond">
                            <%
                                for (int c = 0; c < datape2.size(); c++) {
                                    if (datape2.get(c).get(2).equals(datape1.get(b).get(0))) {
                                        String idc = datape2.get(c).get(0);
                                        String[] idc2 = StringUtils.split(idc, ",");
                            %>
                            <a href="#" class="list-group-item" data-toggle="collapse" data-target="#_datape2_<%out.print(c);%>_<%out.print(StringUtils.normalizeSpace(idc2[2]));%>" data-parent="#<%out.print(StringUtils.normalizeSpace(datape1.get(b).get(0)));%>" >
                                <%
                                    out.print(datape2.get(c).get(1));
                                %>
                            </a>
                            <div id="_datape2_<%out.print(c);%>_<%out.print(StringUtils.normalizeSpace(idc2[2]));%>" class="collapse" style="background-color: #1484DE">
                                <%
                                    for (int d = 0; d < datape3.size(); d++) {
                                        if (datape3.get(d).get(2).equals(datape2.get(c).get(0))) {
                                            String idd = datape3.get(d).get(0);
                                            String[] idd2 = StringUtils.split(idd, ",");
                                %>
                                <a href="#" class="list-group-item" data-toggle="collapse" data-target="#_datape3_<%out.print(StringUtils.normalizeSpace(idd2[3]));%>" data-parent="#<%out.print(StringUtils.normalizeSpace(datape2.get(c).get(0)));%>" >
                                    <%
                                        out.print(datape3.get(d).get(1));
                                    %>
                                </a>
                                    <div id="_datape3_<%out.print(StringUtils.normalizeSpace(idd2[3]));%>" class="collapse" style="background-color: #419641">
                                        <%
                                            for (int e = 0; e < datape4.size(); e++) {
                                                if (datape4.get(e).get(2).equals(datape3.get(d).get(0))) {
                                                    String ide = datape4.get(e).get(0);
                                                    String[] ide2 = StringUtils.split(ide, ",");
                                        %>
                                        <a href="#" class="list-group-item" data-toggle="collapse" data-target="#<%out.print(StringUtils.normalizeSpace(ide2[4]));%>" data-parent="#<%out.print(StringUtils.normalizeSpace(datape3.get(d).get(0)));%>" >
                                            <%
                                                out.print(datape4.get(e).get(1));
                                            %>
                                        </a>
                                        <%
                                                }
                                            }
                                        %>                               
                                    </div>
                                <%
                                        }
                                    }
                                %>                               
                            </div>
                            <%
                                    }
                                }
                            %>                               
                        </div>
                        <!--                        <a class="list-group-item small"><span class=""></span> sent</a>-->
                        <%
                                }
                            }
                        %>
                    </div>
                    <%
                            }

                        }
                    %>

                    <a href="#" class="list-group-item" data-toggle="collapse" data-target="#sd" data-parent="#menu">saf</a>
                    <div id="sd" class="sublinks collapse">
                        <a href="#" class="list-group-item" data-toggle="collapse" data-target="#sdq" data-parent="#sd">saf</a>
                        <div id="sdq" class="sublinks collapse">
                            <a class="list-group-item small"><span class=""></span> indsax</a>
                            <a class="list-group-item small"><span class=""></span> sedsadnt</a>
                        </div>
                        <a class="list-group-item small"><span class=""></span> sent</a>
                    </div>


                </div>
            </div>

        </div>
    </body>
</html>
