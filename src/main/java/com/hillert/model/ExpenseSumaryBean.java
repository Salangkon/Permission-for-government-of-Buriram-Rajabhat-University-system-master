package com.hillert.model;

import java.sql.Timestamp;

public class ExpenseSumaryBean {
	
	// FK permission
	private int permissionId;
	
	private String userSumTotal;
	private String allowenceSumTotal;
	private String rentDateSumTotal;
	private String travelSumTotal;
	private String otherSumTotal;
	private String expenseEstimateSumTotal;
	
	private String allowencePerdayTotal;
	private String rentDatePerdayTotal;
	
	private String allowenceDetails;
	private String rentDateDetails;
	
	private Timestamp createDate;

	
	public String getAllowencePerdayTotal() {
		return allowencePerdayTotal;
	}

	public void setAllowencePerdayTotal(String allowencePerdayTotal) {
		this.allowencePerdayTotal = allowencePerdayTotal;
	}

	public String getRentDatePerdayTotal() {
		return rentDatePerdayTotal;
	}

	public void setRentDatePerdayTotal(String rentDatePerdayTotal) {
		this.rentDatePerdayTotal = rentDatePerdayTotal;
	}

	public int getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(int permissionId) {
		this.permissionId = permissionId;
	}

	public String getUserSumTotal() {
		return userSumTotal;
	}

	public void setUserSumTotal(String userSumTotal) {
		this.userSumTotal = userSumTotal;
	}

	public String getAllowenceSumTotal() {
		return allowenceSumTotal;
	}

	public void setAllowenceSumTotal(String allowenceSumTotal) {
		this.allowenceSumTotal = allowenceSumTotal;
	}

	public String getRentDateSumTotal() {
		return rentDateSumTotal;
	}

	public void setRentDateSumTotal(String rentDateSumTotal) {
		this.rentDateSumTotal = rentDateSumTotal;
	}

	public String getTravelSumTotal() {
		return travelSumTotal;
	}

	public void setTravelSumTotal(String travelSumTotal) {
		this.travelSumTotal = travelSumTotal;
	}

	public String getOtherSumTotal() {
		return otherSumTotal;
	}

	public void setOtherSumTotal(String otherSumTotal) {
		this.otherSumTotal = otherSumTotal;
	}

	public String getExpenseEstimateSumTotal() {
		return expenseEstimateSumTotal;
	}

	public void setExpenseEstimateSumTotal(String expenseEstimateSumTotal) {
		this.expenseEstimateSumTotal = expenseEstimateSumTotal;
	}

	public String getAllowenceDetails() {
		return allowenceDetails;
	}

	public void setAllowenceDetails(String allowenceDetails) {
		this.allowenceDetails = allowenceDetails;
	}

	public String getRentDateDetails() {
		return rentDateDetails;
	}

	public void setRentDateDetails(String rentDateDetails) {
		this.rentDateDetails = rentDateDetails;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	
}
