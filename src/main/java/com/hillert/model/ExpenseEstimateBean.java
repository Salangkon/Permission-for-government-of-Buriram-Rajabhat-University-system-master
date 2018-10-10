package com.hillert.model;

import java.sql.Timestamp;

public class ExpenseEstimateBean {

	private String sex;
	private String userFname;
	private String userLname;
	private String subPositionName;
	private int allowenceType;
	private int allowence;
	private int allowencePerday;
	private int allowenceSum;
	private int rentDate;
	private int rentDatePerday;
	private int rentDateSum;
	
	private int travelSum;
	private int otherSum;
	private String otherSum1;
	
	private int expenseEstimateSum;
	// FK user
	private int personnelId;
	private Timestamp createDate;
	// FK permission
	private int permissionId;
	
	
	public String getOtherSum1() {
		return otherSum1;
	}
	public void setOtherSum1(String otherSum1) {
		this.otherSum1 = otherSum1;
	}
	public int getAllowenceType() {
		return allowenceType;
	}
	public void setAllowenceType(int allowenceType) {
		this.allowenceType = allowenceType;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
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
	public String getSubPositionName() {
		return subPositionName;
	}
	public void setSubPositionName(String subPositionName) {
		this.subPositionName = subPositionName;
	}
	public int getAllowence() {
		return allowence;
	}
	public void setAllowence(int allowence) {
		this.allowence = allowence;
	}
	public int getAllowencePerday() {
		return allowencePerday;
	}
	public void setAllowencePerday(int allowencePerday) {
		this.allowencePerday = allowencePerday;
	}
	public int getAllowenceSum() {
		return allowenceSum;
	}
	public void setAllowenceSum(int allowenceSum) {
		this.allowenceSum = allowenceSum;
	}
	public int getRentDate() {
		return rentDate;
	}
	public void setRentDate(int rentDate) {
		this.rentDate = rentDate;
	}
	public int getRentDatePerday() {
		return rentDatePerday;
	}
	public void setRentDatePerday(int rentDatePerday) {
		this.rentDatePerday = rentDatePerday;
	}
	public int getRentDateSum() {
		return rentDateSum;
	}
	public void setRentDateSum(int rentDateSum) {
		this.rentDateSum = rentDateSum;
	}
	public int getTravelSum() {
		return travelSum;
	}
	public void setTravelSum(int travelSum) {
		this.travelSum = travelSum;
	}
	public int getOtherSum() {
		return otherSum;
	}
	public void setOtherSum(int otherSum) {
		this.otherSum = otherSum;
	}
	public int getExpenseEstimateSum() {
		return expenseEstimateSum;
	}
	public void setExpenseEstimateSum(int expenseEstimateSum) {
		this.expenseEstimateSum = expenseEstimateSum;
	}
	public int getPersonnelId() {
		return personnelId;
	}
	public void setPersonnelId(int personnelId) {
		this.personnelId = personnelId;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public int getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(int permissionId) {
		this.permissionId = permissionId;
	}
	
}
