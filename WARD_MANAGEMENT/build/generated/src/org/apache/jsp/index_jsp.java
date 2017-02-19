package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dBConn.Conn;
import Config.Config;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/datepicker/jqueru-ui.css\">\n");
      out.write("        <link href=\"assets/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"assets/css/style.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/font-awesome/css/font-awesome.min.css\">\n");
      out.write("        <!-- Custom styles for this template -->\n");
      out.write("        <link href=\"assets/css/dashboard.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"assets/css/Line-tabs.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/css/loading.css\">\n");
      out.write("        <link href=\"assets/datepicker/jquery-ui.css\" rel=\"stylesheet\">    \n");
      out.write("        <link href=\"assets/datepicker/jquery-ui.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"assets/js/jquery.min.js\"></script>\n");
      out.write("        <script src=\"assets/datepicker/jquery-ui.js\"></script>\n");
      out.write("        <script src=\"assets/js/form-validator.min.js\"></script>\n");
      out.write("        <script src=\"assets/js/bootstrap.min.js\"></script> \n");
      out.write("        <script src=\"assets/js/w3data.js\"></script>\n");
      out.write("        <script src=\"assets/js/bootbox.min.js\"></script>  \n");
      out.write("        <!-- header -->\n");
      out.write("    <div  id=\"headerindex\"></div>\n");
      out.write("    <!-- header -->\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    ");

        String hfc = "04010101";
        String dataSystemStatus = "1";
        session.setAttribute("HFC", hfc);
        session.setAttribute("SYSTEMSTAT", dataSystemStatus);
        Config.getFile_url(session);
        Config.getBase_url(request);
        Conn conn = new Conn();

        //out.println("--------------------------------------------------------------------ipcall: " + conn.getIpCall() + " ");
        //out.println(Config.getFile_url(session));
    
      out.write("\n");
      out.write("    <!-- menu top -->\n");
      out.write("    <div  id=\"topmenuindex\"></div>\n");
      out.write("    <!-- menu top --><body>\n");
      out.write("    <!-- menu\n");
      out.write("\n");
      out.write("    -->    <div class=\"container-fluid\">\n");
      out.write("        <div class=\"row\"> <!--\n");
      out.write("            <!-- menu side -->\n");
      out.write("            <div id=\"sidemenus\"></div>\n");
      out.write("            <!-- menu side --> \n");
      out.write("\n");
      out.write("            <!-- main -->\n");
      out.write("            <div class=\"col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main\" style=\"background: #f2f4f8;\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- main --> \n");
      out.write("            <div>\n");
      out.write("                welcome\n");
      out.write("                <h4>Maintain Ward/Facility ID</h4>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Bootstrap core JavaScript\n");
      out.write("        ================================================== --> \n");
      out.write("    <!-- Placed at the end of the document so the pages load faster --> \n");
      out.write("    <!-- Bootstrap core JavaScript\n");
      out.write("        ================================================== --> \n");
      out.write("    <!-- Placed at the end of the document so the pages load faster --> \n");
      out.write("    <!--    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script> \n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script> \n");
      out.write("        <script src=\"http://www.w3schools.com/lib/w3data.js\"></script> -->\n");
      out.write("\n");
      out.write("\n");
      out.write("    <script>\n");
      out.write("        var patientDOM = [];\n");
      out.write("\n");
      out.write("        //load page to the div\n");
      out.write("        $(\"#headerindex\").load(\"libraries/header.html\");\n");
      out.write("        $(\"#topmenuindex\").load(\"libraries/topMenus.html\");\n");
      out.write("        $(\"#maintainWardCode\").load(\"MaintainWard.jsp\");\n");
      out.write("        $(\"#inpatientRegistration\").load(\"registrationV2.jsp\");\n");
      out.write("        $(\"#wardOccupancy\").load(\"WardOccupancy.jsp\");\n");
      out.write("        $(\"#patientTransfer\").load(\"PatientTransfer.jsp\");\n");
      out.write("        $(\"#sidemenus\").load(\"libraries/sideMenus.jsp\");\n");
      out.write("        w3IncludeHTML();\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
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
