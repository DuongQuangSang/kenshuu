/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication49;

/**
 *
 * @author user
 */
public class DocObj {

    private int departmentID;
    private String departmentName;
    private String departmentDescription;

    void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    void setDepartmentDescription(String departmentDescription) {
        this.departmentDescription = departmentDescription;
    }

    public int getDepartmentID() {
        return departmentID;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public String getDepartmentDescription() {
        return departmentDescription;
    }

}
