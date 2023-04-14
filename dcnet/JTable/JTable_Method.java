/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication49;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author user
 */
public class JTable_Method {

    public List<DocObj> getDoc() {

        List<DocObj> list = new ArrayList<>();

        ConnectJDBC connectJDBC = new ConnectJDBC();
        Connection conn = connectJDBC.connect();

        String query = "SELECT * FROM departments";

        Statement stm;
        try {
            //Tạo đối tượng Statement
            stm = conn.createStatement();

            //Thực thi truy vấn và trả về đối tượng ResultSet
            ResultSet rs = stm.executeQuery(query);

            //Duyệt kết quả trả về
            while (rs.next()) {  //Di chuyển con trỏ xuống bản ghi kế tiếp
                
                DocObj obj = new DocObj();
                
                int departmentID = rs.getInt("department_id");
                String departmentName = rs.getString("department_name");
                String departmentDescription = rs.getString("description");
                
                obj.setDepartmentID(departmentID);  
                obj.setDepartmentName(departmentName);
                obj.setDepartmentDescription(departmentDescription);

                list.add(obj);
                        
//                System.out.println(departmentID + "\t" + departmentName + "\t\t" + departmentDescription);
            }
            //Đóng kết nối
            conn.close();
        } catch (SQLException e) {
        }

        return list;

    }

    
    
    public List<DocObj> selectKeyword(String keyword) {

        List<DocObj> list = new ArrayList<>();

        ConnectJDBC connectJDBC = new ConnectJDBC();
        Connection conn = connectJDBC.connect();

        String query = "SELECT * FROM departments" + keyword;

        Statement stm;
        try {
            //Tạo đối tượng Statement
            stm = conn.createStatement();

            //Thực thi truy vấn và trả về đối tượng ResultSet
            ResultSet rs = stm.executeQuery(query);

            //Duyệt kết quả trả về
            while (rs.next()) {  //Di chuyển con trỏ xuống bản ghi kế tiếp
                
                DocObj obj = new DocObj();
                
                int departmentID = rs.getInt("department_id");
                String departmentName = rs.getString("department_name");
                String departmentDescription = rs.getString("description");
                
                obj.setDepartmentID(departmentID);  
                obj.setDepartmentName(departmentName);
                obj.setDepartmentDescription(departmentDescription);

                list.add(obj);
                        
//                System.out.println(departmentID + "\t" + departmentName + "\t\t" + departmentDescription);
            }
            //Đóng kết nối
            conn.close();
        } catch (SQLException e) {
        }

        return list;

    }
}
