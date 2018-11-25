package com.hillert.model;

public class DepartmentBean {

	private String departmentName;
	private String departmentCode;
	private String facultyCode;
	private int departmentStatus;
	
	private String facultyName;
	
	public int getDepartmentStatus() {
		return departmentStatus;
	}
	public void setDepartmentStatus(int departmentStatus) {
		this.departmentStatus = departmentStatus;
	}
	public String getFacultyName() {
		return facultyName;
	}
	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}
	public String getDepartmentCode() {
		return departmentCode;
	}
	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getFacultyCode() {
		return facultyCode;
	}
	public void setFacultyCode(String facultyCode) {
		this.facultyCode = facultyCode;
	}
	
}
