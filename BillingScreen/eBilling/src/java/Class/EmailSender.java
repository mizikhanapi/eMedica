/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

import com.sun.jersey.core.util.Base64;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import org.json.simple.JSONObject;

/**
 *
 * @author Mike Ho
 */
public class EmailSender {

    private String email = "";
    private String subject = "";
    private String message = "";
    private String fileName = "";
    
    /**
     * Constructor
     * @param email
     * @param subject
     * @param message 
     */
    public EmailSender(String email, String subject, String message){
        this.email = email;
        this.subject = subject;
        this.message = message;
    }
    
    /**
     * Constructor
     * @param email
     * @param subject
     * @param message
     * @param fileName 
     */
    public EmailSender(String email, String subject, String message, String fileName){
        this.email = email;
        this.subject = subject;
        this.message = message;
        this.fileName = fileName;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the subject
     */
    public String getSubject() {
        return subject;
    }

    /**
     * @param subject the subject to set
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the fileName
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * @param fileName the fileName to set
     */
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    
    /**
     * Send email using provided information
     */
    public void sendEmail(){        
        try{            
            JSONObject json = new JSONObject(); 
            json.put("email", getEmail()); 
            json.put("subject", getSubject());                                    
            json.put("message", getMessage());
            
            //if file name is not empty, conver file and add to json
            if (!fileName.equals("")){
                File pdf = new File(fileName);
                byte[] bytes = Files.readAllBytes(pdf.toPath());
                json.put("fileName", pdf.getName());
                json.put("receipt", new String(Base64.encode(bytes)));
            }
//            System.out.println(json);

            URL url = new URL("http://10.73.32.201/SendEmail/Servlet");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");

            OutputStream os = conn.getOutputStream();
            os.write(json.toString().getBytes());
            os.flush();

            if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
            }
            
            BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

            String output;
            System.out.println("Output from Server .... \n");
            while ((output = br.readLine()) != null) {
                    System.out.println(output);
            }
            
            conn.disconnect();

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
