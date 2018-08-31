package com.hillert.model;

import java.sql.Timestamp;

public class PersonnelListBean {
	
	private int personnelId;
	private int userId;
	private String departmentCode;
	private String subPositionCode;
	private Timestamp createDate;
	
	public int getPersonnelId() {
		return personnelId;
	}
	public void setPersonnelId(int personnelId) {
		this.personnelId = personnelId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getDepartmentCode() {
		return departmentCode;
	}
	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	public String getSubPositionCode() {
		return subPositionCode;
	}
	public void setSubPositionCode(String subPositionCode) {
		this.subPositionCode = subPositionCode;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	
}
