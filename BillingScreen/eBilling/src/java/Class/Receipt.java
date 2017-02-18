/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

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
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mike Ho
 */
public class Receipt extends HttpServlet {
    private DecimalFormat df = new DecimalFormat("0.00");
    private DateFormat dateFormat1 = new SimpleDateFormat("MMyyyy");
    private DateFormat dateFormat2 = new SimpleDateFormat("dd-MM-yyyy"); 
    private Date date = new Date();
    private String date1 = dateFormat1.format(date);
    private String date2 = dateFormat2.format(date);
    
    private String receiptNo = "";
    private String custId = "";
    private String billNo = "";
    private String subtotal = "";
    private String grandTotal = "";
    private String amount = "0.00";
    private String change = "0.00";
    private String gst = "0.00";
    private String serviceCharge = "0.00";
    private String discount = "0.00";
    private String rounding = "0.00";
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        receiptNo = request.getParameter("receiptNo");
        custId = request.getParameter("custID");
        billNo = request.getParameter("billNo");
        subtotal = request.getParameter("subtotal");
        grandTotal = request.getParameter("grandTotal");
        amount = request.getParameter("amt");
        change = request.getParameter("change");
        gst = request.getParameter("gst");
        serviceCharge = request.getParameter("serviceCharge");
        discount = request.getParameter("discount");
        rounding = request.getParameter("rounding");
        
