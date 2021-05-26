package com.sonata.Model;

public class Patient {
	private String userName;
	private String password;
	private String Name;
	private long contact;
	private String location; 
	private String scheduleTime;
	private String consultHist;
	private String healthHist;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public long getContact() {
		return contact;
	}
	public void setContact(long contact) {
		this.contact = contact;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getScheduleTime() {
		return scheduleTime;
	}
	public void setScheduleTime(String scheduleTime) {
		this.scheduleTime = scheduleTime;
	}
	public String getConsultHist() {
		return consultHist;
	}
	public void setConsultHist(String consultHist) {
		this.consultHist = consultHist;
	}
	public String getHealthHist() {
		return healthHist;
	}
	public void setHealthHist(String healthHist) {
		this.healthHist = healthHist;
	}
	
	

}
