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
	
	private Timestamp createDate;

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
