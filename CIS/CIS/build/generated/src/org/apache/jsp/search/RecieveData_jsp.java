package org.apache.jsp.search;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import dBConn.Conn;
import main.RMIConnector;

public final class RecieveData_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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

//    String notes = request.getParameter("notes");
//    String pmino = request.getParameter("pmino");
//    String episodedate = request.getParameter("episodedate");
//    String status = request.getParameter("status");
//    String JSONData = request.getParameter("JSONData");
//    
    
    //out.print(JSONData);
    
    
//    
//    Conn conn = new Conn();
//    boolean stats = conn.setData("INSERT INTO ehr_central(pmi_no, c_txndate, c_txndata, status) "
//            + "VALUES('"+pmino+"','"+episodedate+"','"+notes+"','"+status+"') ");
//    
//    if (stats) {
//        out.print("|1|");
//    } else {
//        out.print("|2|");
//    }
            

      out.write("\n");
      out.write("<script src=\".//libraries/jquery-3.1.1.js\" type=\"text/javascript\"></script>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("    $(document).ready(function(){\n");
      out.write("        var data = [{\"Acode\":\"PMH\",\"Problem1\":\"Human immunodeficiency virus [HIV] disease\",\"pmhCode\":\"\",\"Status\":\"Active\",\"comment1\":\"asda\"},{\"Acode\":\"HPI\",\"codeHPI\":\"HPI\",\"details\":\"asdasd\"}];\n");
      out.write("        $('#JSONData').html(data);\n");
      out.write("    })\n");
      out.write("    </script>\n");
      out.write("<p id=\"JSONData\"></p>");
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
