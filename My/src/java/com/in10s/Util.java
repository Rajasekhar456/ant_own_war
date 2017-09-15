/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.in10s;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import net.sf.json.JSONObject;

/**
 *
 * @author Administrator
 */
public class Util {

    public int fetchNextSequenceVal() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int val = 0;
        try {

            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
//            pst = con.prepareStatement("select * from OWNER_DETAILS where EMAIL_ID='"+EMAIL_ID+"' and PASSWORD='"+PASSWORD+"'");
            ps = con.prepareStatement("select SEQ1.nextval from dual");
            rs = ps.executeQuery();

            if (rs.next()) {
                val = rs.getInt("sequenceVal");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (Exception e) {
            }



        }
        return val;
    }
}
