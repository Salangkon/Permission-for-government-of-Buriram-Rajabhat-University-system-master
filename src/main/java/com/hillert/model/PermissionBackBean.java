package com.hillert.model;

import java.util.List;

public class PermissionBackBean {
	
	private int permissionId;
	
	private String bSaveDate;
	private String bSaveDateDay;
	private String bSaveDateMonth;
	private String bSaveDateYear;
	
	private String bByOrderSave;
	
	private String bDateAuthorized; //วันที่อนุมัติ
	private String bDateAuthorizedDay;
	private String bDateAuthorizedMonth;
	private String bDateAuthorizedYear;
	
	private int bDisbursedBy;
	private int bAllowenceType;
	private int bRentDateType;
	private int bStartTravel;
	private int bBackTravel;
	private String bHouseNumber;
	private String bRoad;
	private String district;
	
	private String bGoDate;	
	private String bGoDateDay;	
	private String bGoDateMonth;	
	private String bGoDateYear;	
	private String bGoTime;	
	
	private String bBackDate;
	private String bBackDateDay;
	private String bBackDateMonth;
	private String bBackDateYear;
	private String bBackTime;
	
	private String bDaySum;
	private String bTimeSum;
	
	private String districtName;
	private String amphurName;	
	private String provinceName;
	
	private String bBenefitRecord;
	private String bBenefitCourses;	
	private String bBenefitUse;
	
	private String choiceBill1;
	private String choiceBill2;	
	private String choiceBill3;
	private String choiceBill4;
	private String choiceBill5;	
	private String choiceBill6;
	private String choiceBill7;	
	private String choiceBill7C;
	
	private String billGoDate;	
	private String billDetail1;
	private String billBackDate;
	private String billDetail2;	
	
