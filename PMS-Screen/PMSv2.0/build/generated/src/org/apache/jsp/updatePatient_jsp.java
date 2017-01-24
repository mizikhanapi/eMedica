package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import dBConn.Conn;
import main.RMIConnector;
import org.json.JSONArray;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import Config.connect;

public final class updatePatient_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    RMIConnector rmic = new RMIConnector();

    String pmino, pminotemp, pname, ptitle, pnic, poic, pit, pino, pelicat, pelity, pbday, psex, pmarital, prace, pnational, preligional, pbloodty, prhesus, pallergy, pchronic, porgandonor, phomeadd, phomedistrict, phometown, ppostcode, pstate, pcountry, phomephone, ppostaladd, ppostaldistrict, ppostaltown, ppostalpostcode, ppostalstate, ppostalcountry, pmobilephone;
    pmino = request.getParameter("pmino");
    pminotemp = request.getParameter("pminotemp");
    pname = request.getParameter("pname");
    ptitle = request.getParameter("ptitle");
    pnic = request.getParameter("pnic");
    poic = request.getParameter("poic");
    pit = request.getParameter("pit");
    pino = request.getParameter("pino");
    pelicat = request.getParameter("pelicat");
    pelity = request.getParameter("pelity");
    pbday = request.getParameter("pbday");
    psex = request.getParameter("psex");
    pmarital = request.getParameter("pmarital");
    prace = request.getParameter("prace");
    pnational = request.getParameter("pnational");
    preligional = request.getParameter("preligional");
    pbloodty = request.getParameter("pbloodty");
    prhesus = request.getParameter("prhesus");
    pallergy = request.getParameter("pallergy");
    pchronic = request.getParameter("pchronic");
    porgandonor = request.getParameter("porgandonor");
    phomeadd = request.getParameter("phomeadd");
    phomedistrict = request.getParameter("phomedistrict");
    phometown = request.getParameter("phometowncd");
    ppostcode = request.getParameter("ppostcode");
    pstate = request.getParameter("pstate");
    pcountry = request.getParameter("pcountry");
    phomephone = request.getParameter("phomephone");
    ppostaladd = request.getParameter("ppostaladd");
    ppostaldistrict = request.getParameter("ppostaldistrict");
    ppostaltown = request.getParameter("ppostaltown");
    ppostalpostcode = request.getParameter("ppostalpostcode");
    ppostalstate = request.getParameter("ppostalstate");
    ppostalcountry = request.getParameter("ppostalcountry");
    pmobilephone = request.getParameter("pmobilephone");
    //pnic = "950607015242";
    //pnic = "950607015241";
    String selectSql = "select * from pms_patient_biodata where PMI_NO ='" + pmino + "'";
    ArrayList<ArrayList<String>> patientRow = Conn.getData(selectSql);
    //ArrayList<String> patientrowOne = patientRow.get(0);
    Pattern p = Pattern.compile("[^a-z0-9 ]", Pattern.CASE_INSENSITIVE);
    ptitle = "Dato'";
    Matcher m = p.matcher(ptitle);
    boolean b = m.find();

    if (b)
       System.out.println("There is a special character in my string");
    //out.print(patientRow.toString());
    String sql1="";
    Boolean SQL=false;
    if (patientRow.size() > 0) {
         sql1 = "UPDATE PMS_PATIENT_BIODATA SET PMI_NO = '"+pmino+"',PMI_NO_TEMP = '"+pminotemp+"',PATIENT_NAME ='"+pname+"',TITLE_CODE = `"+ptitle+"`,NEW_IC_NO = '" +pnic+ "',OLD_IC_NO = '" + poic + "',ID_TYPE = '" + pit + "',ID_NO = '" + pino + "',ELIGIBILITY_CATEGORY_CODE = '" + pelicat + "',ELIGIBILITY_TYPE_CODE = '" + pelity + "',BIRTH_DATE = '" + pbday + "',SEX_CODE = '" + psex + "',MARITAL_STATUS_CODE = '" + pmarital + "',RACE_CODE = '" + prace + "',NATIONALITY = '" + pnational + "',RELIGION_CODE = '" + preligional + "',BLOOD_TYPE = '" + pbloodty + "',BLOOD_RHESUS_CODE = '" + prhesus + "',ALLERGY_IND = '" + pallergy + "',CHRONIC_DISEASE_IND = '" + pchronic + "',ORGAN_DONOR_IND = '" + porgandonor + "',HOME_ADDRESS = '" + phomeadd + "',HOME_DISTRICT_CODE = '" + phomedistrict + "',HOME_TOWN_CODE = '" + phometown + "',HOME_POSTCODE = '" + ppostcode + "',HOME_STATE_CODE = '" + pstate + "',HOME_COUNTRY_CODE = '" + pcountry + "',HOME_PHONE = '" + phomephone + "',POSTAL_ADDRESS = '" + ppostaladd + "',POSTAL_DISTRICT_CODE = '" + ppostaldistrict + "',POSTAL_TOWN_CODE = '" + ppostaltown + "',POSTAL_POSTCODE = '" + ppostalpostcode + "',POSTAL_STATE_CODE = '" + ppostalstate + "',POSTAL_COUNTRY_CODE = '" + ppostalcountry + "',MOBILE_PHONE = '" + pmobilephone + "' WHERE PMI_NO = '"+pmino+"'";
         
    } else{
        
         sql1 = "insert into PMS_PATIENT_BIODATA(PMI_NO,PMI_NO_TEMP,"
                + "PATIENT_NAME,TITLE_CODE,NEW_IC_NO,OLD_IC_NO,ID_TYPE,"
                + "ID_NO,ELIGIBILITY_CATEGORY_CODE,ELIGIBILITY_TYPE_CODE,"
                + "BIRTH_DATE,SEX_CODE,MARITAL_STATUS_CODE,RACE_CODE,"
                + "NATIONALITY,RELIGION_CODE,BLOOD_TYPE,BLOOD_RHESUS_CODE,"
                + "ALLERGY_IND,CHRONIC_DISEASE_IND,ORGAN_DONOR_IND,"
                + "HOME_ADDRESS,HOME_DISTRICT_CODE,HOME_TOWN_CODE,"
                + "HOME_POSTCODE,HOME_STATE_CODE,HOME_COUNTRY_CODE,"
                + "HOME_PHONE,POSTAL_ADDRESS,POSTAL_DISTRICT_CODE,"
                + "POSTAL_TOWN_CODE,POSTAL_POSTCODE,POSTAL_STATE_CODE,"
                + "POSTAL_COUNTRY_CODE,MOBILE_PHONE)values('" + pmino + "', '" + pminotemp + "', '" + pname + "', '" + ptitle + "', '" + pnic + "', '" + poic + "', '" + pit + "', '" + pino + "', '" + pelicat + "', '" + pelity + "', '" + pbday + "', '" + psex + "', '" + pmarital + "', '" + prace + "', '" + pnational + "', '" + preligional + "', '" + pbloodty + "', '" + prhesus + "', '" + pallergy + "', '" + pchronic + "', '" + porgandonor + "', '" + phomeadd + "', '" + phomedistrict + "', '" + phometown + "', '" + ppostcode + "', '" + pstate + "', '" + pcountry + "', '" + phomephone + "', '" + ppostaladd + "', '" + ppostaldistrict + "', '" + ppostaltown + "', '" + ppostalpostcode + "', '" + ppostalstate + "', '" + ppostalcountry + "', '" + pmobilephone + "')";
}
    SQL = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sql1);
    out.print(SQL+"|"+sql1);


    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
