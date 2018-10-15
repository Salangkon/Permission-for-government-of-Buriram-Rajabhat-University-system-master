package com.hillert.model;

import java.sql.Timestamp;
import java.util.List;

public class PermissionBean {
	
	private int permissionId;
	private int personnelId;
	private String permissionStatus;
	
	private int userId;
	private String userFname;
	private String userLname;
	private String date;
	private String dateDay;
	private String dateMonth;
	private String dateYear;
	private String sex;
		
	private String facultyName;
	private String departmentName;
	private String positionName;
	private String subPositionName;
	
	private String status;
	private String object;
	
	private String purpose;
	private String purpose1;
	private String purpose2;
	private String topics;
	private String other;

	
	private String destinationName;
	private String province;
	private String amphur;
	private String district;
	private String districtId;
	
	private String provinceName;
	private String amphurName;
	private String districtName;
	
	private String goDate;
	private String goDateDay;
	private String goDateMonth;
	private String goDateYear;
	private String goTime;
	private String backDate;
	private String backDateDay;
	private String backDateMonth;
	private String backDateYear;
	private String backTime;
	
	private String budget;
	private String budgetExpenses;
	private String budgetBy;
	private String budgetProject;
	private String budgetPass;
	
	private String travel;
	private String travelIdcard;
	private String travelDriver;
	
	private String commitA;
	private String commitADt;
	private String commitB;
	private String commitBDt;
	private String commitC;
	private String commitCDt;
	private String commitD;
	private String commitDDt;

	private Timestamp createDate;
	
	private String expenseEstimateSumTotal;
	
