<%-- 
    Document   : register
    Created on : Mar 18, 2016, 2:46:31 PM
    Author     : asyraf
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>


<%
Conn Conn = new Conn();
    String id = request.getParameter("id");
    ArrayList<ArrayList<String>> dataDateHoliday;
    
    if(id.equals("state")){
            String sqlDisplayDateHoliday = "SELECT lm.Master_Ref_code, ld.`Master_Ref_code`, ld.Detail_Ref_code, pmsh.*, ld.Description "
            + "FROM lookup_master lm, lookup_detail ld, pms_holiday pmsh "
            + "WHERE lm.`Master_Ref_code` = ld.`Master_Ref_code` AND ld.`Master_Ref_code` = '0002' AND ld.`Detail_Ref_code` = pmsh.state_code "
            + "ORDER BY pmsh.holiday_date ASC, ld.`Description` ASC";
            dataDateHoliday = Conn.getData(sqlDisplayDateHoliday);
    }
    else
    {
            String sqlDisplayDateHoliday = "SELECT lm.Master_Ref_code, ld.`Master_Ref_code`, ld.Detail_Ref_code, pmsh.*, ld.Description "
            + "FROM lookup_master lm, lookup_detail ld, pms_holiday pmsh "
            + "WHERE lm.`Master_Ref_code` = ld.`Master_Ref_code` AND ld.`Master_Ref_code` = '0002' AND ld.`Detail_Ref_code` = pmsh.state_code AND pmsh.state_code = '"+id+"'  "
            + "ORDER BY pmsh.holiday_date ASC, ld.`Description` ASC";
            dataDateHoliday = Conn.getData(sqlDisplayDateHoliday);
    }
    

%>
                    <table class="table table-bordered table-hover" id="viewHoliday">
                    <thead>
                        <tr>
                            <th><center>No</center></th>
                            <th><center>Date</center></th>
                            <th><center>Description</center></th>
                            <th><center>State Name</center></th>
                            <th><center>Applicable to</center></th>
                            <!--<th><center>Status</center></th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (dataDateHoliday.size() > 0) 
                            {
                                for (int i = 0; i < dataDateHoliday.size(); i++) 
                                {
                                    Date today = new Date();
                                    String expectedPattern = "yyyy-MM-dd HH:mm:ss.SSS";
                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                    String dateFromDB = dataDateHoliday.get(i).get(4);
                                    Date dateDB = formatter.parse(dateFromDB);
                                    
                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                    String date = DATE_FORMAT.format(dateDB);
                                    
                                    SimpleDateFormat df = new SimpleDateFormat("EEEE");
                                    String newDate = df.format(dateDB);
                                    //out.print(newDate);
                                    
                                    %>
                                    <tr>
                                        <td><center>
                                            <%
                                                out.print(i+1);
                                            %>
                                        </center></td>
                                        <td><center><%=date%></center></td>
                                        <td><left><%=dataDateHoliday.get(i).get(5)%></left></td>
                                        <td><left><%=dataDateHoliday.get(i).get(10)%></left></td>
                                        <td><left><%=dataDateHoliday.get(i).get(6)%></left></td> 
                                    </tr>
                                <%
                                    if(dateDB.before(today))
                                    {      
                                                RMIConnector rmic = new RMIConnector();
                                                String sqlInsert = "UPDATE pms_holiday SET status='inactive' WHERE holiday_date < date(now());";

                                                boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
                                    }
                                }
                            }%>
                    </tbody>
                </table>
              


