package com.hillert.model;

import java.sql.Timestamp;

public class ExpenseEstimateBean {

	private String sex;
	private String userFname;
	private String userLname;
	private String subPositionName;
	private float allowenceType;
	private float allowence;
	private float allowencePerday;
	private float allowenceSum;
	private float rentDate;
	private float rentDatePerday;
	private float rentDateSum;
	
	private float travelSum;
	private float otherSum;
	
	private float expenseEstimateSum;
	
	private String allowenceTypeComma;
	private String allowenceComma;
	private String allowencePerdayComma;
	private String allowenceSumComma;
	private String rentDateComma;
	private String rentDatePerdayComma;
	private String rentDateSumComma;
	
	private String travelSumComma;
	private String otherSumComma;

	private String expenseEstimateSumComma;
	
	// FK user
	private int personnelId;
	private Timestamp createDate;
	// FK permission
	private int permissionId;
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
	public float getAllowenceType() {
		return allowenceType;
	}
	public void setAllowenceType(float allowenceType) {
		this.allowenceType = allowenceType;
	}
	public float getAllowence() {
		return allowence;
	}
	public void setAllowence(float allowence) {
		this.allowence = allowence;
	}
	public float getAllowencePerday() {
		return allowencePerday;
	}
	public void setAllowencePerday(float allowencePerday) {
		this.allowencePerday = allowencePerday;
	}
	public float getAllowenceSum() {
		return allowenceSum;
	}
	public void setAllowenceSum(float allowenceSum) {
		this.allowenceSum = allowenceSum;
	}
	public float getRentDate() {
		return rentDate;
	}
	public void setRentDate(float rentDate) {
		this.rentDate = rentDate;
	}
	public float getRentDatePerday() {
		return rentDatePerday;
	}
	public void setRentDatePerday(float rentDatePerday) {
		this.rentDatePerday = rentDatePerday;
	}
	public float getRentDateSum() {
		return rentDateSum;
	}
	public void setRentDateSum(float rentDateSum) {
		this.rentDateSum = rentDateSum;
	}
	public float getTravelSum() {
		return travelSum;
	}
	public void setTravelSum(float travelSum) {
		this.travelSum = travelSum;
	}
	public float getOtherSum() {
		return otherSum;
	}
	public void setOtherSum(float otherSum) {
		this.otherSum = otherSum;
	}
	public float getExpenseEstimateSum() {
		return expenseEstimateSum;
	}
	public void setExpenseEstimateSum(float expenseEstimateSum) {
		this.expenseEstimateSum = expenseEstimateSum;
	}
	public String getAllowenceTypeComma() {
		return allowenceTypeComma;
	}
	public void setAllowenceTypeComma(String allowenceTypeComma) {
		this.allowenceTypeComma = allowenceTypeComma;
	}
	public String getAllowenceComma() {
		return allowenceComma;
	}
	public void setAllowenceComma(String allowenceComma) {
		this.allowenceComma = allowenceComma;
	}
	public String getAllowencePerdayComma() {
		return allowencePerdayComma;
	}
	public void setAllowencePerdayComma(String allowencePerdayComma) {
		this.allowencePerdayComma = allowencePerdayComma;
	}
	public String getAllowenceSumComma() {
		return allowenceSumComma;
	}
	public void setAllowenceSumComma(String allowenceSumComma) {
		this.allowenceSumComma = allowenceSumComma;
	}
	public String getRentDateComma() {
		return rentDateComma;
	}
	public void setRentDateComma(String rentDateComma) {
		this.rentDateComma = rentDateComma;
	}
	public String getRentDatePerdayComma() {
		return rentDatePerdayComma;
	}
	public void setRentDatePerdayComma(String rentDatePerdayComma) {
		this.rentDatePerdayComma = rentDatePerdayComma;
	}
	public String getRentDateSumComma() {
		return rentDateSumComma;
	}
	public void setRentDateSumComma(String rentDateSumComma) {
		this.rentDateSumComma = rentDateSumComma;
	}
	public String getTravelSumComma() {
		return travelSumComma;
	}
	public void setTravelSumComma(String travelSumComma) {
		this.travelSumComma = travelSumComma;
	}
	public String getOtherSumComma() {
		return otherSumComma;
	}
	public void setOtherSumComma(String otherSumComma) {
		this.otherSumComma = otherSumComma;
	}
	public String getExpenseEstimateSumComma() {
		return expenseEstimateSumComma;
	}
	public void setExpenseEstimateSumComma(String expenseEstimateSumComma) {
		this.expenseEstimateSumComma = expenseEstimateSumComma;
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
