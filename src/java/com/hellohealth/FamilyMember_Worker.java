/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellohealth;

/**
 *
 * @author King
 */
import java.sql.*;
import java.util.*;
public class FamilyMember_Worker {
    public static String addF_Member(FamilyMember_Dt md)
    {
       String result = "";
       try
       {
           String query="Insert into family_group(F_mem_name,F_mem_dob,F_mem_bloodgroup,F_mem_height,F_mem_weight,F_mem_gender,Family_id) values (?,?,?,?,?,?,?)";
           PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
           pstmt.setString(1,md.getM_name());
           pstmt.setString(2,md.getM_dob());
           pstmt.setString(3,md.getM_bgroup());
           pstmt.setInt(4,md.getM_height());
           pstmt.setInt(5,md.getM_weight());
           pstmt.setString(6,md.getM_gender());
           pstmt.setInt(7,md.getM_F_id());
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
    
//Update Client By id
    public static String UpdateF_Member(FamilyMember_Dt md)
    {
        String result="";
        try
        {
            String query="Update family_group set F_mem_name=?,F_mem_dob=?,F_mem_bloodgroup=?,F_mem_height=?,F_mem_weight=?,F_mem_gender=? where F_mem_id=?";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,md.getM_name());
            pstmt.setString(2,md.getM_dob());
            pstmt.setString(3,md.getM_bgroup());
            pstmt.setInt(4,md.getM_height());
            pstmt.setInt(5,md.getM_weight());
            pstmt.setString(6,md.getM_gender());
            pstmt.setInt(7,md.getMem_id());
            System.out.println("Worker");
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
    

    public static String deleteFamily_Member(FamilyMember_Dt md)
    {
       String result="";
    try
    {   
        //reducing number of familymember by one.
        int id=md.getM_F_id();
        int Fid = FamilyMember_Worker.getF_IdById(id);
        Family_Dt fd= new Family_Dt();
        fd.setFamily_id(Fid);
        Family_Worker.RemoveFamilyMember(fd);
        
        //deleting family member.
        String query="Delete from family_group where F_mem_id=?;";
        PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
        pstmt.setInt(1,md.getMem_id());
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
    
    
    public static String deleteFamily_GroupByFid(FamilyMember_Dt md)
    {
       String result="";
    try
    {
        String query="Delete from family_group where Family_id=?;";
        PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
        pstmt.setInt(1,md.getM_F_id());
        int i=pstmt.executeUpdate();
        Family_Worker.deleteFamily(md.getM_F_id());
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
//Client Details Show By id
    public static FamilyMember_Dt showfamilymemberById(int Family_mem_id)
    {
        FamilyMember_Dt md=null;
        try
        {
            String query="Select * from family_group where F_mem_id ="+Family_mem_id+";";
            ResultSet rs=DatabaseConnector.getResultSet(query);
                    if(rs.next())
                    {
                        md=new FamilyMember_Dt();
                        md.setMem_id(rs.getInt(1));
                        md.setM_name(rs.getString(2));
                        md.setM_dob(rs.getString(3));
                        md.setM_bgroup(rs.getString(4));
                        md.setM_height(rs.getInt(5));
                        md.setM_weight(rs.getInt(6));
                        md.setM_gender(rs.getString(7));
                        md.setM_F_id(rs.getInt(8));
                    }
                        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return md;
    }
    
    //Client get all
    public static ArrayList<FamilyMember_Dt> getAllF_Members(int f_id)
        {
            ArrayList<FamilyMember_Dt>list=new ArrayList<FamilyMember_Dt>();
            try
            {
                String query="Select * from family_group where family_id='"+f_id+"';";
                ResultSet rs=DatabaseConnector.getResultSet(query);
                while(rs.next())
                {
                    FamilyMember_Dt f=new FamilyMember_Dt();
                    f=new FamilyMember_Dt();
                    f.setMem_id(rs.getInt(1));    
                    f.setM_name(rs.getString(2));
                    f.setM_bgroup(rs.getString(4));
                    f.setM_dob(rs.getString(3));
                    f.setM_gender(rs.getString(7));
                    f.setM_height(rs.getInt(5));
                    f.setM_weight(rs.getInt(6));
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
//get Id By Email    
     public static int getF_IdById(int id)
     {
        
        int F_id=0;
         try
         {
             String query="Select Family_id from family_group where F_mem_id='"+id+"';";
             ResultSet rs=DatabaseConnector.getResultSet(query);
             if(rs.next())
             {
              F_id=rs.getInt(1);
             }
          
        }
            catch(Exception ex)
            {
               
          ex.printStackTrace();
            }
        return F_id;
     }
     public static FamilyMember_Dt getMemByName(String name)
     {
        FamilyMember_Dt md=null;
        try
        {
            String query="Select * from family_group where F_mem_name="+name+";";
            ResultSet rs=DatabaseConnector.getResultSet(query);
                    if(rs.next())
                    {
                        md=new FamilyMember_Dt();
                        md.setMem_id(rs.getInt(1));
                        md.setM_name(rs.getString(2));
                        md.setM_dob(rs.getString(3));
                        md.setM_bgroup(rs.getString(4));
                        md.setM_height(rs.getInt(5));
                        md.setM_weight(rs.getInt(6));
                        md.setM_gender(rs.getString(7));
                        md.setM_F_id(rs.getInt(8));
                    }
                        
        }catch(Exception e){
            e.printStackTrace();
        }
        return md;
     }
}