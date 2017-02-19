<%-- 
    Document   : ADM_result
    Created on : Feb 14, 2017, 6:29:20 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    String input = request.getParameter("input");
    String process = request.getParameter("process");
    String disciplineCode = request.getParameter("disciplineCode");
    
    Conn conn = new Conn();
    
    if(process.equalsIgnoreCase("hfc")){
        
        String sql = "Select hfc_cd, hfc_name FROM adm_health_facility WHERE hfc_cd like '%"+input+"%' OR hfc_name like '%"+input+"%'" ;
        ArrayList<ArrayList<String>> search = conn.getData(sql);
        
        if(search.size() > 0){
        
            %><ul id="ADM_hfc_matchlist" style="width: 300px; height: 200px; overflow: auto"><%
            for(int i = 0; i < search.size(); i++){
            
                %>
                <li><a style="cursor:pointer"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
                <%
            
            
            }
            %>
            </ul>
            <%
        
        }else{
        
            %>
                <span>No Record Found!</span>
            <%
        
        }
    
    
    }else if(process.equalsIgnoreCase("discipline")){
        
        String sql = "Select discipline_cd, discipline_name FROM adm_discipline WHERE  discipline_cd like '%"+input+"%' OR discipline_name like '%"+input+"%'";
        ArrayList<ArrayList<String>> search = conn.getData(sql);
        
        if(search.size() > 0){
        
            %><ul id="ADM_discipline_matchlist" style="width: 300px; height: 200px; overflow: auto"><%
            for(int i = 0; i < search.size(); i++){
            
                %>
                <li><a style="cursor:pointer"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
                <%
            
            
            }    
            %>
            </ul>
            <%
        }else{
            
            %>
                <span>No Record Found!</span>
            <%
        
        }        
    
    }else if(process.equalsIgnoreCase("subdiscipline")){
        
        String sql = "Select subdiscipline_cd, subdiscipline_name FROM adm_subdiscipline WHERE discipline_cd = '"+disciplineCode+"' AND (subdiscipline_cd like '%"+input+"%' OR subdiscipline_name like '%"+input+"%')";
        ArrayList<ArrayList<String>> search = conn.getData(sql);
        
        if(search.size() > 0){
        
            %><ul id="ADM_subdiscipline_matchlist" style="width: 300px; height: 200px; overflow: auto"><%
            for(int i = 0; i < search.size(); i++){
            
                %>
                <li><a style="cursor:pointer"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
                <%
            
            
            }    
            %>
            </ul>
            <%
        }else{
            
            %>
                <span>No Record Found!</span>
            <%
        
        }        

    }


%>
