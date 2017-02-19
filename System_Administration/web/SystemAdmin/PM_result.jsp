<%-- 
    Document   : PM_result
    Created on : Feb 7, 2017, 5:53:55 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    String input = request.getParameter("input");
    String process = request.getParameter("process");
    String systemCode = request.getParameter("systemCode");
    
    Conn conn = new Conn();
    
    if(process.equalsIgnoreCase("system")){
        
        String sql = "Select system_code, system_name FROM adm_system WHERE system_code like '%"+input+"%' OR system_name like '%"+input+"%'" ;
        ArrayList<ArrayList<String>> search = conn.getData(sql);
        
        if(search.size() > 0){
        
            %><ul id="PM_match_systemList" style="width: 300px; height: 200px; overflow: auto"><%
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
    
    
    }else{
        
        String sql = "Select module_code, module_name FROM adm_module WHERE (module_code like '%"+input+"%' OR module_name like '%"+input+"%') AND system_code = '"+systemCode+"'";
        ArrayList<ArrayList<String>> search = conn.getData(sql);
        
        if(search.size() > 0){
        
            %><ul id="PM_match_moduleList" style="width: 300px; height: 200px; overflow: auto"><%
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
