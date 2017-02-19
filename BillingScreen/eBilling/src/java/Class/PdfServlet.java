/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.itextpdf.text.DocumentException;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.util.Date;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dbConn.Conn;
import java.io.File;
import java.util.ArrayList;
import javax.swing.JOptionPane;
/**
 *
 * @author Mike Ho
 */
public class PdfServlet extends HttpServlet {
             
        private DecimalFormat df = new DecimalFormat("0.00");
        private DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy"); 
        private DateFormat monthFormat = new SimpleDateFormat("MM");
        private DateFormat yearFormat = new SimpleDateFormat("yyyy");
        private Date date = new Date();
        private String strCurrentDate = dateFormat.format(date);
        private String strCurrentMon = monthFormat.format(date);
        private String strCurrentYear = yearFormat.format(date);
            
    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        try {
            // Get the text that will be added to the PDF
            String action = request.getParameter("action");
            String ic = request.getParameter("ic");
            String year = request.getParameter("year");
            String month = request.getParameter("month");

            if (action.equalsIgnoreCase("yearlyStatement")){
                generateYearlyStatement(ic, response);
            } else if (action.equalsIgnoreCase("detailsStatement")){
                generateDetailsStatement(ic, month, year, response);
            } else {
                generateYearEndProcessingReport(response);
            }
        } catch(Exception e) {
            throw new IOException(e.getMessage());
        }
    }
 
     private void checkProcessedYear(){
        String sql = "SELECT processed_year "
                + "FROM far_year_end_parameter "
                + "WHERE code = 'yep'";
        ArrayList<ArrayList<String>> yep = Conn.getData(sql);
        
        String processedYear = yep.get(0).get(0);
        if(processedYear.equals(strCurrentYear)){
            strCurrentYear = String.valueOf(Integer.parseInt(strCurrentYear) + 1);
            strCurrentDate = "01-01-"+strCurrentYear;
        }
    }
     
     private void generateYearlyStatement(String ic, HttpServletResponse response) {
        
        String sql0 = "SELECT cl.customer_id "
                + "FROM pms_patient_biodata pb, far_customer_ledger cl "
                + "WHERE pb.new_ic_no = '"+ ic +"'";
        ArrayList<ArrayList<String>> dataPatient = Conn.getData(sql0);
        
        if(dataPatient.isEmpty()){
            String infoMessage = "Record not found.\nPlease recheck the other ID";
        } else{
            checkProcessedYear();

            String sql = 
                    "SELECT "
                    + "pb.pmi_no, pb.patient_name, pb.new_ic_no, pb.id_no, pb.home_address, pb.mobile_phone, pb.email_address, "
                    //credit of month
                    + "IFNULL(cl.cr_amt_1, 0), IFNULL(cl.cr_amt_2, 0), IFNULL(cl.cr_amt_3, 0), IFNULL(cl.cr_amt_4, 0), "
                    + "IFNULL(cl.cr_amt_5, 0), IFNULL(cl.cr_amt_6, 0), IFNULL(cl.cr_amt_7, 0), IFNULL(cl.cr_amt_8, 0), "
                    + "IFNULL(cl.cr_amt_9, 0), IFNULL(cl.cr_amt_10, 0), IFNULL(cl.cr_amt_11, 0), IFNULL(cl.cr_amt_12, 0), "
                    //debit of month
                    + "IFNULL(cl.dr_amt_1, 0), IFNULL(cl.dr_amt_2, 0), IFNULL(cl.dr_amt_3, 0), IFNULL(cl.dr_amt_4, 0), "
                    + "IFNULL(cl.dr_amt_5, 0), IFNULL(cl.dr_amt_6, 0), IFNULL(cl.dr_amt_7, 0), IFNULL(cl.dr_amt_8, 0), "
                    + "IFNULL(cl.dr_amt_9, 0), IFNULL(cl.dr_amt_10, 0), IFNULL(cl.dr_amt_11, 0), IFNULL(cl.dr_amt_12, 0), "
                    //total credit of a year
                    + "IFNULL(cl.cr_amt_1, 0)+IFNULL(cl.cr_amt_2, 0)+IFNULL(cl.cr_amt_3, 0)+IFNULL(cl.cr_amt_4, 0)+"
                    + "IFNULL(cl.cr_amt_5, 0)+IFNULL(cl.cr_amt_6, 0)+IFNULL(cl.cr_amt_7, 0)+IFNULL(cl.cr_amt_8, 0)+"
                    + "IFNULL(cl.cr_amt_9, 0)+IFNULL(cl.cr_amt_10, 0)+IFNULL(cl.cr_amt_11, 0)+IFNULL(cl.cr_amt_12, 0), "
                    //total debit of a year
                    + "IFNULL(cl.dr_amt_1, 0)+IFNULL(cl.dr_amt_2, 0)+IFNULL(cl.dr_amt_3, 0)+IFNULL(cl.dr_amt_4, 0)+"
                    + "IFNULL(cl.dr_amt_5, 0)+IFNULL(cl.dr_amt_6, 0)+IFNULL(cl.dr_amt_7, 0)+IFNULL(cl.dr_amt_8, 0)+"
                    + "IFNULL(cl.dr_amt_9, 0)+IFNULL(cl.dr_amt_10, 0)+IFNULL(cl.dr_amt_11, 0)+IFNULL(cl.dr_amt_12, 0), "
                    + "IFNULL(cl.cr_amt_13, 0), IFNULL(cl.dr_amt_13, 0) "
                    + "FROM far_customer_ledger cl, pms_patient_biodata pb "
                    + "WHERE cl.customer_id = pb.pmi_no "
                    + "AND pb.new_ic_no = '"+ ic +"'";
            ArrayList<ArrayList<String>> data = Conn.getData(sql);

            for(int i = 0; i < data.size(); i++){
                String pmiNo = data.get(i).get(0);
                String name = data.get(i).get(1);
                String idNo = data.get(i).get(3);
                String address = data.get(i).get(4);
                String phone = data.get(i).get(5);
                String email = data.get(i).get(6);
                String cr1 = data.get(i).get(7);
                String cr2 = data.get(i).get(8);
                String cr3 = data.get(i).get(9);
                String cr4 = data.get(i).get(10);
                String cr5 = data.get(i).get(11);
                String cr6 = data.get(i).get(12);
                String cr7 = data.get(i).get(13);
                String cr8 = data.get(i).get(14);
                String cr9 = data.get(i).get(15);
                String cr10 = data.get(i).get(16);
                String cr11 = data.get(i).get(17);
                String cr12 = data.get(i).get(18);
                String dr1 = data.get(i).get(19);
                String dr2 = data.get(i).get(20);
                String dr3 = data.get(i).get(21);
                String dr4 = data.get(i).get(22);
                String dr5 = data.get(i).get(23);
                String dr6 = data.get(i).get(24);
                String dr7 = data.get(i).get(25);
                String dr8 = data.get(i).get(26);
                String dr9 = data.get(i).get(27);
                String dr10 = data.get(i).get(28);
                String dr11 = data.get(i).get(29);
                String dr12 = data.get(i).get(30);
                String yearCredit = data.get(i).get(31);
                String yearDebit = data.get(i).get(32);
                String lastYearCredit = data.get(i).get(33);
                String lastYearDebit = data.get(i).get(34);

                //create new document
                Document document = new Document(PageSize.A4, 36, 36, 64, 36) {}; 
                document.setMargins(40, 30, 50, 50); 

                double deficient = 0;
                double totalYearCredit = 0;
                double totalYearDebit = 0;

                try {
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    PdfWriter writer = PdfWriter.getInstance(document, baos);
                    document.open();

                    //initialize pdf
                    Font recti = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
                    Font rectem = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
                    Font rectemja = new Font(Font.FontFamily.COURIER, 12);

                    //header
                    PdfPTable table = new PdfPTable(6);
                    table.setWidths(new float[]{0.5f, 1.5f, 4f, 1.5f, 1.5f, 1.5f});
                    table.setLockedWidth(true);
                    table.setTotalWidth(document.right() - document.left());

                    PdfPTable tableHeader = new PdfPTable(4);
                    tableHeader.setWidths(new float[]{3f, 4f, 3.5f, 4f});
                    tableHeader.setLockedWidth(true);
                    tableHeader.setTotalWidth(document.right() - document.left());

                    Image logo = Image.getInstance("logoUTeM/LogoJawiUTeM.png");
                    logo.scaleAbsolute(120, 60);

                    PdfPCell cellLogo = new PdfPCell(logo);
                    cellLogo.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cellLogo.setBorder(Rectangle.NO_BORDER);
                    cellLogo.setColspan(4);
                    tableHeader.addCell(cellLogo);

                    PdfPCell cellLocation = new PdfPCell(new Phrase("Pusat Kesihatan UTeM", recti));
                    cellLocation.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cellLocation.setBorder(Rectangle.NO_BORDER);
                    cellLocation.setColspan(4);
                    tableHeader.addCell(cellLocation);

                    PdfPCell cellAnnual = new PdfPCell(new Phrase("\nCustomer Yearly Account Statement\n"
                            + "for year "+ strCurrentYear +"\n\n", recti));
                    cellAnnual.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cellAnnual.setBorder(Rectangle.NO_BORDER);
                    cellAnnual.setColspan(4);
                    tableHeader.addCell(cellAnnual);                

                    //Customer Details
                    PdfPTable tableCust = new PdfPTable(1);
                    tableCust.setWidths(new float[]{10f});
                    tableCust.setLockedWidth(true);
                    tableCust.setTotalWidth(document.right() - document.left());

                    PdfPCell cell11 = new PdfPCell(new Phrase(name, rectemja));
                    cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell11.setBorder(Rectangle.NO_BORDER);
                    cell11.setColspan(3);

                    PdfPCell cell21 = new PdfPCell(new Phrase(address, rectemja));
                    cell21.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell21.setBorder(Rectangle.NO_BORDER);
                    cell21.setColspan(3);

                    PdfPCell cell31 = new PdfPCell(new Phrase("\nReport Date: " + strCurrentDate + "\n\n", rectemja));
                    cell31.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell31.setBorder(Rectangle.NO_BORDER);
                    cell31.setColspan(3);

                    tableCust.addCell(cell11);
                    tableCust.addCell(cell21);
                    tableCust.addCell(cell31);

                    PdfPTable tableStatement = new PdfPTable(3);
                    tableStatement.setWidths(new float[]{10.5f, 2f, 2f});
                    tableStatement.setLockedWidth(true);
                    tableStatement.setTotalWidth(document.right() - document.left());

                    PdfPCell cell41 = new PdfPCell(new Phrase("Month:", rectem));
                    cell41.setHorizontalAlignment(Element.ALIGN_LEFT);
                    PdfPCell cell42 = new PdfPCell(new Phrase("Debit (RM)", rectem));
                    cell42.setHorizontalAlignment(Element.ALIGN_CENTER);
                    PdfPCell cell43 = new PdfPCell(new Phrase("Credit (RM)", rectem));
                    cell43.setHorizontalAlignment(Element.ALIGN_CENTER);

                    tableStatement.addCell(cell41);
                    tableStatement.addCell(cell42);
                    tableStatement.addCell(cell43);

                    PdfPCell cell51 = new PdfPCell(new Phrase("January", rectemja));
                    cell51.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell51.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell52 = new PdfPCell(new Phrase(dr1, rectemja));
                    cell52.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell52.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell53 = new PdfPCell(new Phrase(cr1, rectemja));
                    cell53.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell53.setBorder(Rectangle.LEFT | Rectangle.RIGHT);

                    tableStatement.addCell(cell51);
                    tableStatement.addCell(cell52);
                    tableStatement.addCell(cell53);

                    PdfPCell cell61 = new PdfPCell(new Phrase("February", rectemja));
                    cell61.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell61.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell62 = new PdfPCell(new Phrase(dr2, rectemja));
                    cell62.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell62.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell63 = new PdfPCell(new Phrase(cr2, rectemja));
                    cell63.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell63.setBorder(Rectangle.LEFT | Rectangle.RIGHT);

                    tableStatement.addCell(cell61);
                    tableStatement.addCell(cell62);
                    tableStatement.addCell(cell63);                

                    PdfPCell cell71 = new PdfPCell(new Phrase("March", rectemja));
                    cell71.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell71.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell72 = new PdfPCell(new Phrase(dr3, rectemja));
                    cell72.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell72.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell73 = new PdfPCell(new Phrase(cr3, rectemja));
                    cell73.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell73.setBorder(Rectangle.LEFT | Rectangle.RIGHT);

                    tableStatement.addCell(cell71);
                    tableStatement.addCell(cell72);
                    tableStatement.addCell(cell73);

                    PdfPCell cell81 = new PdfPCell(new Phrase("April", rectemja));
                    cell81.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell81.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell82 = new PdfPCell(new Phrase(dr4, rectemja));
                    cell82.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell82.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell83 = new PdfPCell(new Phrase(cr4, rectemja));
                    cell83.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell83.setBorder(Rectangle.LEFT | Rectangle.RIGHT);

                    tableStatement.addCell(cell81);
                    tableStatement.addCell(cell82);
                    tableStatement.addCell(cell83);

                    PdfPCell cell91 = new PdfPCell(new Phrase("May", rectemja));
                    cell91.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell91.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell92 = new PdfPCell(new Phrase(dr5, rectemja));
                    cell92.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell92.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell93 = new PdfPCell(new Phrase(cr5, rectemja));
                    cell93.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell93.setBorder(Rectangle.LEFT | Rectangle.RIGHT);

                    tableStatement.addCell(cell91);
                    tableStatement.addCell(cell92);
                    tableStatement.addCell(cell93);

                    PdfPCell cell101 = new PdfPCell(new Phrase("June", rectemja));
                    cell101.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell101.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell102 = new PdfPCell(new Phrase(dr6, rectemja));
                    cell102.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell102.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell103 = new PdfPCell(new Phrase(cr6, rectemja));
                    cell103.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell103.setBorder(Rectangle.LEFT | Rectangle.RIGHT);

                    tableStatement.addCell(cell101);
                    tableStatement.addCell(cell102);
                    tableStatement.addCell(cell103);

                    PdfPCell cell111 = new PdfPCell(new Phrase("July", rectemja));
                    cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell112 = new PdfPCell(new Phrase(dr7, rectemja));
                    cell112.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell112.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell113 = new PdfPCell(new Phrase(cr7, rectemja));
                    cell113.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell113.setBorder(Rectangle.LEFT | Rectangle.RIGHT);

                    tableStatement.addCell(cell111);
                    tableStatement.addCell(cell112);
                    tableStatement.addCell(cell113);

                    PdfPCell cell121 = new PdfPCell(new Phrase("August", rectemja));
                    cell121.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell121.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell122 = new PdfPCell(new Phrase(dr8, rectemja));
                    cell122.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell122.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell123 = new PdfPCell(new Phrase(cr8, rectemja));
                    cell123.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell123.setBorder(Rectangle.LEFT | Rectangle.RIGHT);

                    tableStatement.addCell(cell121);
                    tableStatement.addCell(cell122);
                    tableStatement.addCell(cell123);

                    PdfPCell cell131 = new PdfPCell(new Phrase("September", rectemja));
                    cell131.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell131.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell132 = new PdfPCell(new Phrase(dr9, rectemja));
                    cell132.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell132.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell133 = new PdfPCell(new Phrase(cr9, rectemja));
                    cell133.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell133.setBorder(Rectangle.LEFT | Rectangle.RIGHT);

                    tableStatement.addCell(cell131);
                    tableStatement.addCell(cell132);
                    tableStatement.addCell(cell133);

                    PdfPCell cell141 = new PdfPCell(new Phrase("October", rectemja));
                    cell141.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell141.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell142 = new PdfPCell(new Phrase(dr10, rectemja));
                    cell142.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell142.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell143 = new PdfPCell(new Phrase(cr10, rectemja));
                    cell143.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell143.setBorder(Rectangle.LEFT | Rectangle.RIGHT);

                    tableStatement.addCell(cell141);
                    tableStatement.addCell(cell142);
                    tableStatement.addCell(cell143);

                    PdfPCell cell151 = new PdfPCell(new Phrase("November", rectemja));
                    cell151.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell151.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell152 = new PdfPCell(new Phrase(dr11, rectemja));
                    cell152.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell152.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell153 = new PdfPCell(new Phrase(cr11, rectemja));
                    cell153.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell153.setBorder(Rectangle.LEFT | Rectangle.RIGHT);

                    tableStatement.addCell(cell151);
                    tableStatement.addCell(cell152);
                    tableStatement.addCell(cell153);

                    PdfPCell cell161 = new PdfPCell(new Phrase("December", rectemja));
                    cell161.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell161.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell162 = new PdfPCell(new Phrase(dr12, rectemja));
                    cell162.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell162.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell163 = new PdfPCell(new Phrase(cr12, rectemja));
                    cell163.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell163.setBorder(Rectangle.LEFT | Rectangle.RIGHT);

                    tableStatement.addCell(cell161);
                    tableStatement.addCell(cell162);
                    tableStatement.addCell(cell163);

                    PdfPCell cell171 = new PdfPCell(new Phrase("Total", rectem));
                    cell171.setHorizontalAlignment(Element.ALIGN_LEFT);
                    PdfPCell cell172 = new PdfPCell(new Phrase(yearDebit, rectemja));
                    cell172.setHorizontalAlignment(Element.ALIGN_CENTER);
                    PdfPCell cell173 = new PdfPCell(new Phrase(yearCredit, rectemja));
                    cell173.setHorizontalAlignment(Element.ALIGN_CENTER);

                    tableStatement.addCell(cell171);
                    tableStatement.addCell(cell172);
                    tableStatement.addCell(cell173);

                    //Summary
                    PdfPTable tableSummary = new PdfPTable(2);
                    tableSummary.setWidths(new float[]{10.5f, 4f});
                    tableSummary.setLockedWidth(true);
                    tableSummary.setTotalWidth(document.right() - document.left());

                    PdfPCell cell181 = new PdfPCell(new Phrase("\nDebit of last year (RM)", rectem));
                    cell181.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell181.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell182 = new PdfPCell(new Phrase("\n" + lastYearDebit, rectemja));
                    cell182.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cell182.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell191 = new PdfPCell(new Phrase("Credit of last year (RM)", rectem));
                    cell191.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell191.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell192 = new PdfPCell(new Phrase("" + lastYearCredit, rectemja));
                    cell192.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cell192.setBorder(Rectangle.NO_BORDER);

                    tableSummary.addCell(cell181);
                    tableSummary.addCell(cell182);
                    tableSummary.addCell(cell191);
                    tableSummary.addCell(cell192);

                    totalYearCredit = Double.parseDouble(yearCredit) + Double.parseDouble(lastYearCredit);
                    totalYearDebit = Double.parseDouble(yearDebit) + Double.parseDouble(lastYearDebit);
                    deficient = totalYearDebit - totalYearCredit;

                    PdfPCell cell201 = new PdfPCell(new Phrase("\nTotal Debit (RM)", rectem));
                    cell201.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell201.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell202 = new PdfPCell(new Phrase("\n" + df.format(totalYearDebit), rectemja));
                    cell202.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cell202.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell211 = new PdfPCell(new Phrase("Total Credit (RM)", rectem));
                    cell211.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell211.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell212 = new PdfPCell(new Phrase("" + df.format(totalYearCredit), rectemja));
                    cell212.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cell212.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell221 = new PdfPCell(new Phrase("Deficient (RM)", rectem));
                    cell221.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell221.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell222 = new PdfPCell(new Phrase("" + df.format(deficient) + "\n\n", rectemja));
                    cell222.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cell222.setBorder(Rectangle.NO_BORDER);

                    tableSummary.addCell(cell201);
                    tableSummary.addCell(cell202);
                    tableSummary.addCell(cell211);
                    tableSummary.addCell(cell212);
                    tableSummary.addCell(cell221);
                    tableSummary.addCell(cell222);

                    //footer
                    PdfPTable tableFooter = new PdfPTable(1);
                    tableFooter.setWidths(new float[]{10.5f});
                    tableFooter.setLockedWidth(true);
                    tableFooter.setTotalWidth(document.right() - document.left());

                    String message1 = "****End of Report****";
                    PdfPCell cellFooter1 = new PdfPCell(new Phrase(message1, rectemja));
                    cellFooter1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cellFooter1.setBorder(Rectangle.TOP);

                    tableFooter.addCell(cellFooter1);

                    document.add(tableHeader);
                    document.add(tableCust);
                    document.add(tableStatement);
                    document.add(tableSummary);
                    document.add(tableFooter);
                    document.close();
                    writer.close();
                    
                    // setting some response headers
                    response.setHeader("Expires", "0");
                    response.setHeader("Cache-Control",
                        "must-revalidate, post-check=0, pre-check=0");
                    response.setHeader("Pragma", "public");
                    // setting the content type
                    response.setContentType("application/pdf");
                    // the contentlength
                    response.setContentLength(baos.size());
                    // write ByteArrayOutputStream to the ServletOutputStream
                    OutputStream os = response.getOutputStream();
                    baos.writeTo(os);
                    os.flush();
                    os.close();

                    if (email != null){
//                        EmailSender es = new EmailSender(email, "Yearly Account Statement", "", "YearStatement.pdf");
//                        es.sendEmail();
                    }

                }catch(Exception e){
                    JOptionPane.showMessageDialog(null, e);
                }
            }
        }
    }
     
     private void generateDetailsStatement(String ic, String month, String year, HttpServletResponse response){
         
        if (!month.equals("00")){
            String period = year + "-" + month + "-";
            
            String sql1 = "SELECT "
                    + "pb.pmi_no, pb.patient_name, pb.id_no, pb.home_address, pb.mobile_phone, pb.email_address "
                    + "FROM pms_patient_biodata pb, far_customer_ledger cl "
                    + "WHERE pb.pmi_no = cl.customer_id "
                    + "AND pb.new_ic_no = '"+ ic +"'";
            ArrayList<ArrayList<String>> dataPatient = Conn.getData(sql1);
            
            if(!dataPatient.isEmpty()){
                String pmiNo = dataPatient.get(0).get(0);
                String name = dataPatient.get(0).get(1);
                String address = dataPatient.get(0).get(3);
                String email =dataPatient.get(0).get(5);
                
                String sql2 = "SELECT "
                        + "ch.txn_date, ch.bill_no, ch.item_amt, ch.amt_paid "
                        + "FROM far_customer_hdr ch, pms_patient_biodata pb "
                        + "WHERE ch.customer_id = pb.pmi_no "
                        + "AND pb.new_ic_no = '"+ ic +"' "
                        + "AND ch.txn_date LIKE '%"+ period +"%' "
                        + "ORDER BY ch.txn_date, ch.bill_no";
                ArrayList<ArrayList<String>> dataBill =Conn.getData(sql2);

                //create new document
                Document document = new Document(PageSize.A4, 36, 36, 64, 36) {}; 
                document.setMargins(40, 30, 50, 50); 

                try {
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    PdfWriter writer = PdfWriter.getInstance(document, baos);
                    document.open();

                    //initialize pdf
                    Font recti = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
                    Font rectem = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
                    Font rectemja = new Font(Font.FontFamily.COURIER, 12);

                    //header
                    PdfPTable table = new PdfPTable(6);
                    table.setWidths(new float[]{0.5f, 1.5f, 4f, 1.5f, 1.5f, 1.5f});
                    table.setLockedWidth(true);
                    table.setTotalWidth(document.right() - document.left());

                    PdfPTable tableHeader = new PdfPTable(4);
                    tableHeader.setWidths(new float[]{3f, 4f, 3.5f, 4f});
                    tableHeader.setLockedWidth(true);
                    tableHeader.setTotalWidth(document.right() - document.left());

                    Image logo = Image.getInstance("logoUTeM/LogoJawiUTeM.png");
                    logo.scaleAbsolute(120, 60);

                    PdfPCell cellLogo = new PdfPCell(logo);
                    cellLogo.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cellLogo.setBorder(Rectangle.NO_BORDER);
                    cellLogo.setColspan(4);
                    cellLogo.setLeading(15f, 0.3f);
                    tableHeader.addCell(cellLogo);
                    
                    PdfPCell cellLocation = new PdfPCell(new Phrase("Pusat Kesihatan UTeM", recti));
                    cellLocation.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cellLocation.setBorder(Rectangle.NO_BORDER);
                    cellLocation.setColspan(4);
                    tableHeader.addCell(cellLocation);
                    
                    PdfPCell cellAnnual1 = new PdfPCell(new Phrase("\nCustomer Details Account Statement\n"
                            + "for "+ month +" of "+ year +"\n\n", recti));
                    cellAnnual1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cellAnnual1.setBorder(Rectangle.NO_BORDER);
                    cellAnnual1.setColspan(4);
                    tableHeader.addCell(cellAnnual1);  

                    //Customer Details
                    PdfPTable tableCust = new PdfPTable(1);
                    tableCust.setWidths(new float[]{10f});
                    tableCust.setLockedWidth(true);
                    tableCust.setTotalWidth(document.right() - document.left());

                    PdfPCell cell11 = new PdfPCell(new Phrase(name, rectemja));
                    cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell11.setBorder(Rectangle.NO_BORDER);
                    cell11.setColspan(3);

                    PdfPCell cell21 = new PdfPCell(new Phrase(address, rectemja));
                    cell21.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell21.setBorder(Rectangle.NO_BORDER);
                    cell21.setColspan(3);

                    PdfPCell cell31 = new PdfPCell(new Phrase("\nReport Date: " + strCurrentDate + "\n\n", rectemja));
                    cell31.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell31.setBorder(Rectangle.NO_BORDER);
                    cell31.setColspan(3);

                    tableCust.addCell(cell11);
                    tableCust.addCell(cell21);
                    tableCust.addCell(cell31);

                    PdfPTable tableTitle = new PdfPTable(3);
                    tableTitle.setWidths(new float[]{3f, 10f, 2f});
                    tableTitle.setLockedWidth(true);
                    tableTitle.setTotalWidth(document.right() - document.left());

                    PdfPCell cell61 = new PdfPCell(new Phrase("Txn Date", rectem));
                    cell61.setHorizontalAlignment(Element.ALIGN_LEFT);
                    PdfPCell cell62 = new PdfPCell(new Phrase("Description", rectem));
                    cell62.setHorizontalAlignment(Element.ALIGN_CENTER);
                    PdfPCell cell63 = new PdfPCell(new Phrase("Amount (RM)", rectem));
                    cell63.setHorizontalAlignment(Element.ALIGN_CENTER);

                    tableTitle.addCell(cell61);
                    tableTitle.addCell(cell62);
                    tableTitle.addCell(cell63);
                                        
                    document.add(tableHeader);
                    document.add(tableCust);
                    document.add(tableTitle);

                    double debit = 0;
                    double credit = 0;
                    for(int i = 0; i < dataBill.size(); i++){
                        String dateHdr = dataBill.get(i).get(0);
                        String billNo = dataBill.get(i).get(1);
                        String billAmt = dataBill.get(i).get(2);
                        String amtPaid = dataBill.get(i).get(3);
                        
                        debit += Double.parseDouble(billAmt);
                        credit += Double.parseDouble(amtPaid);
                        
                        String sql3 = "SELECT "
                                + "txn_date, item_desc, quantity, item_amt "
                                + "FROM far_customer_dtl "
                                + "WHERE bill_no = '"+ billNo +"'";
                        ArrayList<ArrayList<String>> dataItem = Conn.getData(sql3);
                        
                        PdfPTable tableBill = new PdfPTable(3);
                        tableBill.setWidths(new float[]{3f, 10f, 2f});
                        tableBill.setLockedWidth(true);
                        tableBill.setTotalWidth(document.right() - document.left());

                        PdfPCell cell71 = new PdfPCell(new Phrase(dateHdr, rectemja));
                        cell71.setHorizontalAlignment(Element.ALIGN_LEFT);
                        PdfPCell cell72 = new PdfPCell(new Phrase(billNo + " (Bill No)", rectemja));
                        cell72.setHorizontalAlignment(Element.ALIGN_LEFT);
                        PdfPCell cell73 = new PdfPCell(new Phrase(billAmt, rectemja));
                        cell73.setHorizontalAlignment(Element.ALIGN_CENTER);

                        tableBill.addCell(cell71);
                        tableBill.addCell(cell72);
                        tableBill.addCell(cell73);
                        
                        document.add(tableBill);
                        
                        for(int j = 0; j < dataItem.size(); j++){
                            String dateDtl = dataItem.get(j).get(0);
                            String itemName = dataItem.get(j).get(1);
                            String itemQty = dataItem.get(j).get(2);
                            String itemAmt = dataItem.get(j).get(3);
                            
                            PdfPTable tableItems = new PdfPTable(4);
                            tableItems.setWidths(new float[]{3f, 9f, 1f, 2f});
                            tableItems.setLockedWidth(true);
                            tableItems.setTotalWidth(document.right() - document.left());

                            PdfPCell cell81 = new PdfPCell(new Phrase("", rectemja));
                            cell81.setHorizontalAlignment(Element.ALIGN_LEFT);
                            cell81.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                            PdfPCell cell82 = new PdfPCell(new Phrase(itemName, rectemja));
                            cell82.setHorizontalAlignment(Element.ALIGN_CENTER);
                            cell82.setBorder(Rectangle.NO_BORDER);
                            PdfPCell cell83 = new PdfPCell(new Phrase(itemQty, rectemja));
                            cell83.setHorizontalAlignment(Element.ALIGN_CENTER);
                            cell83.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                            PdfPCell cell84 = new PdfPCell(new Phrase(itemAmt, rectemja));
                            cell84.setHorizontalAlignment(Element.ALIGN_CENTER);
                            cell84.setBorder(Rectangle.RIGHT);
                            
                            if(j == dataItem.size() - 1){
                                cell81.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
                                cell82.setBorder(Rectangle.BOTTOM);
                                cell83.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
                                cell84.setBorder(Rectangle.RIGHT | Rectangle.BOTTOM);
                            } 

                            tableItems.addCell(cell81);
                            tableItems.addCell(cell82);
                            tableItems.addCell(cell83);
                            tableItems.addCell(cell84);
                            
                            document.add(tableItems);
                        }
                    }
                    
                    //Summary
                    PdfPTable tableSummary = new PdfPTable(2);
                    tableSummary.setWidths(new float[]{10.5f, 4f});
                    tableSummary.setLockedWidth(true);
                    tableSummary.setTotalWidth(document.right() - document.left());
                    
                    PdfPCell cell41 = new PdfPCell(new Phrase("\nTotal Debit of "+ month +" (RM)", rectem));
                    cell41.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell41.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell42 = new PdfPCell(new Phrase("\n" + df.format(debit), rectemja));
                    cell42.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cell42.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell51 = new PdfPCell(new Phrase("Total Credit of "+ month +" (RM)", rectem));
                    cell51.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell51.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell52 = new PdfPCell(new Phrase(df.format(credit), rectemja));
                    cell52.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cell52.setBorder(Rectangle.NO_BORDER);

                    tableSummary.addCell(cell41);
                    tableSummary.addCell(cell42);
                    tableSummary.addCell(cell51);
                    tableSummary.addCell(cell52);
                    
                    PdfPTable tableFooter = new PdfPTable(1);
                    tableFooter.setWidths(new float[]{10.5f});
                    tableFooter.setLockedWidth(true);
                    tableFooter.setTotalWidth(document.right() - document.left());
                    
                    PdfPCell cellFooter0 = new PdfPCell(new Phrase("", rectemja));
                    cellFooter0.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cellFooter0.setBorder(Rectangle.NO_BORDER);
                    String message1 = "****End of Report****";
                    PdfPCell cellFooter1 = new PdfPCell(new Phrase(message1, rectemja));
                    cellFooter1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cellFooter1.setBorder(Rectangle.TOP);

                    tableFooter.addCell(cellFooter0);
                    tableFooter.addCell(cellFooter1);
                    
                    document.add(tableSummary);
                    document.add(tableFooter);
                    document.close();
                    writer.close();
                    
                    // setting some response headers
                    response.setHeader("Expires", "0");
                    response.setHeader("Cache-Control",
                        "must-revalidate, post-check=0, pre-check=0");
                    response.setHeader("Pragma", "public");
                    // setting the content type
                    response.setContentType("application/pdf");
                    // the contentlength
                    response.setContentLength(baos.size());
                    // write ByteArrayOutputStream to the ServletOutputStream
                    OutputStream os = response.getOutputStream();
                    baos.writeTo(os);
                    os.flush();
                    os.close();
                    
                    if (email != null){
//                        EmailSender es = new EmailSender(email, "Details Account Statement", "", "DetailsStatement.pdf");
//                        es.sendEmail();
                    }
                } catch (Exception e) {
                }
            } else {
                String infoMessage = "Record not found.\nPlease recheck the other ID";
            }
        } else {
            //Print all month
            //create new document
            Document document = new Document(PageSize.A4, 36, 36, 64, 36) {}; 
            document.setMargins(40, 30, 50, 50); 

            try {
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                PdfWriter writer = PdfWriter.getInstance(document, baos);
                document.open();

                String[] monthList = new String[]{"January", "February", "March", "April", "May", "June", 
                                    "July", "August", "September", "October", "November", "December"};

                for(int k = 0; k < monthList.length; k++){
                    String period = year + Month.selectedMonth(monthList[k]);

                    String sql1 = "SELECT "
                            + "pb.pmi_no, pb.patient_name, pb.id_no, pb.home_address, pb.mobile_phone, pb.email_address "
                            + "FROM pms_patient_biodata pb, far_customer_ledger cl "
                            + "WHERE pb.pmi_no = cl.customer_id "
                            + "AND pb.new_ic_no = '"+ ic +"'";
                    ArrayList<ArrayList<String>> dataPatient = Conn.getData(sql1);

                    if (!dataPatient.isEmpty()){
                        String name = dataPatient.get(0).get(1);
                        String address = dataPatient.get(0).get(3);
                        String email = dataPatient.get(0).get(5);

                        String sql2 = "SELECT "
                                + "ch.txn_date, ch.bill_no, ch.item_amt, ch.amt_paid "
                                + "FROM far_customer_hdr ch, pms_patient_biodata pb "
                                + "WHERE ch.customer_id = pb.pmi_no "
                                + "AND pb.new_ic_no = '"+ ic +"' "
                                + "AND ch.txn_date LIKE '%"+ period +"%' "
                                + "ORDER BY ch.txn_date, ch.bill_no";
                        ArrayList<ArrayList<String>> dataBill = Conn.getData(sql2);
                        
                        //Skip current month if no transaction
                        if(dataBill.isEmpty()){
                            if (k == (monthList.length - 1)) {
                                document.close();
                                writer.close();
                                // setting some response headers
                                response.setHeader("Expires", "0");
                                response.setHeader("Cache-Control",
                                    "must-revalidate, post-check=0, pre-check=0");
                                response.setHeader("Pragma", "public");
                                // setting the content type
                                response.setContentType("application/pdf");
                                // the contentlength
                                response.setContentLength(baos.size());
                                // write ByteArrayOutputStream to the ServletOutputStream
                                OutputStream os = response.getOutputStream();
                                baos.writeTo(os);
                                os.flush();
                                os.close();

//                                EmailSender es = new EmailSender(email, "Details Account Statement", "", "DetailsStatement.pdf");
//                                es.sendEmail();
                            }
                            continue;
                        }
                        
                        //initialize pdf
                        Font recti = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
                        Font rectem = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
                        Font rectemja = new Font(Font.FontFamily.COURIER, 12);

                        //header
                        PdfPTable table = new PdfPTable(6);
                        table.setWidths(new float[]{0.5f, 1.5f, 4f, 1.5f, 1.5f, 1.5f});
                        table.setLockedWidth(true);
                        table.setTotalWidth(document.right() - document.left());

                        PdfPTable tableHeader = new PdfPTable(4);
                        tableHeader.setWidths(new float[]{3f, 4f, 3.5f, 4f});
                        tableHeader.setLockedWidth(true);
                        tableHeader.setTotalWidth(document.right() - document.left());

                        Image logo = Image.getInstance("logoUTeM/LogoJawiUTeM.png");
                        logo.scaleAbsolute(120, 60);

                        PdfPCell cellLogo = new PdfPCell(logo);
                        cellLogo.setHorizontalAlignment(Element.ALIGN_CENTER);
                        cellLogo.setBorder(Rectangle.NO_BORDER);
                        cellLogo.setColspan(4);
                        cellLogo.setLeading(15f, 0.3f);
                        tableHeader.addCell(cellLogo);

                        PdfPCell cellLocation = new PdfPCell(new Phrase("Pusat Kesihatan UTeM", recti));
                        cellLocation.setHorizontalAlignment(Element.ALIGN_CENTER);
                        cellLocation.setBorder(Rectangle.NO_BORDER);
                        cellLocation.setColspan(4);
                        tableHeader.addCell(cellLocation);

                        PdfPCell cellAnnual1 = new PdfPCell(new Phrase("\nCustomer Details Account Statement\n"
                                + "for "+ monthList[k] +" of "+ year +"\n\n", recti));
                        cellAnnual1.setHorizontalAlignment(Element.ALIGN_CENTER);
                        cellAnnual1.setBorder(Rectangle.NO_BORDER);
                        cellAnnual1.setColspan(4);
                        tableHeader.addCell(cellAnnual1);                

                        //Customer Details
                        PdfPTable tableCust = new PdfPTable(1);
                        tableCust.setWidths(new float[]{10f});
                        tableCust.setLockedWidth(true);
                        tableCust.setTotalWidth(document.right() - document.left());

                        PdfPCell cell11 = new PdfPCell(new Phrase(name, rectemja));
                        cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
                        cell11.setBorder(Rectangle.NO_BORDER);
                        cell11.setColspan(3);

                        PdfPCell cell21 = new PdfPCell(new Phrase(address, rectemja));
                        cell21.setHorizontalAlignment(Element.ALIGN_LEFT);
                        cell21.setBorder(Rectangle.NO_BORDER);
                        cell21.setColspan(3);

                        PdfPCell cell31 = new PdfPCell(new Phrase("\n" + strCurrentDate + "\n\n", rectemja));
                        cell31.setHorizontalAlignment(Element.ALIGN_LEFT);
                        cell31.setBorder(Rectangle.NO_BORDER);
                        cell31.setColspan(3);

                        tableCust.addCell(cell11);
                        tableCust.addCell(cell21);
                        tableCust.addCell(cell31);

                        PdfPTable tableTitle = new PdfPTable(3);
                        tableTitle.setWidths(new float[]{3f, 10f, 2f});
                        tableTitle.setLockedWidth(true);
                        tableTitle.setTotalWidth(document.right() - document.left());

                        PdfPCell cell61 = new PdfPCell(new Phrase("Txn Date", rectem));
                        cell61.setHorizontalAlignment(Element.ALIGN_LEFT);
                        PdfPCell cell62 = new PdfPCell(new Phrase("Description", rectem));
                        cell62.setHorizontalAlignment(Element.ALIGN_CENTER);
                        PdfPCell cell63 = new PdfPCell(new Phrase("Amount (RM)", rectem));
                        cell63.setHorizontalAlignment(Element.ALIGN_CENTER);

                        tableTitle.addCell(cell61);
                        tableTitle.addCell(cell62);
                        tableTitle.addCell(cell63);

                        document.add(tableHeader);
                        document.add(tableCust);
                        document.add(tableTitle);
                        
                        double debit = 0;
                        double credit = 0;
                        for(int i = 0; i < dataBill.size(); i++){
                            String dateHdr = dataBill.get(i).get(0);
                            String billNo = dataBill.get(i).get(1);
                            String billAmt = dataBill.get(i).get(2);
                            String amtPaid = dataBill.get(i).get(3);
                            
                            debit += Double.parseDouble(billAmt);
                            credit += Double.parseDouble(amtPaid);

                            String sql3 = "SELECT "
                                    + "txn_date, item_desc, quantity, item_amt "
                                    + "FROM far_customer_dtl "
                                    + "WHERE bill_no = '"+ billNo +"'";
                            ArrayList<ArrayList<String>> dataItem = Conn.getData(sql3);

                            PdfPTable tableBill = new PdfPTable(3);
                            tableBill.setWidths(new float[]{3f, 10f, 2f});
                            tableBill.setLockedWidth(true);
                            tableBill.setTotalWidth(document.right() - document.left());

                            PdfPCell cell71 = new PdfPCell(new Phrase(dateHdr, rectemja));
                            cell71.setHorizontalAlignment(Element.ALIGN_LEFT);  
                            PdfPCell cell72 = new PdfPCell(new Phrase(billNo + " (Bill No)", rectemja));
                            cell72.setHorizontalAlignment(Element.ALIGN_LEFT);
                            PdfPCell cell73 = new PdfPCell(new Phrase(billAmt, rectemja));
                            cell73.setHorizontalAlignment(Element.ALIGN_CENTER);

                            tableBill.addCell(cell71);
                            tableBill.addCell(cell72);
                            tableBill.addCell(cell73);

                            document.add(tableBill);

                            for(int j = 0; j < dataItem.size(); j++){
                                String dateDtl = dataItem.get(j).get(0);
                                String itemName = dataItem.get(j).get(1);
                                String itemQty = dataItem.get(j).get(2);
                                String itemAmt = dataItem.get(j).get(3);

                                PdfPTable tableItems = new PdfPTable(4);
                                tableItems.setWidths(new float[]{3f, 9f, 1f, 2f});
                                tableItems.setLockedWidth(true);
                                tableItems.setTotalWidth(document.right() - document.left());

                                PdfPCell cell81 = new PdfPCell(new Phrase("", rectemja));
                                cell81.setHorizontalAlignment(Element.ALIGN_LEFT);
                                cell81.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                                PdfPCell cell82 = new PdfPCell(new Phrase(itemName, rectemja));
                                cell82.setHorizontalAlignment(Element.ALIGN_CENTER);
                                cell82.setBorder(Rectangle.NO_BORDER);
                                PdfPCell cell83 = new PdfPCell(new Phrase(itemQty, rectemja));
                                cell83.setHorizontalAlignment(Element.ALIGN_CENTER);
                                cell83.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                                PdfPCell cell84 = new PdfPCell(new Phrase(itemAmt, rectemja));
                                cell84.setHorizontalAlignment(Element.ALIGN_CENTER);
                                cell84.setBorder(Rectangle.RIGHT);
                                
                                if(j == dataItem.size() - 1){
                                    cell81.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
                                    cell82.setBorder(Rectangle.BOTTOM);
                                    cell83.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
                                    cell84.setBorder(Rectangle.RIGHT | Rectangle.BOTTOM);
                                } 

                                tableItems.addCell(cell81);
                                tableItems.addCell(cell82);
                                tableItems.addCell(cell83);
                                tableItems.addCell(cell84);

                                document.add(tableItems);
                            }
                       }   
                        //Summary
                        PdfPTable tableSummary = new PdfPTable(2);
                        tableSummary.setWidths(new float[]{10.5f, 4f});
                        tableSummary.setLockedWidth(true);
                        tableSummary.setTotalWidth(document.right() - document.left());

                        PdfPCell cell41 = new PdfPCell(new Phrase("\nTotal Debit of "+ monthList[k] +" (RM)", rectem));
                        cell41.setHorizontalAlignment(Element.ALIGN_LEFT);
                        cell41.setBorder(Rectangle.NO_BORDER);
                        PdfPCell cell42 = new PdfPCell(new Phrase("\n" + df.format(debit), rectemja));
                        cell42.setHorizontalAlignment(Element.ALIGN_RIGHT);
                        cell42.setBorder(Rectangle.NO_BORDER);
                        PdfPCell cell51 = new PdfPCell(new Phrase("Total Credit of "+ monthList[k] +" (RM)", rectem));
                        cell51.setHorizontalAlignment(Element.ALIGN_LEFT);
                        cell51.setBorder(Rectangle.NO_BORDER);
                        PdfPCell cell52 = new PdfPCell(new Phrase(df.format(credit), rectemja));
                        cell52.setHorizontalAlignment(Element.ALIGN_RIGHT);
                        cell52.setBorder(Rectangle.NO_BORDER);

                        tableSummary.addCell(cell41);
                        tableSummary.addCell(cell42);
                        tableSummary.addCell(cell51);
                        tableSummary.addCell(cell52);
                        
                        PdfPTable tableFooter = new PdfPTable(1);
                        tableFooter.setWidths(new float[]{10.5f});
                        tableFooter.setLockedWidth(true);
                        tableFooter.setTotalWidth(document.right() - document.left());

                        PdfPCell cellFooter0 = new PdfPCell(new Phrase("", rectemja));
                        cellFooter0.setHorizontalAlignment(Element.ALIGN_CENTER);
                        cellFooter0.setBorder(Rectangle.NO_BORDER);
                        String message1 = "****End of Report****";
                        PdfPCell cellFooter1 = new PdfPCell(new Phrase(message1, rectemja));
                        cellFooter1.setHorizontalAlignment(Element.ALIGN_CENTER);
                        cellFooter1.setBorder(Rectangle.TOP);

                        tableFooter.addCell(cellFooter0);
                        tableFooter.addCell(cellFooter1);

                        document.add(tableSummary);
                        document.add(tableFooter);
                        document.newPage();

                    } else {
                        String infoMessage = "Record not found.\nPlease recheck the other ID";
                        JOptionPane.showMessageDialog(null, infoMessage, "Not found", JOptionPane.WARNING_MESSAGE);
                        break;
                    }
                }
            }catch (Exception e){
                JOptionPane.showMessageDialog(null, e);
            }
        }
    }
     
     private void generateYearEndProcessingReport(HttpServletResponse response){
        String sql = 
                "SELECT pb.patient_name, cl.customer_id, IFNULL(cl.dr_amt_13, 0), IFNULL(cl.cr_amt_13,0) "
                + "FROM far_customer_ledger cl, pms_patient_biodata pb "
                + "WHERE cl.customer_id = pb.pmi_no";
        ArrayList<ArrayList<String>> data = Conn.getData(sql);
        
        if(data.isEmpty()){
            String infoMessage = "There is no year end processing has been done before.";
            JOptionPane.showMessageDialog(null, infoMessage, "Warning", JOptionPane.WARNING_MESSAGE);
        } else{

            //create new document
            Document document = new Document(PageSize.A4, 36, 36, 64, 36) {}; 
            document.setMargins(40, 30, 50, 50); 

            double deficient = 0;
            double totalYearCredit = 0;
            double totalYearDebit = 0;

            try {
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                PdfWriter writer = PdfWriter.getInstance(document, baos);
                document.open();

                //initialize pdf
                Font recti = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
                Font rectem = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
                Font rectemja = new Font(Font.FontFamily.COURIER, 12);

                //header
                PdfPTable table = new PdfPTable(6);
                table.setWidths(new float[]{0.5f, 1.5f, 4f, 1.5f, 1.5f, 1.5f});
                table.setLockedWidth(true);
                table.setTotalWidth(document.right() - document.left());

                PdfPTable tableHeader = new PdfPTable(4);
                tableHeader.setWidths(new float[]{3f, 4f, 3.5f, 4f});
                tableHeader.setLockedWidth(true);
                tableHeader.setTotalWidth(document.right() - document.left());

                Image logo = Image.getInstance("logoUTeM/LogoJawiUTeM.png");
                logo.scaleAbsolute(120, 60);

                PdfPCell cellLogo = new PdfPCell(logo);
                cellLogo.setHorizontalAlignment(Element.ALIGN_CENTER);
                cellLogo.setBorder(Rectangle.NO_BORDER);
                cellLogo.setColspan(4);
                cellLogo.setLeading(15f, 0.3f);
                tableHeader.addCell(cellLogo);

                PdfPCell cellLocation = new PdfPCell(new Phrase("Pusat Kesihatan UTeM", recti));
                cellLocation.setHorizontalAlignment(Element.ALIGN_CENTER);
                cellLocation.setBorder(Rectangle.NO_BORDER);
                cellLocation.setColspan(4);
                tableHeader.addCell(cellLocation);

                String yepsql = "SELECT processed_year "
                        + "FROM far_year_end_parameter "
                        + "WHERE code = 'yep'";
                ArrayList<ArrayList<String>> yep = Conn.getData(yepsql);
                String processedYear = yep.get(0).get(0);

                PdfPCell cellAnnual = new PdfPCell(new Phrase("\nYear End Processing Report\n"
                        + "for year "+ processedYear +"\n\n", recti));
                cellAnnual.setHorizontalAlignment(Element.ALIGN_CENTER);
                cellAnnual.setBorder(Rectangle.NO_BORDER);
                cellAnnual.setColspan(4);
                tableHeader.addCell(cellAnnual);                

                PdfPCell cell31 = new PdfPCell(new Phrase("\nReport Date: " + strCurrentDate + "\n\n", rectemja));
                cell31.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell31.setBorder(Rectangle.NO_BORDER);
                cell31.setColspan(4);
                tableHeader.addCell(cell31);

                PdfPTable tableCust = new PdfPTable(4);
                tableCust.setWidths(new float[]{2.5f, 5f, 2f, 2f});
                tableCust.setLockedWidth(true);
                tableCust.setTotalWidth(document.right() - document.left());

                PdfPCell cell41 = new PdfPCell(new Phrase("Cust ID", rectem));
                cell41.setHorizontalAlignment(Element.ALIGN_LEFT);
                PdfPCell cell42 = new PdfPCell(new Phrase("Cust Name", rectem));
                cell42.setHorizontalAlignment(Element.ALIGN_LEFT);
                PdfPCell cell43 = new PdfPCell(new Phrase("Debit (RM)", rectem));
                cell43.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cell44 = new PdfPCell(new Phrase("Credit (RM)", rectem));
                cell44.setHorizontalAlignment(Element.ALIGN_CENTER);

                tableCust.addCell(cell41);
                tableCust.addCell(cell42);
                tableCust.addCell(cell43);
                tableCust.addCell(cell44);

                for(int i = 0; i < data.size(); i++){
                    String name = data.get(i).get(0);
                    String custId = data.get(i).get(1);
                    String yearDebit = data.get(i).get(2);
                    String yearCredit = data.get(i).get(3);

                    PdfPCell cell161 = new PdfPCell(new Phrase(custId, rectemja));
                    cell161.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell161.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell162 = new PdfPCell(new Phrase(name, rectemja));
                    cell162.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell162.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell163 = new PdfPCell(new Phrase(yearDebit, rectemja));
                    cell163.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell163.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    PdfPCell cell164 = new PdfPCell(new Phrase(yearCredit, rectemja));
                    cell164.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell164.setBorder(Rectangle.LEFT | Rectangle.RIGHT);

                    tableCust.addCell(cell161);
                    tableCust.addCell(cell162);
                    tableCust.addCell(cell163);
                    tableCust.addCell(cell164);

                    totalYearDebit += Double.parseDouble(yearDebit);
                    totalYearCredit += Double.parseDouble(yearCredit);
                }

                PdfPCell cell171 = new PdfPCell(new Phrase("Total", rectem));
                cell171.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell171.setColspan(2);
                PdfPCell cell172 = new PdfPCell(new Phrase(df.format(totalYearDebit), rectemja));
                cell172.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cell173 = new PdfPCell(new Phrase(df.format(totalYearCredit), rectemja));
                cell173.setHorizontalAlignment(Element.ALIGN_CENTER);

                tableCust.addCell(cell171);
                tableCust.addCell(cell172);
                tableCust.addCell(cell173);

                //Summary
                PdfPTable tableSummary = new PdfPTable(2);
                tableSummary.setWidths(new float[]{10.5f, 4f});
                tableSummary.setLockedWidth(true);
                tableSummary.setTotalWidth(document.right() - document.left());

                deficient = totalYearDebit - totalYearCredit;

                PdfPCell cell201 = new PdfPCell(new Phrase("\nTotal Debit (RM)", rectem));
                cell201.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell201.setBorder(Rectangle.NO_BORDER);
                PdfPCell cell202 = new PdfPCell(new Phrase("\n" + df.format(totalYearDebit), rectemja));
                cell202.setHorizontalAlignment(Element.ALIGN_RIGHT);
                cell202.setBorder(Rectangle.NO_BORDER);
                PdfPCell cell211 = new PdfPCell(new Phrase("Total Credit (RM)", rectem));
                cell211.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell211.setBorder(Rectangle.NO_BORDER);
                PdfPCell cell212 = new PdfPCell(new Phrase("" + df.format(totalYearCredit), rectemja));
                cell212.setHorizontalAlignment(Element.ALIGN_RIGHT);
                cell212.setBorder(Rectangle.NO_BORDER);
                PdfPCell cell221 = new PdfPCell(new Phrase("Deficient of Customers (RM)", rectem));
                cell221.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell221.setBorder(Rectangle.NO_BORDER);
                PdfPCell cell222 = new PdfPCell(new Phrase("" + df.format(deficient) + "\n\n", rectemja));
                cell222.setHorizontalAlignment(Element.ALIGN_RIGHT);
                cell222.setBorder(Rectangle.NO_BORDER);

                tableSummary.addCell(cell201);
                tableSummary.addCell(cell202);
                tableSummary.addCell(cell211);
                tableSummary.addCell(cell212);
                tableSummary.addCell(cell221);
                tableSummary.addCell(cell222);

                //footer
                PdfPTable tableFooter = new PdfPTable(1);
                tableFooter.setWidths(new float[]{10.5f});
                tableFooter.setLockedWidth(true);
                tableFooter.setTotalWidth(document.right() - document.left());

                String message1 = "****End of Report****";
                PdfPCell cellFooter1 = new PdfPCell(new Phrase(message1, rectemja));
                cellFooter1.setHorizontalAlignment(Element.ALIGN_CENTER);
                cellFooter1.setBorder(Rectangle.TOP);

                tableFooter.addCell(cellFooter1);

                document.add(tableHeader);
                document.add(tableCust);
                document.add(tableSummary);
                document.add(tableFooter);
                document.close();
                writer.close();

                // setting some response headers
                response.setHeader("Expires", "0");
                response.setHeader("Cache-Control",
                    "must-revalidate, post-check=0, pre-check=0");
                response.setHeader("Pragma", "public");
                // setting the content type
                response.setContentType("application/pdf");
                // the contentlength
                response.setContentLength(baos.size());
                // write ByteArrayOutputStream to the ServletOutputStream
                OutputStream os = response.getOutputStream();
                baos.writeTo(os);
                os.flush();
                os.close();
                
            }catch(Exception e){
                String infoMessage = "There is an error occur.\nPlease contact service provider.";
            }
        }
    }
}
