package org.apache.jsp.search;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import org.apache.commons.lang3.StringUtils;
import dBConn.Conn;
import Config.Config;
import java.util.ArrayList;

public final class episodeDetail_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

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


    
        sql = "select icd10_description from lhr_family_history where pmi_no = '"+pmi_no+"' and episode_date = '"+episodeDate+"';";
        ArrayList<ArrayList<String>> searchEpisode = conn.getData(sql);
    //out.println(searchEpisode);
    

      out.write("\n");
      out.write("<table class=\"table table-filter table-striped\" style=\"background: #fff; border: 1px solid #ccc;\">\n");
      out.write("                        <tbody id=\"detailbyepisode\">\n");
      out.write("                            <tr data-status=\"pagado\">\n");
      out.write("                                ");

                                for (int i = 0; i < searchEpisode.size(); i++) {
            if(searchEpisode.size() > 0){
                                
      out.write("\n");
      out.write("                                <td>\n");
      out.write("                                    <div class=\"media\">\n");
      out.write("                                        <div class=\"media-body\">\n");
      out.write("                                            <p class=\"summary\"  id=\"summary\">Chief Complaint : ");
      out.print(searchEpisode.get(i).get(0));
      out.write("</p>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </td>\n");
      out.write("                                ");
}}
      out.write("\n");
      out.write("                            </tr>\n");
      out.write("                             <tr data-status=\"pagado\">\n");
      out.write("                                <td>\n");
      out.write("                                    <div class=\"media\">\n");
      out.write("                                        <div class=\"media-body\">\n");
      out.write("                                            <p class=\"summary\"  id=\"summary\">Back pain Moderate, Right</p>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                             <tr data-status=\"pagado\">\n");
      out.write("                                <td>\n");
      out.write("                                    <div class=\"media\">\n");
      out.write("                                        <div class=\"media-body\">\n");
      out.write("                                            <p class=\"summary\"  id=\"summary\">Back pain Moderate, Right</p>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr data-status=\"pagado\">\n");
      out.write("                                <td>\n");
      out.write("                                    <div class=\"media\">\n");
      out.write("                                        <div class=\"media-body\">\n");
      out.write("                                            <p class=\"summary\"  id=\"summary\">Back pain Moderate, Right</p>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr data-status=\"pagado\">\n");
      out.write("                                <td>\n");
      out.write("                                    <div class=\"media\">\n");
      out.write("                                        <div class=\"media-body\">\n");
      out.write("                                            <p class=\"summary\"  id=\"summary\">Back pain Moderate, Right</p>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                             <tr data-status=\"pagado\">\n");
      out.write("                                <td>\n");
      out.write("                                    <div class=\"media\">\n");
      out.write("                                        <div class=\"media-body\">\n");
      out.write("                                            <p class=\"summary\"  id=\"summary\">Back pain Moderate, Right</p>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                        </tbody>\n");
      out.write("                    </table>");
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