        printPaidBill(response);
    }
    
    public void printPaidBill(HttpServletResponse response) {
        //create new document
        Document document = new Document(PageSize.A4, 36, 36, 64, 36); 
        document.setMargins(40, 30, 50, 50); 

        int num = 0;
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter writer = PdfWriter.getInstance(document, baos);
            document.open(); //open document
            
            //Get patient data from database
            String sql1 = "SELECT "
                    + "pb.patient_name, "
                    + "pb.home_address, "
                    + "cd.customer_id, "
                    + "pb.id_no, "
                    + "pb.mobile_phone, "
                    + "ch.bill_no, "
                    + "ch.txn_date, "
                    + "cd.item_cd, "
                    + "cd.item_desc, "
                    + "cd.quantity, "
                    + "(cd.item_amt/cd.quantity), "
                    + "cd.item_amt, "
                    + "ch.item_amt, "
                    + "ch.bill_no "
                    + "FROM far_customer_hdr ch "
                    + "INNER JOIN far_customer_dtl cd "
                    + "ON ch.bill_no = cd.bill_no "
                    + "INNER JOIN pms_patient_biodata pb "
                    + "ON ch.customer_id = pb.pmi_no "
                    + "WHERE ch.customer_id = '"+ custId +"' "
                    + "AND ch.bill_no = '"+ billNo +"' ";
            ArrayList<ArrayList<String>> data1 = Conn.getData(sql1);

            //Get the last sequence no of receipt
            String sql2 = "SELECT last_seq_no "
                    + "FROM far_last_seq_no "
                    + "WHERE module_name = 'R' "
                    + "FOR UPDATE";
            ArrayList<ArrayList<String>> data2 = Conn.getData(sql2);
            
            String seqNo = data2.get(0).get(0);
            int seq = Integer.parseInt(seqNo);
            int currSeq = seq + 1;
            String currentSeq = Integer.toString(currSeq);
            
            //Update last sequance number of receipt
            String sql3 = "UPDATE far_last_seq_no "
                    + "SET last_seq_no = '"+ currentSeq +"' "
                    + "WHERE module_name = 'R'";
            Conn.setData(sql3);
            
            //Generate receipt no
            int length = (int) Math.log10(currSeq) + 1;
            String zero = "0";
            String tmpNum = currentSeq;
            
            int count;
            for (count = length; count < 10; count++) {
                tmpNum = zero + tmpNum;
            }
            
            receiptNo = tmpNum + date1;

            //initialize pdf
            Font recti = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
            Font rectem = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
            Font rectemja = new Font(Font.FontFamily.COURIER, 12);
            Font rectemjaBold = new Font(Font.FontFamily.COURIER, 12, Font.BOLD);
            Font rectemjaBig = new Font(Font.FontFamily.COURIER, 16, Font.BOLD);
            
            //--------------------------table bill------------------------------------------>
            PdfPTable table = new PdfPTable(6);
            table.setWidths(new float[]{0.5f, 1.5f, 4f, 1.5f, 1.5f, 1.5f});
            table.setLockedWidth(true);
            table.setTotalWidth(document.right() - document.left());
            
            PdfPTable header = new PdfPTable(4);
            header.setWidths(new float[]{3f, 4f, 3.5f, 4f});
            header.setLockedWidth(true);
            header.setTotalWidth(document.right() - document.left());
            
            //--------------------------table header------------------------------------------>
            Image logo = Image.getInstance("logoUTeM/LogoJawiUTeM.png");
            logo.scaleAbsolute(115, 50);

            PdfPCell cell1 = new PdfPCell(logo);
            cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
            cell1.setBorder(Rectangle.NO_BORDER);
            cell1.setColspan(2);
            cell1.setLeading(15f, 0.3f);
            header.addCell(cell1);
            
            String addr = 
                    " Universiti Teknikal Malaysia Melaka, \n"
                    + " Hang Tuah Jaya, \n"
                    + " 76100 Durian Tunggal, \n"
                    + " Melaka, Malaysia.";
            
            PdfPCell cellAddress = new PdfPCell(new Phrase(addr, rectemja));
            cellAddress.setHorizontalAlignment(Element.ALIGN_LEFT);
            cellAddress.setBorder(Rectangle.NO_BORDER);
            cellAddress.setColspan(2);
            header.addCell(cellAddress);
            
            //-----------------------------Title--------------------------------------->
            PdfPCell cell200 = new PdfPCell(new Phrase(" ", recti));
            cell200.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell200.setBorder(Rectangle.NO_BORDER);
            cell200.setColspan(4);
            header.addCell(cell200);
            
            PdfPCell cell2 = new PdfPCell(new Phrase(receiptNo, rectemja));
            cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell2.setBorder(Rectangle.NO_BORDER);
            cell2.setColspan(4);
            header.addCell(cell2);

            PdfPCell cell001 = new PdfPCell(new Phrase(" ", recti));
            cell001.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell001.setBorder(Rectangle.NO_BORDER);
            cell001.setColspan(4);
            header.addCell(cell001);

            String nama = data1.get(0).get(0);
            String address = data1.get(0).get(1);
            String custId = data1.get(0).get(2);
            String id = data1.get(0).get(3);
            String phone = data1.get(0).get(4);
            String billNo = data1.get(0).get(5);
            String date = data1.get(0).get(6);

            //--------------------------Receipt item------------------------------------------>
            PdfPCell cell11 = new PdfPCell(new Phrase("Name", rectem));
            cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell11.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell12 = new PdfPCell(new Phrase(": " + nama, rectemja));
            cell12.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell12.setBorder(Rectangle.NO_BORDER);
            cell12.setColspan(3);

            header.addCell(cell11);
            header.addCell(cell12);

            PdfPCell cell21 = new PdfPCell(new Phrase("Address", rectem));
            cell21.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell21.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell22 = new PdfPCell(new Phrase(": " + address, rectemja));
            cell22.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell22.setBorder(Rectangle.NO_BORDER);
            cell22.setColspan(3);

            header.addCell(cell21);
            header.addCell(cell22);

            PdfPCell cell31 = new PdfPCell(new Phrase("Customer ID", rectem));
            cell31.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell31.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell32 = new PdfPCell(new Phrase(": " + custId, rectemja));
            cell32.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell32.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell33 = new PdfPCell(new Phrase(" ", rectem));
            cell33.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell33.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell34 = new PdfPCell(new Phrase(" ", rectemja));
            cell34.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell34.setBorder(Rectangle.NO_BORDER);

            header.addCell(cell31);
            header.addCell(cell32);
            header.addCell(cell33);
            header.addCell(cell34);

            PdfPCell cell41 = new PdfPCell(new Phrase("Other ID", rectem));
            cell41.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell41.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell42 = new PdfPCell(new Phrase(": " + id, rectemja));
            cell42.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell42.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell43 = new PdfPCell(new Phrase("Bill No", rectem));
            cell43.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell43.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell44 = new PdfPCell(new Phrase(": " + billNo, rectemja));
            cell44.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell44.setBorder(Rectangle.NO_BORDER);

            header.addCell(cell41);
            header.addCell(cell42);
            header.addCell(cell43);
            header.addCell(cell44);

            PdfPCell cell51 = new PdfPCell(new Phrase("No. Tel", rectem));
            cell51.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell51.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell52 = new PdfPCell(new Phrase(": " + phone, rectemja));
            cell52.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell52.setBorder(Rectangle.NO_BORDER);

            PdfPCell cell53 = new PdfPCell(new Phrase("Date", rectem));
            cell53.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell53.setBorder(Rectangle.NO_BORDER);

            PdfPCell cell54 = new PdfPCell(new Phrase(": " + date2, rectemja));
            cell54.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell54.setBorder(Rectangle.NO_BORDER);

            header.addCell(cell51);
            header.addCell(cell52);
            header.addCell(cell53);
            header.addCell(cell54);

            PdfPCell cell002 = new PdfPCell(new Phrase(" ", recti));
            cell002.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell002.setBorder(Rectangle.NO_BORDER);
            cell002.setColspan(4);
            header.addCell(cell002);

            //-------------------------------------------------------------------->
            PdfPCell cell61 = new PdfPCell(new Phrase("No.", rectem));
            cell61.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell61.setBorder(Rectangle.BOTTOM);
            PdfPCell cell62 = new PdfPCell(new Phrase("Item", rectem));
            cell62.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell62.setBorder(Rectangle.BOTTOM);
            PdfPCell cell63 = new PdfPCell(new Phrase("Description", rectem));
            cell63.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell63.setBorder(Rectangle.BOTTOM);
            PdfPCell cell64 = new PdfPCell(new Phrase("Quantity", rectem));
            cell64.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell64.setBorder(Rectangle.BOTTOM);
            PdfPCell cell65 = new PdfPCell(new Phrase("Unit Price", rectem));
            cell65.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell65.setBorder(Rectangle.BOTTOM);
            PdfPCell cell66 = new PdfPCell(new Phrase("Total Price", rectem));
            cell66.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell66.setBorder(Rectangle.BOTTOM);
            
            table.addCell(cell61);
            table.addCell(cell62);
            table.addCell(cell63);
            table.addCell(cell64);
            table.addCell(cell65);
            table.addCell(cell66);

            for (int i = 0; i < data1.size() ; i++) {

                if ((data1.get(i).get(7).charAt(0) == 'B') && (data1.get(i).get(7).charAt(1) == 'P')){
                } else {
                    String no = Integer.toString(num+1);

                    String item = data1.get(i).get(7);
                    String description = data1.get(i).get(8);
                    String quantity = data1.get(i).get(9);
                    String price = df.format(Double.parseDouble(data1.get(i).get(10)));
                    String total = data1.get(i).get(11);

                    PdfPCell cell71 = new PdfPCell(new Phrase(no, rectemja));
                    cell71.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell71.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell72 = new PdfPCell(new Phrase(item, rectemja));
                    cell72.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell72.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell73 = new PdfPCell(new Phrase(description, rectemja));
                    cell73.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cell73.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell74 = new PdfPCell(new Phrase(quantity, rectemja));
                    cell74.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell74.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell75 = new PdfPCell(new Phrase(price, rectemja));
                    cell75.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell75.setBorder(Rectangle.NO_BORDER);
                    PdfPCell cell76 = new PdfPCell(new Phrase(total, rectemja));
                    cell76.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell76.setBorder(Rectangle.NO_BORDER);

                    table.addCell(cell71);
                    table.addCell(cell72);
                    table.addCell(cell73);
                    table.addCell(cell74);
                    table.addCell(cell75);
                    table.addCell(cell76);

                    num++;
                }
            }
            
            //--------------------------table bill------------------------------------------>
            PdfPTable total = new PdfPTable(6);
            total.setWidths(new float[]{0.5f, 1.5f, 4f, 1.5f, 1.5f, 1.5f});
            total.setLockedWidth(true);
            total.setTotalWidth(document.right() - document.left());
            
            //--------------------------table bill------------------------------------------>
            PdfPCell cell81 = new PdfPCell(new Phrase("Sub-Total : RM  ", rectem));
            cell81.setHorizontalAlignment(Element.ALIGN_RIGHT);
            cell81.setColspan(5);
            cell81.setBorder(Rectangle.TOP);
            PdfPCell cell86 = new PdfPCell(new Phrase(String.valueOf(subtotal), rectemjaBold));
            cell86.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell86.setBorder(Rectangle.TOP);
            total.addCell(cell81);
            total.addCell(cell86);
            
            PdfPCell cell91 = new PdfPCell(new Phrase("Service Charge : RM  ", rectem));
            cell91.setHorizontalAlignment(Element.ALIGN_RIGHT);
            cell91.setColspan(5);
            cell91.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell96 = new PdfPCell(new Phrase(String.valueOf(serviceCharge), rectemjaBold));
            cell96.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell96.setBorder(Rectangle.NO_BORDER);
            total.addCell(cell91);
            total.addCell(cell96);
            
            PdfPCell cell101 = new PdfPCell(new Phrase("GST : RM  ", rectem));
            cell101.setHorizontalAlignment(Element.ALIGN_RIGHT);
            cell101.setColspan(5);
            cell101.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell106 = new PdfPCell(new Phrase(String.valueOf(gst), rectemjaBold));
            cell106.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell106.setBorder(Rectangle.NO_BORDER);
            total.addCell(cell101);
            total.addCell(cell106);
            
            PdfPCell cell111 = new PdfPCell(new Phrase("Discount : RM  ", rectem));
            cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
            cell111.setColspan(5);
            cell111.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell116 = new PdfPCell(new Phrase(String.valueOf(discount), rectemjaBold));
            cell116.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell116.setBorder(Rectangle.NO_BORDER);
            total.addCell(cell111);
            total.addCell(cell116);
            
            PdfPCell cell121 = new PdfPCell(new Phrase("Rounding : RM  ", rectem));
            cell121.setHorizontalAlignment(Element.ALIGN_RIGHT);
            cell121.setColspan(5);
            cell121.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell126 = new PdfPCell(new Phrase(String.valueOf(rounding), rectemjaBold));
            cell126.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell126.setBorder(Rectangle.NO_BORDER);
            total.addCell(cell121);
            total.addCell(cell126);
            
            PdfPCell cell130 = new PdfPCell(new Phrase(""));
            cell130.setColspan(3);
            cell130.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell131 = new PdfPCell(new Phrase("Grand Total : RM  ", rectem));
            cell131.setHorizontalAlignment(Element.ALIGN_RIGHT);
            cell131.setColspan(2);
            cell131.setBorder(Rectangle.TOP);
            PdfPCell cell136 = new PdfPCell(new Phrase(String.valueOf(grandTotal), rectemjaBig));
            cell136.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell136.setBorder(Rectangle.TOP);
            total.addCell(cell130);
            total.addCell(cell131);
            total.addCell(cell136);
            
            PdfPCell cell140 = new PdfPCell(new Phrase(""));
            cell140.setColspan(3);
            cell140.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell141 = new PdfPCell(new Phrase("Cash : RM  ", rectem));
            cell141.setHorizontalAlignment(Element.ALIGN_RIGHT);
            cell141.setColspan(2);
            cell141.setBorder(Rectangle.TOP);
            PdfPCell cell146 = new PdfPCell(new Phrase(String.valueOf(amount), rectemjaBold));
            cell146.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell146.setBorder(Rectangle.TOP);
            total.addCell(cell140);
            total.addCell(cell141);
            total.addCell(cell146);
            
            PdfPCell cell151 = new PdfPCell(new Phrase("Change : RM  ", rectem));
            cell151.setHorizontalAlignment(Element.ALIGN_RIGHT);
            cell151.setColspan(5);
            cell151.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell156 = new PdfPCell(new Phrase(String.valueOf(change), rectemjaBold));
            cell156.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell156.setBorder(Rectangle.NO_BORDER);
            total.addCell(cell151);
            total.addCell(cell156);
            
            //----------------------------table footer--------------------------------------->

            PdfPTable footer = new PdfPTable(1);
            footer.setWidths(new float[]{10.5f});
            footer.setLockedWidth(true);
            footer.setTotalWidth(document.right() - document.left());
            
            String message1 = "****Thank You****";
            String message2 = "Please Come Again";
            PdfPCell cell160 = new PdfPCell(new Phrase(message1, rectemja));
            cell160.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell160.setBorder(Rectangle.TOP);
            PdfPCell cell170 = new PdfPCell(new Phrase(message2, rectemja));
            cell170.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell170.setBorder(Rectangle.NO_BORDER);
            
            footer.addCell(cell160);
            footer.addCell(cell170);
            //---------------------------------------------------------------------------->
            document.add(header);
            document.add(table);
            document.add(total);
            document.add(footer);
            
            document.close();//close document
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

        } catch (Exception e) {
        } 
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
