/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mike Ho
 */
public class Config {
    
    public static String url_server = "10.73.32.200";
    public static String FULL_URL = "http://localhost:80/e-Billing/";
    public static String FILE_URL = "/e-Billing/";

    public static String getBase_url(HttpServletRequest request) {
        Config.FULL_URL = "http://" + request.getServerName() + ":" + request.getServerPort() + "" + request.getContextPath() + "/";
        return Config.FULL_URL;
    }
    
    public static String getFile_url(HttpSession session) {
        String jspPath = session.getServletContext().getRealPath("");
        String txtFilePath = jspPath + "/";
        Config.FILE_URL = txtFilePath;
        return Config.FILE_URL;
    }
}
