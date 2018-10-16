package com.hillert.model;

import java.sql.Timestamp;

public class ExpenseSumaryBean {
	
	// FK permission
	private int permissionId;
	
	private int userSumTotal;
	private int allowenceSumTotal;
	private int rentDateSumTotal;
	private int travelSumTotal;
	private int otherSumTotal;
	private int expenseEstimateSumTotal;
	private String expenseEstimateSumTotalThaiBaht;
	
	private float allowencePerdayTotal;
	private float rentDatePerdayTotal;
	
	private String userSumTotalComma;
	private String allowenceSumTotalComma;
	private String rentDateSumTotalComma;
	private String travelSumTotalComma;
	private String otherSumTotalComma;
	private String expenseEstimateSumTotalComma;
	private String allowencePerdayTotalComma;
	private String rentDatePerdayTotalComma;
	
	
	private Timestamp createDate;

	
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

	public int getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(int permissionId) {
		this.permissionId = permissionId;
	}

	public int getUserSumTotal() {
		return userSumTotal;
	}

	public void setUserSumTotal(int userSumTotal) {
		this.userSumTotal = userSumTotal;
	}

	public int getAllowenceSumTotal() {
		return allowenceSumTotal;
	}

	public void setAllowenceSumTotal(int allowenceSumTotal) {
		this.allowenceSumTotal = allowenceSumTotal;
	}

	public int getRentDateSumTotal() {
		return rentDateSumTotal;
	}

	public void setRentDateSumTotal(int rentDateSumTotal) {
		this.rentDateSumTotal = rentDateSumTotal;
	}

	public int getTravelSumTotal() {
		return travelSumTotal;
	}

	public void setTravelSumTotal(int travelSumTotal) {
		this.travelSumTotal = travelSumTotal;
	}

	public int getOtherSumTotal() {
		return otherSumTotal;
	}

	public void setOtherSumTotal(int otherSumTotal) {
		this.otherSumTotal = otherSumTotal;
	}

	public int getExpenseEstimateSumTotal() {
		return expenseEstimateSumTotal;
	}

	public void setExpenseEstimateSumTotal(int expenseEstimateSumTotal) {
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

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}


}
