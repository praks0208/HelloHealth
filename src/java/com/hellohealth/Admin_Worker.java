/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellohealth;

/**
 *
 * @author pranav
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.sql.*;
import java.util.*;
public class Admin_Worker {
    public static String addAdmin(Admin_Dt ad)
    {
       String result = "";
       try
       {
           String query="Insert into admin(Admin_user,Admin_passwd,Admin_name,Admin_contact) values (?,?,?,?)";
           
           PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
          
           pstmt.setString(1,ad.getAdmin_user());
           pstmt.setString(2,ad.getAdmin_pass());
           pstmt.setString(3,ad.getAdmin_name());
           pstmt.setString(4,ad.getAdmin_con());
           
           int i=pstmt.executeUpdate();
           if(i==1)
           {
               result=Results.Success;
           }
           else
           {
               result=Results.FAILURE;
           }
       DatabaseConnector.close();
       }
       catch(Exception e)
        {
            e.printStackTrace();
        }
       return result;
    }
    
//Update Admin By id
    public static String UpdateAdmin(Admin_Dt ad)
    {
        String result="";
        try
        {
            String query="Update admin set Admin_user=?,Admin_passwd=?,Admin_name=?,Admin_contact=? where Admin_id=?;";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setInt(5,ad.getAdmin_id());
            pstmt.setString(1,ad.getAdmin_user());
            pstmt.setString(2,ad.getAdmin_pass());
            pstmt.setString(3,ad.getAdmin_name());
            pstmt.setString(4,ad.getAdmin_con());
            int i=pstmt.executeUpdate();
            if(i==1)
            {
                result=Results.Success;
            }
            else
            {
                result=Results.FAILURE;
            }
            DatabaseConnector.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return result;
    }
    
//Delete Admin By id
    public static String deleteAdmin(int Admin_id)
    {
       String result="";
    try
    {
        String query="Delete * from admin where Admin_id=?;";
        PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
              pstmt.setInt(1,Admin_id);
        int i=pstmt.executeUpdate();
        if(i==1)
        {
            result=Results.Success;
        }
   else
        {
            result=Results.FAILURE;
        
        }
    DatabaseConnector.close();
    }
    catch(Exception e)
    {
        result=Results.PROBLEM;
        e.printStackTrace();
    }
    return result;
    
   }
    
//Admin Details Show By id
    public static Admin_Dt showAdminyId(int Admin_id)
    {
        Admin_Dt a=null;
        try
        {
            String query="Select * from admin where Admin_id ="+Admin_id+";";
            ResultSet rs=DatabaseConnector.getResultSet(query);
                    if(rs.next())
                    {
                        a=new Admin_Dt();
                        a.setAdmin_id(rs.getInt(1));
                        a.setAdmin_user(rs.getString(2));
                        a.setAdmin_pass(rs.getString(3));
                        a.setAdmin_name(rs.getString(4));
                        a.setAdmin_con(rs.getString(5));
                    }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return a;
    }
    
    //Client get all
    public static ArrayList<Admin_Dt> getAllAdmin()
        {
            ArrayList<Admin_Dt>list=new ArrayList<Admin_Dt>();
            try
            {
                String query="Select * from admin;";
                ResultSet rs=DatabaseConnector.getResultSet(query);
                while(rs.next())
                {
                    Admin_Dt a=new Admin_Dt();
                    a=new Admin_Dt();
                    a.setAdmin_id(rs.getInt(1));
                    a.setAdmin_name(rs.getString(2));
                    a.setAdmin_con(rs.getString(3));
                    
                    list.add(a);
                    a=null;
                 }
             }
             catch(Exception e)
             {
                    e.printStackTrace();
             }
                return list;
        }
    public static int getIdByUser(String user)
     {
        
        int id=0;
         try
         {
             String query="Select Admin_id from admin where Admin_user='"+user+"';";
             ResultSet rs=DatabaseConnector.getResultSet(query);
             if(rs.next())
             {
              id=rs.getInt(1);
             }
          
        }
            catch(Exception ex)
            {
               
          ex.printStackTrace();
            }
        return id;
     }
}