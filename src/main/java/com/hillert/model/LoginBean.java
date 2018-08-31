package com.hillert.model;

public class LoginBean {

	private int LogId;
	private String LogUsername;
	private String LogPassword;
	private String LogRole;
	
	public int getLogId() {
		return LogId;
	}
	public void setLogId(int logId) {
		LogId = logId;
	}
	public String getLogUsername() {
		return LogUsername;
	}
	public void setLogUsername(String logUsername) {
		LogUsername = logUsername;
	}
	public String getLogPassword() {
		return LogPassword;
	}
	public void setLogPassword(String logPassword) {
		LogPassword = logPassword;
	}
	public String getLogRole() {
		return LogRole;
	}
	public void setLogRole(String logRole) {
		LogRole = logRole;
	}
}
