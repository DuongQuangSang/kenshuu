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
import model.ListPatient;
import model.Patient;

/**
 *
 * @author user
 */
public class PatientService {

    public void deletePatient(Patient ptn) throws SQLException {
        JdbcConn jc = new JdbcConn();
        try {
            jc.getDbcom();
            jc.cud("delete from patients where patient_id = " + ptn.getId() + ";");
            jc.closeDbcom();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PatientService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertPatient(Patient ptn) throws SQLException {
        JdbcConn jc = new JdbcConn();
        try {
            jc.getDbcom();
            jc.cud("insert into patients (patient_id,patient_name,gender,date_of_birth,address,phone_number) values (" + ptn.getId() + ",'" + ptn.getName() + "','" + ptn.getGender() + "','" + ptn.getDateOfBirth() + "','" + ptn.getAddress() + "','" + ptn.getPhoneNumber() + "');");
            jc.closeDbcom();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PatientService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePatient(Patient ptn) throws SQLException {
        JdbcConn jc = new JdbcConn();
        try {
            jc.getDbcom();
            jc.cud("update patients set patient_name = '" + ptn.getName()
                    + "',gender = '" + ptn.getGender()
                    + "',date_of_birth = '" + ptn.getDateOfBirth()
                    + "',address = '" + ptn.getAddress()
                    + "',phone_number = '" + ptn.getPhoneNumber()
                    + "' where patient_id = " + ptn.getId() + ";");
            jc.closeDbcom();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PatientService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Patient> searchPatient(String keyword) throws SQLException {
        JdbcConn jc = new JdbcConn();
        List<Patient> list = new ArrayList<>();
        try {
            jc.getDbcom();
            String sql = "select * from patients where patient_name like '%" + keyword + "%' order by patient_id;";
            try {
                ResultSet resultSet = jc.tt(sql);
                while (resultSet.next()) {
                    Patient patient = new Patient();
                    patient.setId(resultSet.getInt("patient_id"));
                    patient.setName(resultSet.getString("patient_name"));
                    patient.setGender(resultSet.getString("gender"));
                    patient.setDateOfBirth(resultSet.getString("date_of_birth"));
                    patient.setAddress(resultSet.getString("address"));
                    patient.setPhoneNumber(resultSet.getString("phone_number"));
                    list.add(patient);
                }
                jc.closeDbcom();
            } catch (SQLException ex) {
                Logger.getLogger(PatientService.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PatientService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Patient> selectAll() {
        JdbcConn jc = new JdbcConn();
        List<Patient> list = new ArrayList<>();
        try {
            jc.getDbcom();
            String sql = "select * from patients;";
            try {
                ResultSet resultSet = jc.tt(sql);
                while (resultSet.next()) {
                    Patient patient = new Patient();
                    patient.setId(resultSet.getInt("patient_id"));
                    patient.setName(resultSet.getString("patient_name"));
                    patient.setGender(resultSet.getString("gender"));
                    patient.setDateOfBirth(resultSet.getString("date_of_birth"));
                    patient.setAddress(resultSet.getString("address"));
                    patient.setPhoneNumber(resultSet.getString("phone_number"));
                    list.add(patient);
                }
                jc.closeDbcom();
            } catch (SQLException ex) {
                Logger.getLogger(PatientService.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PatientService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
