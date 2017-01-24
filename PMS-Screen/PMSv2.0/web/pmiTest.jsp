

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int quotientA = 0;
    int remainderA = 0;
    int quotientB = 0;
    int remainderB = 0;
    String sequence = null;
    String sequence2 = null;
    int i = 1;
    String weight = "1,7,3,1,7,3,1,7,3,1,7,3"; //predetermined number
    int checkdigit = 0;
    int nilai = 1;

    RMIConnector rmic = new RMIConnector();
    String sql = "SELECT pmi_i "
            + "FROM autogenerated_pmi "
            + "ORDER BY pmi_i DESC";
    ArrayList<ArrayList<String>> seq = Conn.getData(sql);

    for (int w = 0; w < seq.size(); i++) {
        nilai = Integer.parseInt(seq.get(i).get(0));
        int newNilai = nilai + 1;
        String sql2 = "INSERT INTO autogenerated_pmi(pmi_i)VALUES(" + newNilai + ")";
        rmic.setQuerySQL(Conn.HOST, Conn.PORT, sql2);
        i = nilai;
        
        int length = String.valueOf(i).length();
        //generate last sequence in digits
        String giliran = String.valueOf(i);
        if (length == 2) {
            sequence = "0000000000" + String.valueOf(i);
            sequence2 = "0,0,0,0,0,0,0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1);
        } else if (length == 1) {
            sequence = "00000000000" + String.valueOf(i);
            sequence2 = "0,0,0,0,0,0,0,0,0,0,0," + giliran.substring(0);
        } else if (length == 3) {
            sequence = "000000000" + String.valueOf(i);
            sequence2 = "0,0,0,0,0,0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2);
        } else if (length == 4) {
            sequence = "00000000" + String.valueOf(i);
            sequence2 = "0,0,0,0,0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3);
        } else if (length == 5) {
            sequence = "0000000" + String.valueOf(i);
            sequence2 = "0,0,0,0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4);
        } else if (length == 6) {
            sequence = "000000" + String.valueOf(i);
            sequence2 = "0,0,0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5);
        } else if (length == 7) {
            sequence = "00000" + String.valueOf(i);
            sequence2 = "0,0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5, 6) + "," + giliran.substring(6);
        } else if (length == 8) {
            sequence = "0000" + String.valueOf(i);
            sequence2 = "0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5, 6) + "," + giliran.substring(6, 7) + "," + giliran.substring(7);
        } else if (length == 9) {
            sequence = "000" + String.valueOf(i);
            sequence2 = "0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5, 6) + "," + giliran.substring(6, 7) + "," + giliran.substring(7, 8) + "," + giliran.substring(8);
        } else if (length == 10) {
            sequence = "00" + String.valueOf(i);
            sequence2 = "0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5, 6) + "," + giliran.substring(6, 7) + "," + giliran.substring(8, 9) + "," + giliran.substring(9);
        } else if (length == 11) {
            sequence = "0" + String.valueOf(i);
            sequence2 = "0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5, 6) + "," + giliran.substring(6, 7) + "," + giliran.substring(8, 9) + "," + giliran.substring(9, 10) + "," + giliran.substring(10);
        } else if (length == 12) {
            sequence = String.valueOf(i);
            sequence2 = giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5, 6) + "," + giliran.substring(6, 7) + "," + giliran.substring(8, 9) + "," + giliran.substring(9, 10) + "," + giliran.substring(10, 11) + "," + giliran.substring(11, 12) + "," + giliran.substring(12);
        }
        
        int totalA = 0;
        int totalB = 0;
        int totalC = 0;
        int totalD = 0;
        //split weight into array
        String[] susunan = weight.split(",");
        //split sequence number into array
        String[] susunansequence = sequence2.split(",");
        //total sum (each digi in sequence number + weight)
        for (int a = 0; a < 12; a++) {
            totalA = totalA + (Integer.parseInt(susunan[a]) * Integer.parseInt(susunansequence[a]));
        }
        //quotient A
        quotientA = totalA / 10;
        //remainder A
        remainderA = totalA % 10;
        if (remainderA == 0) {
            sequence = sequence + remainderA;
        } else if (remainderA != 0) {
            //total B
            totalB = totalA + 10;
            //quotient B
            quotientB = totalB / 10;
            //remainder B
            remainderB = totalB % 10;
            //total C
            totalC = totalB - remainderB;
            //Total D
            totalD = totalC - totalA;
            //concate sequence number with totalD
            sequence = sequence + Integer.toString(totalD);
            //new check digit value
            checkdigit = totalD;
        }
        out.println(sequence);
        i++;
        String nric = "950607015245";
        String newNric = nric + Integer.toString(checkdigit);
        out.print(newNric);
%>