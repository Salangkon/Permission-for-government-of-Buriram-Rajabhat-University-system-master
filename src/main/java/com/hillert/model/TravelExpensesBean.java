package com.hillert.model;

import java.sql.Timestamp;

public class TravelExpensesBean {
	
	private int travelId;
	private String vehicleName;
	private int numberPer;
	private int travelExpenses;
	private int userSum;
	private int sum;
	private String vehicleC;
	private int personnelId;
	private Timestamp createDate;
	private int permissionId;

	public int getTravelId() {
		return travelId;
	}
	public void setTravelId(int travelId) {
		this.travelId = travelId;
	}
	public String getVehicleName() {
		return vehicleName;
	}
	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}
	public int getNumberPer() {
		return numberPer;
	}
	public void setNumberPer(int numberPer) {
		this.numberPer = numberPer;
	}
	public int getTravelExpenses() {
		return travelExpenses;
	}
	public void setTravelExpenses(int travelExpenses) {
		this.travelExpenses = travelExpenses;
	}
	public int getUserSum() {
		return userSum;
	}
	public void setUserSum(int userSum) {
		this.userSum = userSum;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getVehicleC() {
		return vehicleC;
	}
	public void setVehicleC(String vehicleC) {
		this.vehicleC = vehicleC;
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
