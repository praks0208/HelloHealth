/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellohealth;

/**
 *
 * @author pranav
 */
import java.sql.*;
import java.util.*;
public class Family_Worker {
    public static String addFamily(Family_Dt fd)
    {
       String result = "";
       try
       {
           String query="Insert into family(Family_creator,Family_memNo) values (?,1)";
           PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
           pstmt.setString(1,fd.getF_creator());
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
    
//Add Family Member
    public static String AddFamilyMember(Family_Dt fd)
    {
        String result="";
        try
        {
            String query="Update family set Family_memNo= Family_memNo+1 where Family_id=?";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setInt(1,fd.getFamily_id());
            
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
   
//Remove Family Member    
    public static String RemoveFamilyMember(Family_Dt fd)
    {
        String result="";
        try
        {
            String query="Update family set Family_memNo= Family_memNo-1 where Family_id=?";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setInt(1,fd.getFamily_id());
            
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

//Delete Family By id
    public static String deleteFamily(int f_id)
    {
       String result="";
    try
    {
        Client_Worker.deleteClientByFid(f_id);
        String query="Delete from family where Family_id='"+f_id+"';";
        PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
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
    
//Family Details Show By id
    public static Family_Dt showFamilyById(int Family_id)
    {
        Family_Dt f=null;
        try
        {
            String query="Select * from family where Family_id ="+Family_id+";";
            ResultSet rs=DatabaseConnector.getResultSet(query);
                    if(rs.next())
                    {
                        f=new Family_Dt();
                        f.setFamily_id(rs.getInt(1));
                        f.setF_creator(rs.getString(2));
                        f.setFamily_id(rs.getInt(3));
                     }                        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    //Client get all
    public static ArrayList<Family_Dt> getAllFamilies()
        {
            ArrayList<Family_Dt>list=new ArrayList<Family_Dt>();
            try
            {
                String query="Select * from family;";
                ResultSet rs=DatabaseConnector.getResultSet(query);
                while(rs.next())
                {
                    Family_Dt f=new Family_Dt();
                    f=new Family_Dt();
                    f.setFamily_id(rs.getInt(1));
                    f.setF_creator(rs.getString(2));
                    f.setF_mem_no(rs.getInt(3));
                    list.add(f);
                    f=null;
                 }
             }
             catch(Exception e)
             {
                 e.printStackTrace();
             }
                return list;
        }
     public static int getIdByEmail(String email)
     {
        
        int id=0;
         try
         {
             String query="Select Client_id from client where Client_mail='"+email+"';";
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
     public static int getMaxId()
     {
         int id=0;
         try
         {
         String query="select max(Family_id) from family;";
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
                                                                                                                                                                              