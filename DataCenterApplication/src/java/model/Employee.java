/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author 1
 */
public class Employee {
    private int empId;
    private String empName;
    private String phone;
    private String email;
    private float salary;
    private String designation;

    public int getEmpId() {
        return empId;
    }

    public String getName() {
        return empName;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public float getSalary() {
        return salary;
    }

    public String getDesignation() {
        return designation;
    }

    public void setEmpId(int aInt) {
        this.empId = aInt;
    }

    public void setName(String string) {
        this.empName = string;
    }

    public void setPhone(String string) {
        this.phone = string;
    }

    public void setEmail(String string) {
        this.email = string;
    }

    public void setSalary(float aFloat) {
        this.salary = aFloat;
    }

    public void setDesignation(String string) {
        this.designation = string;
    }
    
    
}
