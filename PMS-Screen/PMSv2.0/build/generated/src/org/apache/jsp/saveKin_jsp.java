package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import main.RMIConnector;
import dBConn.Conn;
import org.json.JSONArray;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public final class saveKin_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    RMIConnector rmic = new RMIConnector();

    String KINpmino, KINidtype, KINdob, KINphone, KINemail, KINname, KINoldic, KINidnumber, KINoccu, sql,sqlCheck, KINhomephone, KINaddress,KINdistrict,KINpostcode,KINcountry,KINtown,KINstate,KINseq,KINrelationship,KINnewic;
    KINpmino = request.getParameter("KINpmino");
    KINidtype = request.getParameter("KINidtype");
    KINdob = request.getParameter("KINdob");
    KINphone = request.getParameter("KINphone");
    KINemail = request.getParameter("KINemail");
    KINname = request.getParameter("KINname");
    KINoldic = request.getParameter("KINoldic");
    KINidnumber = request.getParameter("KINidnumber");
    KINoccu = request.getParameter("KINoccu");
    KINhomephone = request.getParameter("KINhomephone");
    KINaddress = request.getParameter("KINaddress");
    KINdistrict = request.getParameter("KINdistrict");
    KINpostcode = request.getParameter("KINpostcode");
    KINcountry = request.getParameter("KINcountry");
    KINtown = request.getParameter("KINtown");
    KINstate = request.getParameter("KINstate");
    KINseq = request.getParameter("KINseq");
    KINrelationship = request.getParameter("KINrelationship");
    KINnewic = request.getParameter("KINnewic");
    
    
    sql = "SELECT NEXTOFKIN_SEQ_NO FROM autogenerate_noksno";
    Boolean insert1 = false, insert2 = false,update = false;
    sqlCheck = "select * from pms_nextofkin where NEXTOFKIN_SEQ_NO = '" + KINseq + "' and pmi_no ='" + KINpmino + "'";
    ArrayList<ArrayList<String>> Checkseq = Conn.getData(sqlCheck);

    ArrayList<ArrayList<String>> seq = Conn.getData(sql);

    String[] g = new String[1];
    int num = 0;
    for (int i = 0; i < seq.size(); i++) {
        num = Integer.parseInt(seq.get(i).get(0).substring(2, seq.get(i).get(0).length()));
        num += 1;
        String formatted = String.format("%05d", num);
        g[0] = formatted;
    }
    String newSeq = "ES" + g[0];
    String sql2 = "INSERT INTO pms_nextofkin (PMI_NO, NEXTOFKIN_SEQ_NO, NEXTOFKIN_RELATIONSHIP_CODE, NEXTOFKIN_NAME, NEW_IC_NO, OLD_IC_NO, ID_TYPE, ID_NO, BIRTH_DATE, OCCUPATION_CODE, ADDRESS, DISTRICT_CODE, TOWN_CODE, POSTCODE, STATE_CODE, COUNTRY_CODE, MOBILE_PHONE, HOME_PHONE, E_MAIL) VALUES ('" + KINpmino + "','" + newSeq + "','" + KINrelationship + "','" + KINname + "','" + KINnewic + "','" + KINoldic + "','" + KINidtype + "','" + KINidnumber + "','" + KINoccu + "','" + KINaddress + "','" + KINdistrict + "','" + KINtown + "','" + KINpostcode + "','" + KINstate + "','" + KINcountry + "','" + KINphone + "','" + KINhomephone + "','" + KINemail + "')";
    String sql3 = "INSERT INTO autogenerate_noksno (NEXTOFKIN_SEQ_NO) VALUES ('" + newSeq + "')";

    if (Checkseq.size() > 0) {
        String sql4 = "update pms_nextofkin set PMI_NO='" + KINpmino + "',NEXTOFKIN_SEQ_NO='" + KINseq + "',NEXTOFKIN_RELATIONSHIP_CODE='" + KINrelationship + "',NEXTOFKIN_NAME='" + KINname + "',NEW_IC_NO='" + KINnewic + "',OLD_IC_NO='" + KINoldic + "',ID_TYPE='" + KINidtype + "',ID_NO='" + KINidnumber + "',BIRTH_DATE='" + KINdob + "',OCCUPATION_CODE='" + KINoccu + "', ADDRESS='"+KINaddress+"', DISTRICT_CODE='"+KINdistrict+"', TOWN_CODE='"+KINtown+"', POSTCODE='"+KINpostcode+"', STATE_CODE='"+KINstate+"', COUNTRY_CODE='"+KINcountry+"', MOBILE_PHONE='"+KINphone+"', HOME_PHONE='"+KINhomephone+"', E_MAIL='"+KINemail+"' where NEXTOFKIN_SEQ_NO='" + KINseq + "' and pmi_no ='" + KINpmino + "'";
        update = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sql4);
        
        if (update == true) {
            out.print("true");
        } else {
            out.print("false");
            out.print(Checkseq.size());
            out.print(sql4);
        }
    } else {
        insert1 = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sql2);
        insert2 = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sql3);

        if (insert1 == true && insert2 == true) {
            out.print("true");
        } else {
            out.print("false");
            out.print(Checkseq.size());
            out.print(sql2);
            out.print(sql3);
        }
    }

//    out.print(newSeq);


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
