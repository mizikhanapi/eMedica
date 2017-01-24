/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dBConn;

import Config.Config;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class Conn 
{
    public static String HOST = "";
    public static int PORT = 1099;
    public final static String STR_HOST = "HOST";
    public final static String STR_PORT = "PORT";
    public final static String STR_ERROR = "ERROR";
    
    public Conn() {
        String host_server = Conn.getIpCall().getProperty(Conn.STR_HOST);
        int host_port = 1099;
        try {
            host_port = Integer.parseInt(Conn.getIpCall().getProperty(Conn.STR_PORT));
        } catch (Exception e) {
        }
        Conn.HOST = host_server;
        Conn.PORT = host_port;
    }
    
    public static Properties getIpCall()
    {
        String in = Config.FILE_URL + "ipcall";
        BufferedReader br;
        Properties prop = new Properties();
        try {
            String sCurrentLine = "";
            br = new BufferedReader(new FileReader(in));
            while ((sCurrentLine = br.readLine()) != null) {
                char firstLetter = sCurrentLine.charAt(0);
                if (firstLetter != '#') {
                    String linePecah[] = sCurrentLine.split(":");
                    try {
                        if (linePecah[0] == "hostserver" || linePecah[0].equals("hostserver")) {
                            Conn.HOST = linePecah[1];
                            prop.setProperty(Conn.STR_HOST, linePecah[1]);
                        } else if (linePecah[0] == "hostport" || linePecah[0].equals("hostport")) {
                            Conn.PORT = Integer.parseInt(linePecah[1]);
                            prop.setProperty(Conn.STR_PORT, linePecah[1]);
                        }
                    } catch (Exception e) {
                    }
                }
            }
        } catch (IOException ex) {
            prop.setProperty(Conn.STR_ERROR, ex.getMessage());
        }
        return prop;
    }
    
    public static ArrayList<ArrayList<String>> getData(String query) 
    {
        RMIConnector rmic = new RMIConnector();

       //String host_db = Config.url_server;
        String host_server = Conn.getIpCall().getProperty(Conn.STR_HOST);
        int host_port = 1099;
        try {
            host_port = Integer.parseInt(Conn.getIpCall().getProperty(Conn.STR_PORT));
        } catch (Exception e) {
        }
        
        ArrayList<ArrayList<String>> data = rmic.getQuerySQL(host_server, host_port, query);
        
        return data;
    }
}
