package com.sonata.DAO;

public interface PatientDAO {

	public int insertPatient(Object obj);
	public int bookAppointment(int pid,int did,String date,String health,String consult);
}
