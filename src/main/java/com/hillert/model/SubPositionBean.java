package com.hillert.model;

public class SubPositionBean {
	
	private String subPositionName;
	private String supPositionCode;
	private String positionCode;
	private int allowence;
	private int rentDate;
	private int subPositionStatus;
	
	private String positionName;
	
	public int getSubPositionStatus() {
		return subPositionStatus;
	}
	public void setSubPositionStatus(int subPositionStatus) {
		this.subPositionStatus = subPositionStatus;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
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
