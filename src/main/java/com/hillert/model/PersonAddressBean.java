package com.hillert.model;

public class PersonAddressBean {
	//ตาราง Personsel
	private int personnelId;
	private int userId;
	private String departmentCode;
	private String subPositionCode;
	//ตาราง Faculty
	private int facultyId;
	private String facultyName;
	private String facultyCode;
	//ตาราง Department
	private int departmentId;
	private String departmentName;
	//ตาราง Position
	private int positionId;
	private String positionName;
	private String positionCode;
	//ตาราง SubPosition
	private int subPositionId;
	private String subPositionName;
	private String supPositionCode;
	private int allowence;
	private int allowenceType;
	private int rentDate;
	//ตาราง  User
	private String userUsername;
	private String userPassword;
	private String userFname;
	private String userLname;
	private String sex;
	private String numberPhone;
	private int role;
	

	public String getPositionCode() {
		return positionCode;
	}
	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}
	public int getAllowenceType() {
		return allowenceType;
	}
	public void setAllowenceType(int allowenceType) {
		this.allowenceType = allowenceType;
	}
	public String getNumberPhone() {
		return numberPhone;
	}
	public void setNumberPhone(String numberPhone) {
		this.numberPhone = numberPhone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public int getFacultyId() {
		return facultyId;
	}
	public void setFacultyId(int facultyId) {
		this.facultyId = facultyId;
	}
	public String getFacultyName() {
		return facultyName;
	}
	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}
	public String getFacultyCode() {
		return facultyCode;
	}
	public void setFacultyCode(String facultyCode) {
		this.facultyCode = facultyCode;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public int getPositionId() {
		return positionId;
	}
	public void setPositionId(int positionId) {
		this.positionId = positionId;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public int getSubPositionId() {
		return subPositionId;
	}
	public void setSubPositionId(int subPositionId) {
		this.subPositionId = subPositionId;
	}
	public String getSubPositionName() {
		return subPositionName;
	}
	public void setSubPositionName(String subPositionName) {
		this.subPositionName = subPositionName;
	}
	public String getSupPositionCode() {
		return supPositionCode;
	}
	public void setSupPositionCode(String supPositionCode) {
		this.supPositionCode = supPositionCode;
	}
	public int getAllowence() {
		return allowence;
	}
	public void setAllowence(int allowence) {
		this.allowence = allowence;
	}
	public int getRentDate() {
		return rentDate;
	}
	public void setRentDate(int rentDate) {
		this.rentDate = rentDate;
	}
	public int getPersonnelId() {
		return personnelId;
	}
	public void setPersonnelId(int personnelId) {
		this.personnelId = personnelId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getDepartmentCode() {
		return departmentCode;
	}
	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	public String getSubPositionCode() {
		return subPositionCode;
	}
	public void setSubPositionCode(String subPositionCode) {
		this.subPositionCode = subPositionCode;
	}
	public String getUserUsername() {
		return userUsername;
	}
	public void setUserUsername(String userUsername) {
		this.userUsername = userUsername;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserFname() {
		return userFname;
	}
	public void setUserFname(String userFname) {
		this.userFname = userFname;
	}
	public String getUserLname() {
		return userLname;
	}
	public void setUserLname(String userLname) {
		this.userLname = userLname;
	}

}
