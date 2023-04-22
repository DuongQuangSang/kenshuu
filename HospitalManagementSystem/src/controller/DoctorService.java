/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daojdbcconn.JdbcConn;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Doctor;
import model.Patient;

/**
 *
 * @author user
 */
public class DoctorService {
    public void deleteDoctor(Doctor dr) throws SQLException {
        JdbcConn jc = new JdbcConn();
        try {
            jc.getDbcom();
            jc.cud("delete from doctors where doctor_id = " + dr.getId() + ";");
            jc.closeDbcom();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DoctorService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insertDoctor(Doctor dr) throws SQLException {
        JdbcConn jc = new JdbcConn();
        try {
            jc.getDbcom();
            jc.cud("insert into doctors (doctor_id,doctor_name,gender,department_id,salary) values (" + dr.getId() + ",'" + dr.getName() + "','" + dr.getGender() + "'," + dr.getDepartmentId() + "," + dr.getSalary()+ ");");
            jc.closeDbcom();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DoctorService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateDoctor(Doctor dr) throws SQLException {
        JdbcConn jc = new JdbcConn();
        try {
            jc.getDbcom();
            jc.cud("update doctors set doctor_name = '" + dr.getName()
                    + "',gender = '" + dr.getGender()
                    + "',department_id = " + dr.getDepartmentId()
                    + ",salary = " + dr.getSalary()
                    + " where doctor_id = " + dr.getId() + ";");
            jc.closeDbcom();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DoctorService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Doctor> searchDoctor(String keyword) throws SQLException {
        JdbcConn jc = new JdbcConn();
        List<Doctor> list = new ArrayList<>();
        try {
            jc.getDbcom();
            String sql = "select * from doctors where doctor_name like '%" + keyword + "%' order by doctor_id;";
            try {
                ResultSet resultSet = jc.tt(sql);
                while (resultSet.next()) {
                    Doctor dr = new Doctor();
                    dr.setId(resultSet.getInt("doctor_id"));
                    dr.setName(resultSet.getString("doctor_name"));
                    dr.setGender(resultSet.getString("gender"));
                    dr.setDepartmentId(resultSet.getInt("department_id"));
                    dr.setSalary(resultSet.getInt("salary"));
                    list.add(dr);
                }
                jc.closeDbcom();
            } catch (SQLException ex) {
                Logger.getLogger(DoctorService.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DoctorService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Doctor> selectAll() {
        JdbcConn jc = new JdbcConn();
        List<Doctor> list = new ArrayList<>();
        try {
            jc.getDbcom();
            String sql = "select * from doctors;";
            try {
                ResultSet resultSet = jc.tt(sql);
                while (resultSet.next()) {
                    Doctor dr = new Doctor();
                    dr.setId(resultSet.getInt("doctor_id"));
                    dr.setName(resultSet.getString("doctor_name"));
                    dr.setGender(resultSet.getString("gender"));
                    dr.setDepartmentId(resultSet.getInt("department_id"));
                    dr.setSalary(resultSet.getInt("salary"));
                    list.add(dr);
                }
                jc.closeDbcom();
            } catch (SQLException ex) {
                Logger.getLogger(DoctorService.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DoctorService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
