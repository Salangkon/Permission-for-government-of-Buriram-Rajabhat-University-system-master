package com.hillert.model;

import java.sql.Timestamp;

public class TravelExpensesFuelCostBean {
	
	private int travelId;
	private int permissionId;
	
	private int distance; //ระยะทาง
	private int numberPer; // จำนวน/เที่ยว
	private int fuelCost; // ค่าน้ำมันเชื้อเพลิง
	private int rateFuelCost; // หาร
	private int fuelCostSum; // รวมค่าน้ำมันเชื้อเพลิง
	private String fuelCostSumComma; // รวมค่าน้ำมันเชื้อเพลิง

	private int expresswayExpensesSum; // รวมค่าใช้จ่ายทางด่วน
	private String expresswayExpensesSumComma; //รวม
	
	private String sum; //รวม
	private String vehicleC; //หมายเหตุ
	private String vehicleName; //รวม

	private Timestamp createDate;

	
	public String getFuelCostSumComma() {
		return fuelCostSumComma;
	}

	public void setFuelCostSumComma(String fuelCostSumComma) {
		this.fuelCostSumComma = fuelCostSumComma;
	}

	public String getExpresswayExpensesSumComma() {
		return expresswayExpensesSumComma;
	}

	public void setExpresswayExpensesSumComma(String expresswayExpensesSumComma) {
		this.expresswayExpensesSumComma = expresswayExpensesSumComma;
	}

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

	public int getRateFuelCost() {
		return rateFuelCost;
	}

	public void setRateFuelCost(int rateFuelCost) {
		this.rateFuelCost = rateFuelCost;
	}

	public int getFuelCostSum() {
		return fuelCostSum;
	}

	public void setFuelCostSum(int fuelCostSum) {
		this.fuelCostSum = fuelCostSum;
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
