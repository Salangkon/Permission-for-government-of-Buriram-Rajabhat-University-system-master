package com.hillert.model;

import java.sql.Timestamp;

public class ExpenseSumaryBean {

	// FK permission
	private int permissionId;

	private float userSumTotal;
	private float allowenceSumTotal;
	private float rentDateSumTotal;
	private float travelSumTotal;
	private float otherSumTotal;
	private float expenseEstimateSumTotal;
	private String expenseEstimateSumTotalThaiBaht;

	private float allowencePerdayTotal;
	private float rentDatePerdayTotal;
	
	private String expenseEstimateSumTotalDivide;

	private String userSumTotalComma;
	private String allowenceSumTotalComma;
	private String rentDateSumTotalComma;
	private String travelSumTotalComma;
	private String otherSumTotalComma;
	private String expenseEstimateSumTotalComma;
	private String allowencePerdayTotalComma;
	private String rentDatePerdayTotalComma;
	
	private String budgetPass;

	private Timestamp createDate;


	public String getExpenseEstimateSumTotalDivide() {
		return expenseEstimateSumTotalDivide;
	}

	public void setExpenseEstimateSumTotalDivide(String expenseEstimateSumTotalDivide) {
		this.expenseEstimateSumTotalDivide = expenseEstimateSumTotalDivide;
	}

	public int getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(int permissionId) {
		this.permissionId = permissionId;
	}

	public float getUserSumTotal() {
		return userSumTotal;
	}

	public void setUserSumTotal(float userSumTotal) {
		this.userSumTotal = userSumTotal;
	}

	public float getAllowenceSumTotal() {
		return allowenceSumTotal;
	}

	public void setAllowenceSumTotal(float allowenceSumTotal) {
		this.allowenceSumTotal = allowenceSumTotal;
	}

	public float getRentDateSumTotal() {
		return rentDateSumTotal;
	}

	public void setRentDateSumTotal(float rentDateSumTotal) {
		this.rentDateSumTotal = rentDateSumTotal;
	}

	public float getTravelSumTotal() {
		return travelSumTotal;
	}

	public void setTravelSumTotal(float travelSumTotal) {
		this.travelSumTotal = travelSumTotal;
	}

	public float getOtherSumTotal() {
		return otherSumTotal;
	}

	public void setOtherSumTotal(float otherSumTotal) {
		this.otherSumTotal = otherSumTotal;
	}

	public float getExpenseEstimateSumTotal() {
		return expenseEstimateSumTotal;
	}

	public void setExpenseEstimateSumTotal(float expenseEstimateSumTotal) {
		this.expenseEstimateSumTotal = expenseEstimateSumTotal;
	}

	public String getExpenseEstimateSumTotalThaiBaht() {
		return expenseEstimateSumTotalThaiBaht;
	}

	public void setExpenseEstimateSumTotalThaiBaht(String expenseEstimateSumTotalThaiBaht) {
		this.expenseEstimateSumTotalThaiBaht = expenseEstimateSumTotalThaiBaht;
	}

	public float getAllowencePerdayTotal() {
		return allowencePerdayTotal;
	}

	public void setAllowencePerdayTotal(float allowencePerdayTotal) {
		this.allowencePerdayTotal = allowencePerdayTotal;
	}

	public float getRentDatePerdayTotal() {
		return rentDatePerdayTotal;
	}

	public void setRentDatePerdayTotal(float rentDatePerdayTotal) {
		this.rentDatePerdayTotal = rentDatePerdayTotal;
	}

	public String getUserSumTotalComma() {
		return userSumTotalComma;
	}

	public void setUserSumTotalComma(String userSumTotalComma) {
		this.userSumTotalComma = userSumTotalComma;
	}

	public String getAllowenceSumTotalComma() {
		return allowenceSumTotalComma;
	}

	public void setAllowenceSumTotalComma(String allowenceSumTotalComma) {
		this.allowenceSumTotalComma = allowenceSumTotalComma;
	}

	public String getRentDateSumTotalComma() {
		return rentDateSumTotalComma;
	}

	public void setRentDateSumTotalComma(String rentDateSumTotalComma) {
		this.rentDateSumTotalComma = rentDateSumTotalComma;
	}

	public String getTravelSumTotalComma() {
		return travelSumTotalComma;
	}

	public void setTravelSumTotalComma(String travelSumTotalComma) {
		this.travelSumTotalComma = travelSumTotalComma;
	}

	public String getOtherSumTotalComma() {
		return otherSumTotalComma;
	}

	public void setOtherSumTotalComma(String otherSumTotalComma) {
		this.otherSumTotalComma = otherSumTotalComma;
	}

	public String getExpenseEstimateSumTotalComma() {
		return expenseEstimateSumTotalComma;
	}

	public void setExpenseEstimateSumTotalComma(String expenseEstimateSumTotalComma) {
		this.expenseEstimateSumTotalComma = expenseEstimateSumTotalComma;
	}

	public String getAllowencePerdayTotalComma() {
		return allowencePerdayTotalComma;
	}

	public void setAllowencePerdayTotalComma(String allowencePerdayTotalComma) {
		this.allowencePerdayTotalComma = allowencePerdayTotalComma;
	}

	public String getRentDatePerdayTotalComma() {
		return rentDatePerdayTotalComma;
	}

	public void setRentDatePerdayTotalComma(String rentDatePerdayTotalComma) {
		this.rentDatePerdayTotalComma = rentDatePerdayTotalComma;
	}

	public String getBudgetPass() {
		return budgetPass;
	}

	public void setBudgetPass(String budgetPass) {
		this.budgetPass = budgetPass;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

}
