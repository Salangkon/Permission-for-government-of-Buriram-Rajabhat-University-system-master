package com.hillert.model;

import java.sql.Timestamp;

public class TravelExpensesFuelCostBean {
	
	private int travelId;
	private int permissionId;
	
	private int distance; //ระยะทาง
	private int numberPer; // จำนวน/เที่ยว
	private int fuelCost; // ค่าน้ำมันเชื้อเพลิง
	private int divide; // หาร
	private int fuelCostSum; // รวมค่าน้ำมันเชื้อเพลิง
	
	private int expresswayExpenses; // ค่าทางด่วย
	private int expresswayNumberPer; // จำนวน/ขึ้นทางด่วน
	private int expresswayExpensesSum; // รวมค่าใช้จ่ายทางด่วน
	
	private String sum; //รวม
	private String vehicleC; //หมายเหตุ
	private String vehicleName; //รวม

	private Timestamp createDate;

	public int getTravelId() {
		return travelId;
	}

	public void setTravelId(int travelId) {
		this.travelId = travelId;
	}

	public int getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(int permissionId) {
		this.permissionId = permissionId;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public int getNumberPer() {
		return numberPer;
	}

	public void setNumberPer(int numberPer) {
		this.numberPer = numberPer;
	}

	public int getFuelCost() {
		return fuelCost;
	}

	public void setFuelCost(int fuelCost) {
		this.fuelCost = fuelCost;
	}

	public int getDivide() {
		return divide;
	}

	public void setDivide(int divide) {
		this.divide = divide;
	}

	public int getFuelCostSum() {
		return fuelCostSum;
	}

	public void setFuelCostSum(int fuelCostSum) {
		this.fuelCostSum = fuelCostSum;
	}

	public int getExpresswayExpenses() {
		return expresswayExpenses;
	}

	public void setExpresswayExpenses(int expresswayExpenses) {
		this.expresswayExpenses = expresswayExpenses;
	}

	public int getExpresswayNumberPer() {
		return expresswayNumberPer;
	}

	public void setExpresswayNumberPer(int expresswayNumberPer) {
		this.expresswayNumberPer = expresswayNumberPer;
	}

	public int getExpresswayExpensesSum() {
		return expresswayExpensesSum;
	}

	public void setExpresswayExpensesSum(int expresswayExpensesSum) {
		this.expresswayExpensesSum = expresswayExpensesSum;
	}

	public String getSum() {
		return sum;
	}

	public void setSum(String sum) {
		this.sum = sum;
	}

	public String getVehicleC() {
		return vehicleC;
	}

	public void setVehicleC(String vehicleC) {
		this.vehicleC = vehicleC;
	}

	public String getVehicleName() {
		return vehicleName;
	}

	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	

}
