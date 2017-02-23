package Config;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Config extends HttpServlet {

    //public  String url_server = "10.73.32.200/emedica";
    public static String FULL_URL;
    public static String FILE_URL;
    
    public static String getBase_url(HttpServletRequest request) {
        FULL_URL = "http://" + request.getServerName() + ":" + request.getServerPort() + "" + request.getContextPath() + "/";
        return FULL_URL;
    }
    
    public static String getFile_url(HttpSession session) {
        String jspPath = session.getServletContext().getRealPath("");
        String txtFilePath = jspPath + "/";
        FILE_URL = txtFilePath;
        return FILE_URL;
    }
    
}