	private List<ExpenseEstimateBean> eeBean;
	private ExpenseSumaryBean esBean;
	private List<TravelExpensesBean> teBean;
	private List<TravelExpensesFuelCostBean> tefcBean;
	
	
	public String getExpenseEstimateSumTotal() {
		return expenseEstimateSumTotal;
	}
	public void setExpenseEstimateSumTotal(String expenseEstimateSumTotal) {
		this.expenseEstimateSumTotal = expenseEstimateSumTotal;
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
	public List<TravelExpensesBean> getTeBean() {
		return teBean;
	}
	public void setTeBean(List<TravelExpensesBean> teBean) {
		this.teBean = teBean;
	}
	public List<TravelExpensesFuelCostBean> getTefcBean() {
		return tefcBean;
	}
	public void setTefcBean(List<TravelExpensesFuelCostBean> tefcBean) {
		this.tefcBean = tefcBean;
	}
	public String getGoDateDay() {
		return goDateDay;
	}
	public void setGoDateDay(String goDateDay) {
		this.goDateDay = goDateDay;
	}
	public String getGoDateMonth() {
		return goDateMonth;
	}
	public void setGoDateMonth(String goDateMonth) {
		this.goDateMonth = goDateMonth;
	}
	public String getGoDateYear() {
		return goDateYear;
	}
	public void setGoDateYear(String goDateYear) {
		this.goDateYear = goDateYear;
	}
	public String getBackDateDay() {
		return backDateDay;
	}
	public void setBackDateDay(String backDateDay) {
		this.backDateDay = backDateDay;
	}
	public String getBackDateMonth() {
		return backDateMonth;
	}
	public void setBackDateMonth(String backDateMonth) {
		this.backDateMonth = backDateMonth;
	}
	public String getBackDateYear() {
		return backDateYear;
	}
	public void setBackDateYear(String backDateYear) {
		this.backDateYear = backDateYear;
	}
	public String getPermissionStatus() {
		return permissionStatus;
	}
	public void setPermissionStatus(String permissionStatus) {
		this.permissionStatus = permissionStatus;
	}
	public String getDateDay() {
		return dateDay;
	}
	public void setDateDay(String dateDay) {
		this.dateDay = dateDay;
	}
	public String getDateMonth() {
		return dateMonth;
	}
	public void setDateMonth(String dateMonth) {
		this.dateMonth = dateMonth;
	}
	public String getDateYear() {
		return dateYear;
	}
	public void setDateYear(String dateYear) {
		this.dateYear = dateYear;
	}
	public String getDistrictId() {
		return districtId;
	}
	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public String getAmphurName() {
		return amphurName;
	}
	public void setAmphurName(String amphurName) {
		this.amphurName = amphurName;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserFname() {
		return userFname;
	}
	public void setUserFname(String userFname) {
		this.userFname = userFname;
	}
	public String getUserLname() {
		return userLname;
	}
	public void setUserLname(String userLname) {
		this.userLname = userLname;
	}
	public int getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(int permissionId) {
		this.permissionId = permissionId;
	}
	public String getFacultyName() {
		return facultyName;
	}
	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getObject() {
		return object;
	}
	public void setObject(String object) {
		this.object = object;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getPurpose1() {
		return purpose1;
	}
	public void setPurpose1(String purpose1) {
		this.purpose1 = purpose1;
	}
	public String getPurpose2() {
		return purpose2;
	}
	public void setPurpose2(String purpose2) {
		this.purpose2 = purpose2;
	}
	public String getTopics() {
		return topics;
	}
	public void setTopics(String topics) {
		this.topics = topics;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public String getDestinationName() {
		return destinationName;
	}
	public void setDestinationName(String destinationName) {
		this.destinationName = destinationName;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getAmphur() {
		return amphur;
	}
	public void setAmphur(String amphur) {
		this.amphur = amphur;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getGoDate() {
		return goDate;
	}
	public void setGoDate(String goDate) {
		this.goDate = goDate;
	}
	public String getGoTime() {
		return goTime;
	}
	public void setGoTime(String goTime) {
		this.goTime = goTime;
	}
	public String getBackDate() {
		return backDate;
	}
	public void setBackDate(String backDate) {
		this.backDate = backDate;
	}
	public String getBackTime() {
		return backTime;
	}
	public void setBackTime(String backTime) {
		this.backTime = backTime;
	}
	public String getBudget() {
		return budget;
	}
	public void setBudget(String budget) {
		this.budget = budget;
	}
	public String getBudgetExpenses() {
		return budgetExpenses;
	}
	public void setBudgetExpenses(String budgetExpenses) {
		this.budgetExpenses = budgetExpenses;
	}
	public String getBudgetBy() {
		return budgetBy;
	}
	public void setBudgetBy(String budgetBy) {
		this.budgetBy = budgetBy;
	}
	public String getBudgetProject() {
		return budgetProject;
	}
	public void setBudgetProject(String budgetProject) {
		this.budgetProject = budgetProject;
	}
	public String getBudgetPass() {
		return budgetPass;
	}
	public void setBudgetPass(String budgetPass) {
		this.budgetPass = budgetPass;
	}
	public String getTravel() {
		return travel;
	}
	public void setTravel(String travel) {
		this.travel = travel;
	}
	public String getTravelIdcard() {
		return travelIdcard;
	}
	public void setTravelIdcard(String travelIdcard) {
		this.travelIdcard = travelIdcard;
	}
	public String getTravelDriver() {
		return travelDriver;
	}
	public void setTravelDriver(String travelDriver) {
		this.travelDriver = travelDriver;
	}
	public String getCommitA() {
		return commitA;
	}
	public void setCommitA(String commitA) {
		this.commitA = commitA;
	}
	public String getCommitADt() {
		return commitADt;
	}
	public void setCommitADt(String commitADt) {
		this.commitADt = commitADt;
	}
	public String getCommitB() {
		return commitB;
	}
	public void setCommitB(String commitB) {
		this.commitB = commitB;
	}
	public String getCommitBDt() {
		return commitBDt;
	}
	public void setCommitBDt(String commitBDt) {
		this.commitBDt = commitBDt;
	}
	public String getCommitC() {
		return commitC;
	}
	public void setCommitC(String commitC) {
		this.commitC = commitC;
	}
	public String getCommitCDt() {
		return commitCDt;
	}
	public void setCommitCDt(String commitCDt) {
		this.commitCDt = commitCDt;
	}
	public String getCommitD() {
		return commitD;
	}
	public void setCommitD(String commitD) {
		this.commitD = commitD;
	}
	public String getCommitDDt() {
		return commitDDt;
	}
	public void setCommitDDt(String commitDDt) {
		this.commitDDt = commitDDt;
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
	

}
