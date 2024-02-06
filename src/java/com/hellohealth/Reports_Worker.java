/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellohealth;

/**
 *
 * @author Pranav
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
public class Reports_Worker {
    //add new Report
    public static String addReport(Reports_Dt r)
    {
       String result = "";
       try
       {
           String query="Insert into reports(Rep_G_id,Rep_name,Rep_date,Rep_tdate) values (?,?,?,?)";
           PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
           
           pstmt.setInt(1,r.getRep_c_id());
           pstmt.setString(2,r.getRep_name());
           pstmt.setString(3,r.getRep_date());
           pstmt.setString(4,r.getRep_tdate());
           
           
           int i=pstmt.executeUpdate();//result evaluator
           if(i==1)
           {//success
               result=Results.Success;
           }
           else
           {//failure
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
    
//Update Report By id
    public static String UpdateReport(Reports_Dt r)
    {
        String result="";
        try
        {
            String query="Update Reports set Rep_pic1=?,Rep_pic2=?,Rep_pic3=?,Rep_pic4=?,Rep_name=?,Rep_date=?,Rep_test_date=? where Rep_id=?";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,r.getRep_pic1());
            pstmt.setString(2,r.getRep_pic2());
            pstmt.setString(3,r.getRep_pic3());
            pstmt.setString(4,r.getRep_pic4());
            pstmt.setString(5,r.getRep_name());
           pstmt.setString(6,r.getRep_date());
           pstmt.setString(7,r.getRep_tdate());
            pstmt.setInt(8,r.getRep_id());
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

//Add Image
    public static String AddRepoImg(Reports_Dt r)
    {
        String result="";
        try
        {
            String query="Update Reports set Rep_pic1=?,Rep_pic2=?,Rep_pic3=?,Rep_pic4=? where Rep_id=?";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,r.getRep_pic1());
            pstmt.setString(2,r.getRep_pic2());
            pstmt.setString(3,r.getRep_pic3());
            pstmt.setString(4,r.getRep_pic4());
            pstmt.setInt(5,r.getRep_id());
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
   

    //Delete Report By id
    public static String deleteReport(int Rep_id)
    {
       String result="";
    try
    {
        String query="Delete * from reports where report_id=?;";
        PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
              pstmt.setInt(1,Rep_id);
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
    
//Report Show By id
    public static Reports_Dt showReportById(int Rep_id)
    {
        Reports_Dt r=null;
        try
        {
            String query="Select * from reports where Rep_id ="+Rep_id+";";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            if(rs.next())
            {
                r=new Reports_Dt();
                r.setRep_id(rs.getInt(1));
                r.setRep_name(rs.getString(3));
                r.setRep_date(rs.getString(4));
                r.setRep_tdate(rs.getString(5));
                r.setRep_pic1(rs.getString(6));
                r.setRep_pic2(rs.getString(7));
                r.setRep_pic3(rs.getString(8));
                r.setRep_pic4(rs.getString(9));
              
            }
                        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return r;
    }
    
    //Reports get all
    public static ArrayList<Reports_Dt> getAllReports()
    {
        ArrayList<Reports_Dt>list=new ArrayList<Reports_Dt>();
        try
        {
            String query="Select * from reports;";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            while(rs.next())
            {
                 Reports_Dt r=new Reports_Dt();
                r.setRep_id(rs.getInt(1));
                r.setRep_c_id(rs.getInt(2));
                r.setRep_name(rs.getString(3));
                r.setRep_date(rs.getString(4));
                r.setRep_tdate(rs.getString(5));
                r.setRep_pic1(rs.getString(6));
                r.setRep_pic2(rs.getString(7));
                r.setRep_pic3(rs.getString(8));
                r.setRep_pic4(rs.getString(9));
                list.add(r);
                r=null;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    public static int getMaxId()
     {
         int id=0;
         try
         {
         String query="select max(Rep_id) from reports;";
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
        public static ArrayList<Reports_Dt> getAllReportsByGid(int G_id)
    {
        ArrayList<Reports_Dt>list=new ArrayList<Reports_Dt>();
        try
        {
            String query="Select * from reports where Rep_G_id='"+G_id+"';";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            while(rs.next())
            {
                Reports_Dt r=new Reports_Dt();
                r.setRep_id(rs.getInt(1));
                r.setRep_c_id(rs.getInt(2));
                r.setRep_name(rs.getString(3));
                r.setRep_date(rs.getString(4));
                r.setRep_tdate(rs.getString(5));
                r.setRep_pic1(rs.getString(6));
                r.setRep_pic2(rs.getString(7));
                r.setRep_pic3(rs.getString(8));
                r.setRep_pic4(rs.getString(9));
                list.add(r);
                r=null;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
}
