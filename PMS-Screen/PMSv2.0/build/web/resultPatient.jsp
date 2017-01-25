<%@page import="dBConn.Conn"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%--<%@page import="Config.connect"%>--%>
<%
	String idType = request.getParameter("idType");
	String idInput = request.getParameter("idInput");
        
        //String idType = "icnew";
        //String idInput = "950607015241";
        
        //String systemParam = "select * from system_param";
        //ArrayList<ArrayList<String>> systemParams = connect.getData(systemParam);
        //String status = systemParams.get(0).get(2);
        //if status = 1,select from table pms_patient_biodata and special_intergration_information
        
        // status 0 = public
        // status 1 = universiti
        // status bole dapat kat session
        String status ="0";
	String searchPatient= "";
        
        if(status.equals("1")){
            
           if (idType.equals("pmino")) {
		searchPatient = "select * from pms_patient_biodata where PMI_NO='"+idInput+"'";
            }else if (idType.equals("icnew")) {
		searchPatient = "select * from pms_patient_biodata where NEW_IC_NO='"+idInput+"'";
            }else if(idType.equals("icold")){
                searchPatient = "select * from pms_patient_biodata where OLD_IC_NO='"+idInput+"'";
            }else if(idType.equals("004")){
                searchPatient = "select * from pms_patient_biodata where ID_NO='"+idInput+"' AND ID_TYPE = 'Matric No.'";
            }else if(idType.equals("005")){
                searchPatient = "select * from pms_patient_biodata where ID_NO='"+idInput+"' AND ID_TYPE = 'Staff No.'";
            }
	
            ArrayList<ArrayList<String>> search = Conn.getData(searchPatient);
            if (search.size() > 0){
            ArrayList<String> search1 = search.get(0);
            JSONArray jsonAraay = new JSONArray(search1);
            
            String newVal = String.join("|",search1);
            %>
<%out.print(newVal);%>
            <%
            }else{ %>
<%out.print("N/A1");%>
            <%
                }
             
        }else if(status.equals("0")){
            
            if (idType.equals("pmino")) {
		searchPatient = "select * from pms_patient_biodata where PMI_NO='"+idInput+"'";
            }else if (idType.equals("icnew")) {
		searchPatient = "select * from pms_patient_biodata where NEW_IC_NO='"+idInput+"'";
            }else if(idType.equals("icold")){
                searchPatient = "select * from pms_patient_biodata where OLD_IC_NO='"+idInput+"'";
            }
	
            ArrayList<ArrayList<String>> search = Conn.getData(searchPatient);
            if (search.size() > 0){
            ArrayList<String> search1 = search.get(0);
            JSONArray jsonAraay = new JSONArray(search1);
            
            String newVal = String.join("|",search1);
            %>
                <%out.print(newVal);%>
            <%
            }else{ %>
<%out.print("N/A0");%>
            <%
                }


        }
        
%>   