	private PermissionBean permissionBean;
	private List<ExpenseEstimateBean> eeBean;
	private ExpenseSumaryBean esBean;
	
	
	public String getBillGoDate() {
		return billGoDate;
	}
	public void setBillGoDate(String billGoDate) {
		this.billGoDate = billGoDate;
	}
	public String getBillDetail1() {
		return billDetail1;
	}
	public void setBillDetail1(String billDetail1) {
		this.billDetail1 = billDetail1;
	}
	public String getBillBackDate() {
		return billBackDate;
	}
	public void setBillBackDate(String billBackDate) {
		this.billBackDate = billBackDate;
	}
	public String getBillDetail2() {
		return billDetail2;
	}
	public void setBillDetail2(String billDetail2) {
		this.billDetail2 = billDetail2;
	}
	public String getChoiceBill1() {
		return choiceBill1;
	}
	public void setChoiceBill1(String choiceBill1) {
		this.choiceBill1 = choiceBill1;
	}
	public String getChoiceBill2() {
		return choiceBill2;
	}
	public void setChoiceBill2(String choiceBill2) {
		this.choiceBill2 = choiceBill2;
	}
	public String getChoiceBill3() {
		return choiceBill3;
	}
	public void setChoiceBill3(String choiceBill3) {
		this.choiceBill3 = choiceBill3;
	}
	public String getChoiceBill4() {
		return choiceBill4;
	}
	public void setChoiceBill4(String choiceBill4) {
		this.choiceBill4 = choiceBill4;
	}
	public String getChoiceBill5() {
		return choiceBill5;
	}
	public void setChoiceBill5(String choiceBill5) {
		this.choiceBill5 = choiceBill5;
	}
	public String getChoiceBill6() {
		return choiceBill6;
	}
	public void setChoiceBill6(String choiceBill6) {
		this.choiceBill6 = choiceBill6;
	}
	public String getChoiceBill7() {
		return choiceBill7;
	}
	public void setChoiceBill7(String choiceBill7) {
		this.choiceBill7 = choiceBill7;
	}
	public String getChoiceBill7C() {
		return choiceBill7C;
	}
	public void setChoiceBill7C(String choiceBill7C) {
		this.choiceBill7C = choiceBill7C;
	}
	public String getbBenefitRecord() {
		return bBenefitRecord;
	}
	public void setbBenefitRecord(String bBenefitRecord) {
		this.bBenefitRecord = bBenefitRecord;
	}
	public String getbBenefitCourses() {
		return bBenefitCourses;
	}
	public void setbBenefitCourses(String bBenefitCourses) {
		this.bBenefitCourses = bBenefitCourses;
	}
	public String getbBenefitUse() {
		return bBenefitUse;
	}
	public void setbBenefitUse(String bBenefitUse) {
		this.bBenefitUse = bBenefitUse;
	}
	public List<ExpenseEstimateBean> getEeBean() {
		return eeBean;
	}
	public void setEeBean(List<ExpenseEstimateBean> eeBean) {
		this.eeBean = eeBean;
	}
	public ExpenseSumaryBean getEsBean() {
		return esBean;
	}
	public void setEsBean(ExpenseSumaryBean esBean) {
		this.esBean = esBean;
	}
	public String getbSaveDateDay() {
		return bSaveDateDay;
	}
	public void setbSaveDateDay(String bSaveDateDay) {
		this.bSaveDateDay = bSaveDateDay;
	}
	public String getbSaveDateMonth() {
		return bSaveDateMonth;
	}
	public void setbSaveDateMonth(String bSaveDateMonth) {
		this.bSaveDateMonth = bSaveDateMonth;
	}
	public String getbSaveDateYear() {
		return bSaveDateYear;
	}
	public void setbSaveDateYear(String bSaveDateYear) {
		this.bSaveDateYear = bSaveDateYear;
	}
	public PermissionBean getPermissionBean() {
		return permissionBean;
	}
	public void setPermissionBean(PermissionBean permissionBean) {
		this.permissionBean = permissionBean;
	}
	public String getbSaveDate() {
		return bSaveDate;
	}
	public void setbSaveDate(String bSaveDate) {
		this.bSaveDate = bSaveDate;
	}
	public String getbGoDateDay() {
		return bGoDateDay;
	}
	public void setbGoDateDay(String bGoDateDay) {
		this.bGoDateDay = bGoDateDay;
	}
	public String getbGoDateMonth() {
		return bGoDateMonth;
	}
	public void setbGoDateMonth(String bGoDateMonth) {
		this.bGoDateMonth = bGoDateMonth;
	}
	public String getbGoDateYear() {
		return bGoDateYear;
	}
	public void setbGoDateYear(String bGoDateYear) {
		this.bGoDateYear = bGoDateYear;
	}
	public String getbBackDateDay() {
		return bBackDateDay;
	}
	public void setbBackDateDay(String bBackDateDay) {
		this.bBackDateDay = bBackDateDay;
	}
	public String getbBackDateMonth() {
		return bBackDateMonth;
	}
	public void setbBackDateMonth(String bBackDateMonth) {
		this.bBackDateMonth = bBackDateMonth;
	}
	public String getbBackDateYear() {
		return bBackDateYear;
	}
	public void setbBackDateYear(String bBackDateYear) {
		this.bBackDateYear = bBackDateYear;
	}
	public String getbDateAuthorizedDay() {
		return bDateAuthorizedDay;
	}
	public void setbDateAuthorizedDay(String bDateAuthorizedDay) {
		this.bDateAuthorizedDay = bDateAuthorizedDay;
	}
	public String getbDateAuthorizedMonth() {
		return bDateAuthorizedMonth;
	}
	public void setbDateAuthorizedMonth(String bDateAuthorizedMonth) {
		this.bDateAuthorizedMonth = bDateAuthorizedMonth;
	}
	public String getbDateAuthorizedYear() {
		return bDateAuthorizedYear;
	}
	public void setbDateAuthorizedYear(String bDateAuthorizedYear) {
		this.bDateAuthorizedYear = bDateAuthorizedYear;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	public String getAmphurName() {
		return amphurName;
	}
	public void setAmphurName(String amphurName) {
		this.amphurName = amphurName;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public int getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(int permissionId) {
		this.permissionId = permissionId;
	}
	public String getbByOrderSave() {
		return bByOrderSave;
	}
	public void setbByOrderSave(String bByOrderSave) {
		this.bByOrderSave = bByOrderSave;
	}
	public String getbDateAuthorized() {
		return bDateAuthorized;
	}
	public void setbDateAuthorized(String bDateAuthorized) {
		this.bDateAuthorized = bDateAuthorized;
	}
	public int getbDisbursedBy() {
		return bDisbursedBy;
	}
	public void setbDisbursedBy(int bDisbursedBy) {
		this.bDisbursedBy = bDisbursedBy;
	}
	public int getbAllowenceType() {
		return bAllowenceType;
	}
	public void setbAllowenceType(int bAllowenceType) {
		this.bAllowenceType = bAllowenceType;
	}
	public int getbRentDateType() {
		return bRentDateType;
	}
	public void setbRentDateType(int bRentDateType) {
		this.bRentDateType = bRentDateType;
	}
	public int getbStartTravel() {
		return bStartTravel;
	}
	public void setbStartTravel(int bStartTravel) {
		this.bStartTravel = bStartTravel;
	}
	public int getbBackTravel() {
		return bBackTravel;
	}
	public void setbBackTravel(int bBackTravel) {
		this.bBackTravel = bBackTravel;
	}
	public String getbHouseNumber() {
		return bHouseNumber;
	}
	public void setbHouseNumber(String bHouseNumber) {
		this.bHouseNumber = bHouseNumber;
	}
	public String getbRoad() {
		return bRoad;
	}
	public void setbRoad(String bRoad) {
		this.bRoad = bRoad;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getbGoDate() {
		return bGoDate;
	}
	public void setbGoDate(String bGoDate) {
		this.bGoDate = bGoDate;
	}
	public String getbGoTime() {
		return bGoTime;
	}
	public void setbGoTime(String bGoTime) {
		this.bGoTime = bGoTime;
	}
	public String getbBackDate() {
		return bBackDate;
	}
	public void setbBackDate(String bBackDate) {
		this.bBackDate = bBackDate;
	}
	public String getbBackTime() {
		return bBackTime;
	}
	public void setbBackTime(String bBackTime) {
		this.bBackTime = bBackTime;
	}
	public String getbDaySum() {
		return bDaySum;
	}
	public void setbDaySum(String bDaySum) {
		this.bDaySum = bDaySum;
	}
	public String getbTimeSum() {
		return bTimeSum;
	}
	public void setbTimeSum(String bTimeSum) {
		this.bTimeSum = bTimeSum;
	}
	
}
