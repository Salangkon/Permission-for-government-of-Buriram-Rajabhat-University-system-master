package com.hillert.model;

public class SubPositionBean {
	
	private int subPositionId;
	private String subPositionName;
	private String supPositionCode;
	private String positionCode;
	private int allowence;
	private int rentDate;
	
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
	public String getPositionCode() {
		return positionCode;
	}
	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
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
	
}
