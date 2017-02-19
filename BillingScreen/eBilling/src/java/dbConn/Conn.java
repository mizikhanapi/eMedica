/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConn;

import Config.Config;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;
import main.RMIConnector;

/**
 *
 * @author Mike Ho
 */
public class Conn {
    
    public final static String HOST = "biocore-stag.utem.edu.my";
    public final static int PORT = 1099;
    
    public static ArrayList<ArrayList<String>> getData(String query) 
    {
        RMIConnector rmic = new RMIConnector();
        ArrayList<ArrayList<String>> data = rmic.getQuerySQL(Conn.HOST, Conn.PORT, query);
        
        return data;
    }
    
    public static boolean setData(String query) 
    {
        try{
            RMIConnector rmic = new RMIConnector();
            rmic.setQuerySQL(Conn.HOST, Conn.PORT, query);
            
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
