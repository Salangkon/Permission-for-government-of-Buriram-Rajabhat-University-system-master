package com.hillert.model;

public class FacultyBean {

		private String facultyName;
		private String facultyCode;
		private int facultyComma;
		private int PersonnelId;
		private String facultyStatus;
		
		public String getFacultyStatus() {
			return facultyStatus;
		}
		public void setFacultyStatus(String facultyStatus) {
			this.facultyStatus = facultyStatus;
		}
		public int getPersonnelId() {
			return PersonnelId;
		}
		public void setPersonnelId(int personnelId) {
			PersonnelId = personnelId;
		}
		public int getFacultyComma() {
			return facultyComma;
		}
		public void setFacultyComma(int facultyComma) {
			this.facultyComma = facultyComma;
		}
		public String getFacultyName() {
			return facultyName;
		}
		public void setFacultyName(String facultyName) {
			this.facultyName = facultyName;
		}
		public String getFacultyCode() {
			return facultyCode;
		}
		public void setFacultyCode(String facultyCode) {
			this.facultyCode = facultyCode;
		}	
		
}
