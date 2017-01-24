/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testpmi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author shay
 */
public class TestPmi {

    public int quotientA = 0;
    public int remainderA = 0;
    public int quotientB = 0;
    public int remainderB = 0;
    public String sequence = null;
    public String sequence2 = null;
    public int i;
    public String weight = "1,7,3,1,7,3,1,7,3,1,7,3"; //predetermined number
    public int checkdigit = 0;
    private getPmiController pmiConn;

    public void setI(int pmi_i) {
        
            this.i = pmi_i;
}

    public void get_sequencenumber() {
        //sequence number 12 digit
        int length = String.valueOf(i).length();
        //generate last sequence in digits
        String giliran = String.valueOf(i);
        switch (length) {
            case 2:
                sequence = "0000000000" + String.valueOf(i);
                sequence2 = "0,0,0,0,0,0,0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1);
                break;
            case 1:
                sequence = "00000000000" + String.valueOf(i);
                sequence2 = "0,0,0,0,0,0,0,0,0,0,0," + giliran.substring(0);
                break;
            case 3:
                sequence = "000000000" + String.valueOf(i);
                sequence2 = "0,0,0,0,0,0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2);
                break;
            case 4:
                sequence = "00000000" + String.valueOf(i);
                sequence2 = "0,0,0,0,0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3);
                break;
            case 5:
                sequence = "0000000" + String.valueOf(i);
                sequence2 = "0,0,0,0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4);
                break;
            case 6:
                sequence = "000000" + String.valueOf(i);
                sequence2 = "0,0,0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5);
                break;
            case 7:
                sequence = "00000" + String.valueOf(i);
                sequence2 = "0,0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5, 6) + "," + giliran.substring(6);
                break;
            case 8:
                sequence = "0000" + String.valueOf(i);
                sequence2 = "0,0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5, 6) + "," + giliran.substring(6, 7) + "," + giliran.substring(7);
                break;
            case 9:
                sequence = "000" + String.valueOf(i);
                sequence2 = "0,0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5, 6) + "," + giliran.substring(6, 7) + "," + giliran.substring(7, 8) + "," + giliran.substring(8);
                break;
            case 10:
                sequence = "00" + String.valueOf(i);
                sequence2 = "0,0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5, 6) + "," + giliran.substring(6, 7) + "," + giliran.substring(8, 9) + "," + giliran.substring(9);
                break;
            case 11:
                sequence = "0" + String.valueOf(i);
                sequence2 = "0," + giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5, 6) + "," + giliran.substring(6, 7) + "," + giliran.substring(8, 9) + "," + giliran.substring(9, 10) + "," + giliran.substring(10);
                break;
            case 12:
                sequence = String.valueOf(i);
                sequence2 = giliran.substring(0, 1) + "," + giliran.substring(1, 2) + "," + giliran.substring(2, 3) + "," + giliran.substring(3, 4) + "," + giliran.substring(4, 5) + "," + giliran.substring(5, 6) + "," + giliran.substring(6, 7) + "," + giliran.substring(8, 9) + "," + giliran.substring(9, 10) + "," + giliran.substring(10, 11) + "," + giliran.substring(11, 12) + "," + giliran.substring(12);
                break;
            default:
                break;
        }
        System.out.println("get_sequencenumber(): ");
        System.out.println("length of i: " + length);
        System.out.println("giliran of i: " + giliran);
        System.out.println("sequence of i: " + sequence);
        System.out.println("sequence2 of i: " + sequence2);
        System.out.println("----------end of get_sequencenumber()--------------");
    }

    public int update_sequence() {
        return this.i++;
        
    }

    public void genPMI() {
        //variable
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
            System.out.println("susunan: "+Integer.parseInt(susunan[a]));
            System.out.println("susunansequence: "+Integer.parseInt(susunansequence[a]));
            System.out.println("tatalA tambah: "+(Integer.parseInt(susunan[a]) * Integer.parseInt(susunansequence[a])));
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
            this.checkdigit = totalD;
        }
        
        System.out.println("total A val: "+totalA);
        System.out.println("remainder A val: "+remainderA);
        System.out.println("total B val: "+totalB);
        System.out.println("remainder B val: "+remainderB);
        System.out.println("total C val: "+totalC);
        System.out.println("total D val: "+totalD);
        System.out.println(sequence);
    }

    public String mergeIC(String Nric) {
        return Nric + Integer.toString(this.checkdigit);
    }

    public String getPMI(String ic,int pmi_i) {
        setI(pmi_i);
        get_sequencenumber();
        genPMI();
        update_sequence();
        System.out.println("sequence updated: "+ update_sequence());

        return mergeIC(ic);
    }

//    public static void main(String[] args) {
//        // TODO code application logic here
//        TestPmi test = new TestPmi();
//        //System.out.println(test.i);
//        System.out.println(test.getPMI("950607015241"));
//
//    }

}
