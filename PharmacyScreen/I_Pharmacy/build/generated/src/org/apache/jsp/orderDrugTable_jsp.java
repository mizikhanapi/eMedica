package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.sql.*;
import dBConn.Conn;
import main.RMIConnector;
import Config.Config;

public final class orderDrugTable_jsp extends org.apache.jasper.runtime.HttpJspBase
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


    Config.getFile_url(session);
    Config.getBase_url(request);

    Conn conn = new Conn();


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"thumbnail\" id=\"orderAddDetailsListTableDiv\">\n");
      out.write("\n");
      out.write("    <h4>\n");
      out.write("        Drug Order Details\n");
      out.write("        <div class=\"pull-right\">\n");
      out.write("            <button id=\"orderDrugTableAddDrugTButton\" name=\"orderDrugTableAddDrugTButton\" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#addOrderDrug\"><i class=\"fa fa-plus fa-lg\"></i>&nbsp; New Order</button>\n");
      out.write("            <button id=\"orderDrugTableNewListTButton\" name=\"button1id\" class=\"btn btn-default\"><i class=\"fa fa-plus fa-lg\"></i>&nbsp; New Order List</button>\n");
      out.write("            <button id=\"orderDrugTablePrescribeTButton\" name=\"button2id\" class=\"btn btn-default\"><i class=\"fa fa-file-text fa-lg\"></i>&nbsp; Prescribe</button>\n");
      out.write("        </div>\n");
      out.write("    </h4>\n");
      out.write("\n");
      out.write("    <table id=\"orderAddDetailsListTable\" class=\"table table-filter table-striped\" style=\"background: #fff; border: 1px solid #ccc; margin-top: 20px\">\n");
      out.write("        <thead>\n");
      out.write("        <th>Drug Code</th>\n");
      out.write("        <th>Trade Name</th>\n");
      out.write("        <th>Frequency</th>\n");
      out.write("        <th>Route</th>\n");
      out.write("        <th>Drug Form</th>\n");
      out.write("        <th>Strength</th>\n");
      out.write("        <th>Dose</th>\n");
      out.write("        <th>Order OUM</th>\n");
      out.write("        <th>Duration</th>\n");
      out.write("        <th>Qty Order</th>\n");
      out.write("        <th>Qty Supply</th>\n");
      out.write("        <th>Dispense Qty</th>\n");
      out.write("        <th>Status</th>\n");
      out.write("        <th>Edit</th>\n");
      out.write("        <th>Delete</th>\n");
      out.write("        </thead>\n");
      out.write("        <tbody>\n");
      out.write("\n");
      out.write("        </tbody>\n");
      out.write("    </table>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Add Modal Start -->\n");
      out.write("<div class=\"modal fade\" id=\"addOrderDrug\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"modalLabel\" aria-hidden=\"true\">\n");
      out.write("    <div class=\"modal-dialog\" style=\"width:63%;\">\n");
      out.write("        <div class=\"modal-content\">\n");
      out.write("            <div class=\"modal-header\">\n");
      out.write("                <button type=\"button\" class=\"close\" data-dismiss=\"modal\"><i class=\"fa fa-times fa-lg\"></i></button>\n");
      out.write("                <h3 class=\"modal-title\" id=\"lineModalLabel\">Add New Order</h3>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-body\">\n");
      out.write("\n");
      out.write("                <!-- content goes here -->\n");
      out.write("\n");
      out.write("                <form class=\"form-horizontal\" >\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-6\">\n");
      out.write("\n");
      out.write("                            <h4>Order Details</h4>\n");
      out.write("                            <hr/>\n");
      out.write("                            ");
     String query1 = "SELECT MAX(item_code) FROM far_miscellaneous_item";
                                ArrayList<ArrayList<String>> data1 = conn.getData(query1);
                                String itemCode = data1.get(0).get(0);
                                itemCode = itemCode.replaceAll("[^0-9]", "");
                                itemCode = String.valueOf(Integer.parseInt(itemCode) + 1);

                                String code = "RG";
                                for (int i = 0; itemCode.length() < 5; i++) {
                                    itemCode = "0" + itemCode;
                                }
                                code = code + itemCode;
                            
      out.write("\n");
      out.write("                            <!-- Text input-->\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Drug Order ID</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <input id=\"orderDrugDetailsID\" name=\"orderDrugDetailsID\" type=\"text\" placeholder=\"Drug Order ID\" value=\"");
      out.print( code );
      out.write("\"  class=\"form-control input-md\">\n");
      out.write("                                </div>\n");
      out.write("                            </div> \n");
      out.write("\n");
      out.write("                            <!-- Text input-->\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Drug Order Date</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <input id=\"orderDrugDetailsDate\" name=\"orderDrugDetailsDate\" type=\"text\" placeholder=\"Drug Order Date\"  class=\"form-control input-md\">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <br/>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <h4>Choose Drug</h4>\n");
      out.write("                            <hr/>\n");
      out.write("\n");
      out.write("                            <!-- Text input-->\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Search Drug</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <input id=\"orderDrugSearchInput\" name=\"orderDrugSearchInput\" type=\"text\" placeholder=\"Search Drug\"  class=\"form-control input-md\">\n");
      out.write("                                    <div id=\"orderDrugSearchInputDisplayResult\"></div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <!-- Text input-->\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Search Drug</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <input id=\"orderDrugDisplayDrugCode\" name=\"orderDrugDisplayDrugCode\" type=\"text\" placeholder=\"Drug Code\"  class=\"form-control input-md\" readonly>\n");
      out.write("                                </div>\n");
      out.write("                            </div>                           \n");
      out.write("\n");
      out.write("                            <!-- Text input-->\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Trade Name</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <input id=\"orderDrugDisplayTradeName\" name=\"orderDrugDisplayStockQuantity\" type=\"text\" placeholder=\"Drug Name\" class=\"form-control input-md\" readonly>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <!-- Text input-->\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Stock Quantity</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <input id=\"orderDrugDisplayStockQuantity\" name=\"orderDrugDisplayStockQuantity\" type=\"text\" placeholder=\"Total Stock Quantity\"  class=\"form-control input-md\" readonly>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <br/>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <div class=\"col-md-6\">\n");
      out.write("\n");
      out.write("                            <h4>Drug Details</h4>\n");
      out.write("                            <hr/>\n");
      out.write("\n");
      out.write("                            <!-- Text input-->\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Strength</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <input id=\"textinput\" name=\"textinput\" type=\"text\" placeholder=\"Drug Strength\" class=\"form-control input-md\">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <!-- Text input-->\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Quantity</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <input id=\"textinput\" name=\"textinput\" type=\"text\" placeholder=\"Drug Quantity\" class=\"form-control input-md\">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <!-- Select Basic -->\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"selectbasic\">Frequency</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <select id=\"addD_FREQUENCY\" name=\"addD_FREQUENCY\" class=\"form-control\">\n");
      out.write("                                        <option value=\"No Frequency\">No Frequency</option>\n");
      out.write("                                        ");
                                            String sql5 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0088' ";
                                            ArrayList<ArrayList<String>> listOfDFreq = conn.getData(sql5);

                                            int size5 = listOfDFreq.size();

                                            for (int i = 0; i < size5; i++) {
                                        
      out.write("\n");
      out.write("                                        <option value=\"");
      out.print( listOfDFreq.get(i).get(2));
      out.write('"');
      out.write('>');
      out.print( listOfDFreq.get(i).get(1));
      out.write(" - ");
      out.print( listOfDFreq.get(i).get(2));
      out.write(" </option>\n");
      out.write("                                        ");

                                            }
                                        
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <!-- Select Basic -->\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"selectbasic\">Duration</label>\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <input id=\"addD_DURATION\" name=\"textinput\" type=\"number\" class=\"form-control input-md\" step=\"0.01\" maxlength=\"12\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <select id=\"addD_DURATIONT\" name=\"addD_DURATIONT\" class=\"form-control\">\n");
      out.write("                                        <option value=\"No Duration\">No Duration</option>\n");
      out.write("                                        ");

                                            String sql6 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0089' ";
                                            ArrayList<ArrayList<String>> listOfDDura = conn.getData(sql6);

                                            int size6 = listOfDDura.size();

                                            for (int i = 0; i < size6; i++) {
                                        
      out.write("\n");
      out.write("                                        <option value=\"");
      out.print( listOfDDura.get(i).get(2));
      out.write('"');
      out.write('>');
      out.print( listOfDDura.get(i).get(1));
      out.write(" - ");
      out.print( listOfDDura.get(i).get(2));
      out.write(" </option>\n");
      out.write("                                        ");

                                            }
                                        
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <!-- Select Basic -->\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"selectbasic\">Instruction</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <select id=\"addD_ADVISORY_CODE\" name=\"addD_ADVISORY_CODE\" class=\"form-control\">\n");
      out.write("                                        <option value=\"No Instruction\">No Instruction</option>\n");
      out.write("                                        ");

                                            String sql7 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0087' ";
                                            ArrayList<ArrayList<String>> listOfDInst = conn.getData(sql7);

                                            int size7 = listOfDInst.size();

                                            for (int i = 0; i < size7; i++) {
                                        
      out.write("\n");
      out.write("                                        <option value=\"");
      out.print( listOfDInst.get(i).get(2));
      out.write('"');
      out.write('>');
      out.print( listOfDInst.get(i).get(1));
      out.write(" - ");
      out.print( listOfDInst.get(i).get(2));
      out.write(" </option>\n");
      out.write("                                        ");

                                            }
                                        
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <!-- Text input-->\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"col-md-4 control-label\" for=\"textinput\">Cautionary</label>\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <textarea id=\"addD_CAUTIONARY_CODE\" class=\"form-control\" rows=\"3\" placeholder=\"Drug Cautionary\" maxlength=\"150\"></textarea>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("                <!-- content goes here -->\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-footer\">\n");
      out.write("                <div class=\"btn-group btn-group-justified\" role=\"group\" aria-label=\"group button\">\n");
      out.write("                    <div class=\"btn-group\" role=\"group\">\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-success btn-block btn-lg\" role=\"button\" id=\"addButton\">Add</button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"btn-group\" role=\"group\">\n");
      out.write("                        <button type=\"reset\" id=\"addReset\" class=\"btn btn-default btn-block btn-lg\" data-dismiss=\"modal\" role=\"button\" >Cancel</button>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<!-- Add Modal End -->    \n");
      out.write("\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("    //$(\"#orderAddDetailsListTableDiv\").hide();\n");
      out.write("\n");
      out.write("\n");
      out.write("//js Search in add drug\n");
      out.write("    $(function () {\n");
      out.write("        $(\"#orderDrugSearchInput\").on('keyup', function () { // everytime keyup event\n");
      out.write("            var input = $(this).val(); // We take the input value\n");
      out.write("            if (input.length >= 1) { // Minimum characters = 2 (you can change)\n");
      out.write("                $('#orderDrugSearchInputDisplayResult').html('<img src=\"LoaderIcon.gif\"/>'); // Loader icon apprears in the <div id=\"match\"></div>\n");
      out.write("                var dataFields = {'input': input}; // We pass input argument in Ajax\n");
      out.write("                $.ajax({\n");
      out.write("                    type: \"POST\",\n");
      out.write("                    url: \"Search2.jsp\", // call the jsp file ajax/auto-autocomplete.php\n");
      out.write("                    data: dataFields, // Send dataFields var\n");
      out.write("                    timeout: 3000,\n");
      out.write("                    success: function (dataBack) { // If success\n");
      out.write("                        $('#orderDrugSearchInputDisplayResult').html(dataBack); // Return data (UL list) and insert it in the <div id=\"match\"></div>\n");
      out.write("                        $('#orderDrugSearchInputDisplayResult li').on('click', function () { // When click on an element in the list\n");
      out.write("                            $('#orderDrugSearchInput').val($(this).text()); // Update the field with the new element\n");
      out.write("                            $('#orderDrugSearchInputDisplayResult').text(''); // Clear the <div id=\"match\"></div>\n");
      out.write("                        });\n");
      out.write("                    },\n");
      out.write("                    error: function () { // if error\n");
      out.write("                        $('#orderDrugSearchInputDisplayResult').text('No Eecord Found !');\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("            } else {\n");
      out.write("                $('#orderDrugSearchInputDisplayResult').text('Problem!'); // If less than 2 characters, clear the <div id=\"match\"></div>\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("    });\n");
      out.write("//End js Search in add drug\n");
      out.write("\n");
      out.write("\n");
      out.write("//Start js Search Select drug\n");
      out.write("    $('#orderDrugSearchInputDisplayResult').on('click', function () {\n");
      out.write("        var id = $('#orderDrugSearchInput').val();\n");
      out.write("        $.ajax({\n");
      out.write("            type: 'post',\n");
      out.write("            url: 'SearchDTO_cd.jsp',\n");
      out.write("            data: {'id': id},\n");
      out.write("            success: function (reply_data) {\n");
      out.write("                var array_data = String(reply_data).split(\"|\");\n");
      out.write("                var dtoCode = array_data[0];\n");
      out.write("                var dtoGnr = array_data[1];\n");
      out.write("                var dtoQty = array_data[2];\n");
      out.write("                var dtoPackage = array_data[3];\n");
      out.write("                console.log(dtoCode);\n");
      out.write("\n");
      out.write("                $('#orderDrugDisplayDrugCode').val(dtoCode);\n");
      out.write("                $('#orderDrugDisplayTradeName').val(dtoGnr);\n");
      out.write("                $('#orderDrugDisplayStockQuantity').val(dtoQty);\n");
      out.write("                $('#pack').val(dtoPackage);\n");
      out.write("\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("    });\n");
      out.write("    //End js Search Select drug\n");
      out.write("\n");
      out.write("\n");
      out.write("// Add Button Function\n");
      out.write("\n");
      out.write("</script>");
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
