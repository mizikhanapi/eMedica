package Config;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Config extends HttpServlet {

    public static String url_server = "10.73.32.200";
    public static String FULL_URL = "";
    public static String FILE_URL = "";

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
