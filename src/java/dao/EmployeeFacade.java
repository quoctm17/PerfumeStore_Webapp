/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Employee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Beyond Nguyen
 */
public class EmployeeFacade {

    public Employee read(String id) throws SQLException {
        Employee emp = new Employee();

        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("select * from employee where id= ?");
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            emp.setId(rs.getInt("id"));
            emp.setSalary(rs.getDouble("salary"));
            emp.setDepartmentId(rs.getInt("departmentId"));
        }
        con.close();
        return emp;
    }

   
}