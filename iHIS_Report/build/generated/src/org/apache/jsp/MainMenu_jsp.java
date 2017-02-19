package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class MainMenu_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <title>Main Menu</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <!-- navigation bar -->\n");
      out.write("        <nav class=\"navbar navbar-default\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <a class=\"navbar-brand\" href=\"#\">iHIS </a>\n");
      out.write("                </div>\n");
      out.write("                <ul class=\"nav navbar-nav\">\n");
      out.write("                    <li class=\"active\"><a href=\"MainMenu.jsp\">Home</a></li>\n");
      out.write("\n");
      out.write("                    <li class=\"pull-right\"><a> Welcome </a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <!-- navigation bar -->\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h1 style=\"text-align: center\">Report Main Menu</h1>\n");
      out.write("\n");
      out.write("            </br> </br>\n");
      out.write("\n");
      out.write("            <!-- <a style=\"margin-left:20.5em\" href=\"ADT_MainMenu.jsp\" class=\"button\">ADT</a> -->\n");
      out.write("            <button type=\"button\" class=\"btn btn-info btn-lg\" data-toggle=\"modal\" data-target=\"#myModal1\">Print MC</button>\n");
      out.write("            <button type=\"button\" class=\"btn btn-info btn-lg\" data-toggle=\"modal\" data-target=\"#myModal2\">Time Slip</button>\n");
      out.write("            <button type=\"button\" class=\"btn btn-info btn-lg\" data-toggle=\"modal\" data-target=\"#myModal3\">ICD 10 Report</button>\n");
      out.write("            <button type=\"button\" class=\"btn btn-info btn-lg\" data-toggle=\"modal\" data-target=\"#myModal4\">Full Report</button>\n");
      out.write("            <button type=\"button\" class=\"btn btn-info btn-lg\" data-toggle=\"modal\" data-target=\"#myModal5\">Prescription Slip</button>\n");
      out.write("            <button type=\"button\" class=\"btn btn-info btn-lg\" data-toggle=\"modal\" data-target=\"#myModal6\">Statistics of Diagnosis</button>\n");
      out.write("            <button type=\"button\" class=\"btn btn-info btn-lg\" onclick=\"location.href = 'pmhMain.jsp'\">Patient Medical History</button>\n");
      out.write("\n");
      out.write("            <!-- STARTING OF MODAL BASED ON BUTTON CLICK -->\n");
      out.write("\n");
      out.write("            <!-- PRINT MC MODAL -->\n");
      out.write("\n");
      out.write("            <div class=\"modal fade\" id=\"myModal1\" role=\"dialog\">\n");
      out.write("                <div class=\"modal-dialog modal-lg\">\n");
      out.write("\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                            <h2 style=\"margin-left:13.5em\"class=\"modal-title\">Print MC</h2>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("\n");
      out.write("                            <!-- content for modal -->\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">ID Type:</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <select class=\"form-control\" name=\"mcType\" id=\"mcType\">\n");
      out.write("                                        <option value=\"0\" id=\"0\" >Please select</option>\n");
      out.write("                                        <option value=\"PMI_NO\" id=\"PMI_NO\" >PMI NO.</option>\n");
      out.write("                                        <option value=\"OLD_IC_NO\" id=\"OLD_IC_NO\">OLD IC NO.</option>\n");
      out.write("                                        <option value=\"NEW_IC_NO\" id=\"NEW_IC_NO\">NEW IC NO.</option>\n");
      out.write("                                        <option value=\"ID_NO\" id=\"ID_NO\">MATRIC NO.</option>\n");
      out.write("                                        <option value=\"ID_NO\" id=\"ID_NO\">STAFF NO.</option>\n");
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <br>\n");
      out.write("                            <br>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">IC NO/ ID NO :</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <input id=\"mcInput\" name=\"mcInput\" type=\"text\" placeholder=\"\" class=\"form-control input-md\">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <br>\n");
      out.write("                            <br>\n");
      out.write("                            <!-- content for modal -->\n");
      out.write("\n");
      out.write("                            <!-- modal footer -->\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <div class=\"btn-group btn-group-justified\" role=\"group\" aria-label=\"group button\">\n");
      out.write("                                <div class=\"btn-group\" role=\"group\">\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-success btn-block btn-lg\" role=\"button\" id=\"printMC\">Generate MC</button>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"btn-group\" role=\"group\">\n");
      out.write("                                    <button type=\"reset\" id=\"PrintReset\" class=\"btn btn-default btn-block btn-lg\" data-dismiss=\"modal\" role=\"button\" >Cancel</button>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- PRINT MC MODAL -->\n");
      out.write("\n");
      out.write("            <!-- PRINT TIME SLIP MODAL -->\n");
      out.write("            <div class=\"modal fade\" id=\"myModal2\" role=\"dialog\">\n");
      out.write("                <div class=\"modal-dialog modal-lg\">\n");
      out.write("\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                            <h2 style=\"margin-left:13.5em\"class=\"modal-title\">Print Time Slip</h2>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("\n");
      out.write("                            <!-- modal content -->\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">ID Type:</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <select class=\"form-control\" name=\"tsType\" id=\"tsType\">\n");
      out.write("                                        <option value=\"0\" id=\"0\" >Please select</option>\n");
      out.write("                                        <option value=\"PMI_NO\" id=\"PMI_NO\" >PMI NO.</option>\n");
      out.write("                                        <option value=\"OLD_IC_NO\" id=\"OLD_IC_NO\">OLD IC NO.</option>\n");
      out.write("                                        <option value=\"NEW_IC_NO\" id=\"NEW_IC_NO\">NEW IC NO.</option>\n");
      out.write("                                        <option value=\"ID_NO\" id=\"ID_NO\">MATRIC NO.</option>\n");
      out.write("                                        <option value=\"ID_NO\" id=\"ID_NO\">STAFF NO.</option>\n");
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <br>\n");
      out.write("                            <br>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">IC NO/ ID NO :</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <input id=\"tsInput\" name=\"tsInput\" type=\"text\" placeholder=\"\" class=\"form-control input-md\">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <br>\n");
      out.write("                            <br>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <div class=\"btn-group btn-group-justified\" role=\"group\" aria-label=\"group button\">\n");
      out.write("                                <div class=\"btn-group\" role=\"group\">\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-success btn-block btn-lg\" role=\"button\" id=\"printTimeSlip\">Generate Time Slip</button>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"btn-group\" role=\"group\">\n");
      out.write("                                    <button type=\"reset\" id=\"PrintReset\" class=\"btn btn-default btn-block btn-lg\" data-dismiss=\"modal\" role=\"button\" >Cancel</button>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- PRINT TIME SLIP MODAL -->\n");
      out.write("\n");
      out.write("            <!-- ICD 10 REPORT MODAL -->\n");
      out.write("            <div class=\"modal fade\" id=\"myModal3\" role=\"dialog\">\n");
      out.write("                <div class=\"modal-dialog modal-lg\">\n");
      out.write("\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                            <h2 style=\"margin-left:10.5em\"class=\"modal-title\">ICD 10 Report</h2>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("\n");
      out.write("                            <!-- drop down for id type -->\n");
      out.write("\n");
      out.write("                            </br> </br>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Select Date:</label>\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <input type=\"text\" id=\"datepicker\">                                                                     \n");
      out.write("                                </div>                                                            \n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            </br></br>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <div class=\"btn-group btn-group-justified\" role=\"group\" aria-label=\"group button\">\n");
      out.write("                                <div class=\"btn-group\" role=\"group\">\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-success btn-block btn-lg\" role=\"button\" id=\"printICD10\">Generate Report</button>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"btn-group\" role=\"group\">\n");
      out.write("                                    <button type=\"reset\" id=\"PrintReset\" class=\"btn btn-default btn-block btn-lg\" data-dismiss=\"modal\" role=\"button\" >Cancel</button>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- ICD10 REPORT MODAL -->\n");
      out.write("\n");
      out.write("            <!-- FULL REPORT MODAL -->\n");
      out.write("            <div class=\"modal fade\" id=\"myModal4\" role=\"dialog\">\n");
      out.write("                <div class=\"modal-dialog modal-lg\">\n");
      out.write("\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                            <h2 style=\"margin-left:13.5em\"class=\"modal-title\">Full Report</h2>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("\n");
      out.write("                            <!-- modal content -->\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\"> Type of symptom:</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <select class=\"form-control\" name=\"frType\" id=\"frType\">\n");
      out.write("                                        <option value=\"0\" id=\"0\" >Please select</option>\n");
      out.write("                                        <option value=\"complaint\"  >Complaint</option>\n");
      out.write("                                        <option value=\"diagnosis\" >Diagnosis</option>\n");
      out.write("                                        <option value=\"allergy\" >Allergy</option>\n");
      out.write("                                        <option value=\"medication\" >Medication</option>\n");
      out.write("                                        <option value=\"past_medical_history\" >Past Medical History</option>\n");
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            </br> </br>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Select Date:</label>\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <input type=\"date\" name=\"field1\" id=\"field1\" />                                                                     \n");
      out.write("                                </div>                                                            \n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            </br></br>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">To:</label>\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <input type=\"text\" id=\"datepicker2\">                                                                     \n");
      out.write("                                </div>                                                            \n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            </br> </br>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <div class=\"btn-group btn-group-justified\" role=\"group\" aria-label=\"group button\">\n");
      out.write("                                <div class=\"btn-group\" role=\"group\">\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-success btn-block btn-lg\" role=\"button\" id=\"printfullreport\">summary</button>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"btn-group\" role=\"group\">\n");
      out.write("                                    <button type=\"reset\" id=\"PrintReset\" class=\"btn btn-default btn-block btn-lg\" data-dismiss=\"modal\" role=\"button\" >Cancel</button>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <!-- FULL REPORT MODAL -->\n");
      out.write("\n");
      out.write("            <!-- PRESCRIPTION MODAL -->\n");
      out.write("            <div class=\"modal fade\" id=\"myModal5\" role=\"dialog\">\n");
      out.write("                <div class=\"modal-dialog modal-lg\">\n");
      out.write("\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                            <h2 style=\"margin-left:13.5em\"class=\"modal-title\">Prescription Slip</h2>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("\n");
      out.write("                            <!-- content for modal -->\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">ID Type:</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <select class=\"form-control\" name=\"psType\" id=\"printType\">\n");
      out.write("                                        <option value=\"0\" id=\"0\" >Please select</option>\n");
      out.write("                                        <option value=\"PMI_NO\" id=\"PMI_NO\" >PMI NO.</option>\n");
      out.write("                                        <option value=\"OLD_IC_NO\" id=\"OLD_IC_NO\">OLD IC NO.</option>\n");
      out.write("                                        <option value=\"NEW_IC_NO\" id=\"NEW_IC_NO\">NEW IC NO.</option>\n");
      out.write("                                        <option value=\"ID_NO\" id=\"ID_NO\">MATRIC NO.</option>\n");
      out.write("                                        <option value=\"ID_NO\" id=\"ID_NO\">STAFF NO.</option>\n");
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <br>\n");
      out.write("                            <br>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">IC NO/ ID NO :</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <input id=\"printInput\" name=\"pstInput\" type=\"text\" placeholder=\"\" class=\"form-control input-md\">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <br>\n");
      out.write("                            <br>\n");
      out.write("                            <!-- content for modal -->\n");
      out.write("\n");
      out.write("                            <!-- modal footer -->\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <div class=\"btn-group btn-group-justified\" role=\"group\" aria-label=\"group button\">\n");
      out.write("                                <div class=\"btn-group\" role=\"group\">\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-success btn-block btn-lg\" role=\"button\" id=\"printps\">Generate prescription</button>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"btn-group\" role=\"group\">\n");
      out.write("                                    <button type=\"reset\" id=\"PrintReset\" class=\"btn btn-default btn-block btn-lg\" data-dismiss=\"modal\" role=\"button\" >Cancel</button>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- PRESCRIPTION MODAL -->\n");
      out.write("\n");
      out.write("            <!-- REPORT AND STATISCTIC OF DIAGNOSIS -->\n");
      out.write("\n");
      out.write("            <div class=\"modal fade\" id=\"myModal6\" role=\"dialog\">\n");
      out.write("                <div class=\"modal-dialog modal-lg\">\n");
      out.write("\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                            <h2 style=\"margin-left:10.5em\"class=\"modal-title\">Report and Statistic of Diagnosis</h2>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("\n");
      out.write("                            <!-- modal body -->\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Patient Type:</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <select class=\"form-control\" name=\"patientType\" id=\"printType\">\n");
      out.write("                                        <option value=\"0\" id=\"0\" >Please select</option>\n");
      out.write("                                        <option value=\"student\" id=\"student\" >Student</option>\n");
      out.write("                                        <option value=\"staff\" id=\"satff\">Staff</option>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            </br>\n");
      out.write("                            </br>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Select Date:</label>\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <input type=\"text\" id=\"datepicker\">                                                                     \n");
      out.write("                                </div>                                                            \n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            </br>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">To:</label>\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <input type=\"text\" id=\"datepicker2\">                                                                     \n");
      out.write("                                </div>                                                            \n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            </br> </br>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Select discipline:</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <select class=\"form-control\" name=\"patientType\" id=\"printType\">\n");
      out.write("                                        <option value=\"0\" id=\"0\" >Please select</option>\n");
      out.write("                                        <option value=\"outpatient\" id=\"outpatient\" >Outpatient</option>\n");
      out.write("                                        <option value=\"inpatient\" id=\"inpatient\">Inpatient</option>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            </br> </br>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <div class=\"btn-group btn-group-justified\" role=\"group\" aria-label=\"group button\">\n");
      out.write("                                <div class=\"btn-group\" role=\"group\">\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-success btn-block btn-lg\" role=\"button\" id=\"printsd\">Generate report</button>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"btn-group\" role=\"group\">\n");
      out.write("                                    <button type=\"reset\" id=\"PrintReset\" class=\"btn btn-default btn-block btn-lg\" data-dismiss=\"modal\" role=\"button\" >Cancel</button>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <!-- REPORT AND STATISCTIC OF DIAGNOSIS -->\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("<link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"/resources/demos/style.css\">\n");
      out.write("<script src=\"https://code.jquery.com/jquery-1.12.4.js\"></script>\n");
      out.write("<script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("\n");
      out.write("                $(function () {\n");
      out.write("                    $(\"#datepicker\").datepicker();\n");
      out.write("                });\n");
      out.write("\n");
      out.write("                $(function () {\n");
      out.write("                    $(\"#datepicker2\").datepicker();\n");
      out.write("                });\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("\n");
      out.write("    $(document).ready(function () {\n");
      out.write("\n");
      out.write("        function reset() {\n");
      out.write("            document.getElementById(\"printType\").value = \"\";\n");
      out.write("            document.getElementById(\"printInput\").value = \"\";\n");
      out.write("            document.getElementById(\"frType\").value = \"\";\n");
      out.write("            document.getElementById(\"icdday\").value = \"\";\n");
      out.write("            document.getElementById(\"icdmonth\").value = \"\";\n");
      out.write("            document.getElementById(\"icdyear\").value = \"\";\n");
      out.write("            document.getElementById(\"tsInput\").value = \"\";\n");
      out.write("            document.getElementById(\"tsType\").value = \"\";\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        $('#PrintReset').on('click', function () {\n");
      out.write("            reset();\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        $('#printMC').on('click', function (e) {\n");
      out.write("\n");
      out.write("            e.preventDefault();\n");
      out.write("\n");
      out.write("            var mcType = $(\"#mcType\").val();\n");
      out.write("            var mcInput = $(\"#mcInput\").val();\n");
      out.write("            console.log(mcType);\n");
      out.write("            console.log(mcInput);\n");
      out.write("\n");
      out.write("            window.open(\"mcReport.jsp?mcType=\" + mcType + \"&mcInput=\" + mcInput);\n");
      out.write("\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        $('#printTimeSlip').on('click', function (e) {\n");
      out.write("\n");
      out.write("            e.preventDefault();\n");
      out.write("\n");
      out.write("            var tsType = $(\"#tsType\").val();\n");
      out.write("            var tsInput = $(\"#tsInput\").val();\n");
      out.write("            console.log(tsType);\n");
      out.write("            console.log(tsInput);\n");
      out.write("\n");
      out.write("            window.open(\"timeslip.jsp?tsType=\" + tsType + \"&tsInput=\" + tsInput);\n");
      out.write("\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        $('#printICD10').on('click', function (e) {\n");
      out.write("\n");
      out.write("            e.preventDefault();\n");
      out.write("\n");
      out.write("            var icdyear = $(\"#icdyear\").val();\n");
      out.write("            var icdmonth = $(\"#icdmonth\").val();\n");
      out.write("            var icdday = $(\"#icdday\").val();\n");
      out.write("            console.log(icdyear);\n");
      out.write("            console.log(icdmonth);\n");
      out.write("            console.log(icdday);\n");
      out.write("\n");
      out.write("            window.open(\"ICD10.jsp?icdyear=\" + icdyear + \"&icdmonth=\" + icdmonth + \"&icdday=\" + icdday);\n");
      out.write("\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        $('#prinfullreport').on('click', function (e) {\n");
      out.write("\n");
      out.write("            e.preventDefault();\n");
      out.write("\n");
      out.write("            var icdyear = $(\"#icdyear\").val();\n");
      out.write("            var icdmonth = $(\"#icdmonth\").val();\n");
      out.write("            var icdday = $(\"#icdday\").val();\n");
      out.write("            console.log(icdyear);\n");
      out.write("            console.log(icdmonth);\n");
      out.write("            console.log(icdday);\n");
      out.write("\n");
      out.write("            window.open(\"ICD10.jsp?icdyear=\" + icdyear + \"&icdmonth=\" + icdmonth + \"&icdday=\" + icdday);\n");
      out.write("\n");
      out.write("        });\n");
      out.write("\n");
      out.write("\n");
      out.write("    });\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("\n");
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