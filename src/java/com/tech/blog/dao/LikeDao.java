/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    public boolean  insertLike(int pid,int uid){
        boolean f = false;
        try {
            String q = "insert into liked(pid,uid) values (?,?)";
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            f= true;
            
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return f;
    }
    
    public int countLikeOnPost(int pid){
        int cnt = 0;
        
        try {
            String q = "select count(*) from liked where pid = ?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, pid);
            ResultSet set = ps.executeQuery();
            if(set.next()){
                cnt = set.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cnt;
    }
    
    public boolean isLikedByUser(int pid,int uid){
        boolean f = false;
        try {
            PreparedStatement p = this.con.prepareStatement("select * from liked where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            
            ResultSet set = p.executeQuery();
            if(set.next()){
                f=true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return f;
    }
    
    public boolean deleteLike(int pid, int uid){
         boolean f = false;
        try {
            String q = "delete from liked where pid=? and uid=?";
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            f= true;
            
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return f;
    }
}
