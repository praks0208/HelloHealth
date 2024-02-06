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
public class Client_Worker {
    //Add Client
    public static String addClient(Client_Dt cd)
    {
       String result = "";
       try
       {
           String query="Insert into client(Client_id,Client_name,Client_dob,Client_mail,Client_phone,Client_address,Client_password,Client_Bg,Client_height,Client_weight,Client_gender,Client_f_id) values (?,?,?,?,?,?,?,?,?,?,?,?)";
           PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
           pstmt.setInt(1,cd.getClient_id());
           pstmt.setString(2,cd.getC_name());
           pstmt.setString(3,cd.getC_dob());
           pstmt.setString(4,cd.getC_mail());
           pstmt.setString(5,cd.getC_phone());
           pstmt.setString(6,cd.getC_address());
           pstmt.setString(7,cd.getC_pass());
           pstmt.setString(8,cd.getC_bg());
           pstmt.setInt(9,cd.getC_height());
           pstmt.setInt(10,cd.getC_weight());
           pstmt.setString(11,cd.getC_gender());
           pstmt.setInt(12,cd.getFam_id());
           
           
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
    public static String UpdateClient(Client_Dt cd)
    {
        String result="";
        try
        {
            String query="Update client set Client_name=?,Client_dob=?,Client_mail=?,Client_phone=?,Client_address=?,Client_Bg=?,Client_height=?,Client_weight=?,Client_gender=? where Client_id=?";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,cd.getC_name());
            pstmt.setString(2,cd.getC_dob());
            pstmt.setString(3,cd.getC_mail());
            pstmt.setString(4,cd.getC_phone());
            pstmt.setString(5,cd.getC_address());
            pstmt.setString(6,cd.getC_bg());
            pstmt.setInt(7,cd.getC_height());
            pstmt.setInt(8,cd.getC_weight());
            pstmt.setString(9,cd.getC_gender());
            pstmt.setInt(10,cd.getClient_id());
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
    
//Delete Client By id
    public static String deleteClient(Client_Dt cd)
    {
       String result="";
    try
    {   
        int id=cd.getClient_id();
        int Fid = Client_Worker.getF_IdById(id);
        Family_Dt fd= new Family_Dt();
        fd.setFamily_id(Fid);
        Family_Worker.RemoveFamilyMember(fd);
        String query="Delete from client where Client_id=?;";
        PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
              pstmt.setInt(1,cd.getClient_id());
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
    public static String deleteClientByFid(int f_id)
    {
       String result="";
    try
    {
        String query="Delete from client where Client_f_id='"+f_id+"';";
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
//Client Details Show By id
    public static Client_Dt showClientById(int Client_id)
    {
        Client_Dt c=null;
        try
        {
            String query="Select * from client where Client_id ="+Client_id+";";
            ResultSet rs=DatabaseConnector.getResultSet(query);
                    if(rs.next())
                    {
                        c=new Client_Dt();
                        c.setClient_id(rs.getInt(1));
                        c.setC_name(rs.getString(2));
                        c.setC_dob(rs.getString(3));
                        c.setC_mail(rs.getString(4));
                        c.setC_phone(rs.getString(5));
                        c.setC_address(rs.getString(6));
                        c.setC_pass(rs.getString(7));
                        c.setC_bg(rs.getString(8));
                        c.setC_height(rs.getInt(9));
                        c.setC_weight(rs.getInt(10));
                        c.setC_gender(rs.getString(11));
                        c.setFam_id(rs.getInt(12));
                    }
                        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return c;
    }
    
    //Client get all
    public static ArrayList<Client_Dt> getAllClient()
        {
            ArrayList<Client_Dt>list=new ArrayList<Client_Dt>();
            try
            {
                String query="Select * from client;";
                ResultSet rs=DatabaseConnector.getResultSet(query);
                while(rs.next())
                {
                    Client_Dt c=new Client_Dt();
                    c=new Client_Dt();
                    c.setClient_id(rs.getInt(1));
                    c.setC_name(rs.getString(2));
                    c.setC_dob(rs.getString(3));
                    c.setC_mail(rs.getString(4));
                    c.setC_phone(rs.getString(5));
                    c.setC_address(rs.getString(6));
                    c.setC_pass(rs.getString(7));
                    c.setC_bg(rs.getString(8));
                    c.setC_height(rs.getInt(9));
                    c.setC_weight(rs.getInt(10));
                    c.setC_gender(rs.getString(11));
                    list.add(c);
                    c=null;
                    
                 }
            DatabaseConnector.close(); 
            }
             catch(Exception e)
             {
                 e.printStackTrace();
             }
                return list;
        }
//get Client By Family Id
public static Client_Dt getClientByFamilyId(int Family_id)
        {
            Client_Dt c=new Client_Dt();
            try
            {
                String query="Select * from client where Client_f_id='"+Family_id+"';";
                ResultSet rs=DatabaseConnector.getResultSet(query);
                while(rs.next())
                {
                    c.setClient_id(rs.getInt(1));
                    c.setC_name(rs.getString(2));
                    c.setC_dob(rs.getString(3));
                    c.setC_mail(rs.getString(4));
                    c.setC_phone(rs.getString(5));
                    c.setC_address(rs.getString(6));
                    c.setC_pass(rs.getString(7));
                    c.setC_bg(rs.getString(8));
                    c.setC_height(rs.getInt(9));
                    c.setC_weight(rs.getInt(10));
                    c.setC_gender(rs.getString(11));
                  }
                DatabaseConnector.close();
             }
             catch(Exception e)
             {
                 e.printStackTrace();
             }
                return c;
        }
//get Id By Email    
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
     public static int getF_IdById(int id)
     {
        
        int F_id=0;
         try
         {
             String query="Select Client_f_id from client where Client_id='"+id+"';";
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
     public static ArrayList<Email_list> getAllMail()
     {
         ArrayList<Email_list> list=new ArrayList<Email_list>();
         try{
             String query="select Client_mail from Client";
             ResultSet rs=DatabaseConnector.getResultSet(query);
             while(rs.next())
             {
                 Email_list e=new Email_list();
                 e.setEmail(rs.getString(1));
                 list.add(e);
                 e=null;
             }
         }
         catch(Exception e)
         {
             e.printStackTrace();
         }
         return list;
     }
}
