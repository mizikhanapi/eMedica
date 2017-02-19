/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Formatter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class DateFormatter {

    public static String formatDate(String date, String initDateFormat, String endDateFormat) throws ParseException {

        Date initDate = new SimpleDateFormat(initDateFormat).parse(date);
        SimpleDateFormat formatter = new SimpleDateFormat(endDateFormat);
        String parsedDate = formatter.format(initDate);

        return parsedDate;
    }
    
//    public static void main(String []args){
//    
//        String oridate = "02/02/2017"; //03/02/2017
//        
//        String resultDate = null;
//        
//        try {
//            resultDate = DateFormatter.formatDate(oridate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
//        } catch (ParseException ex) {
//            Logger.getLogger(DateFormatter.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        System.out.println("hasilnya: "+resultDate);
//
//    
//    }

}
