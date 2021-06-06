package com.sonata.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sonata.DAO.PatientDAO;
import com.sonata.Model.Patient;;

public class PatientDAOImpl implements PatientDAO {
	int row=0;
	DBConnection db=new DBConnection();
    Connection con=db.getConnection();
    Patient patient=null;
	public int getPatientId(Object obj) {
		patient=(Patient)obj;
		int id=0;
		try {
			PreparedStatement ps=con.prepareStatement("SELECT patient_id FROM patient WHERE p_username LIKE ?");
			ps.setString(1, patient.getUserName());
			ResultSet rs=ps.executeQuery();
			rs.next();
			id=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}
	

	@Override
	public int insertPatient(Object obj) {
		patient=(Patient)obj;
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO patient(p_username,p_password,p_name,p_contact,p_location) VALUES(?,?,?,?,?)");
			ps.setString(1, patient.getUserName());
			ps.setString(2, patient.getPassword());
			ps.setString(3, patient.getName());
			ps.setLong(4, patient.getContact());
			ps.setString(5, patient.getLocation());
			
			System.out.println(ps);
			/*
			ps.setString(6, pat.getScheduleTime());
			ps.setString(7, pat.getConsultHist());
			ps.setString(8, pat.getHealthHist());
			*/
			ps.executeUpdate();
			
			PatientDAOImpl dao1=new PatientDAOImpl();
			PreparedStatement ps1=con.prepareStatement("INSERT INTO patient_login(patient_id,p_username,p_password) VALUES(?,?,?)");
			int id=dao1.getPatientId(patient);
			ps1.setInt(1,id);
			ps1.setString(2, patient.getUserName());
			ps1.setString(3, patient.getPassword());
			row=ps1.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return row;
	}

	public boolean validateLoginUP(String u,String p) {
		try {
			PreparedStatement ps3=con.prepareStatement("SELECT p_username,p_password FROM patient_login where p_username=? and p_password=?");
			ps3.setString(1, u);
			ps3.setString(2, p);
			ResultSet rs=ps3.executeQuery();
			//System.out.println(rs.getString(1));
			while(rs.next()) {
				//System.out.println(rs.getString(1));
				if(u.equals(rs.getString(1))) {
					if(p.equals(rs.getString(2))) {
						return true;
					}
					else 
						return false;
				}
				else 
					return false;
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	public boolean validateRegUserExists(String u) {
		try {
			PreparedStatement ps3=con.prepareStatement("SELECT p_username FROM patient_login where p_username=?");
			ps3.setString(1, u);
			ResultSet rs=ps3.executeQuery();
			//System.out.println(rs.getString(1));
			while(rs.next()) {
				//System.out.println(rs.getString(1));
				if(u.equals(rs.getString(1))) {
						return true;
					
				}
				else 
					return false;
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;

	}
	
	public int patientAppointment(String pid,String hh,String ch) {
        try {
      
                    PreparedStatement ps=con.prepareStatement("update patient set P_HEALTH_HISTORY=?,P_CONSULTATION_HISTORY=? where PATIENT_ID=?");
                    ps.setString(1,hh);
                    ps.setString(2,ch);
                    ps.setString(3,pid);
//                    ps3.setString(4,);
                    row=ps.executeUpdate();
                        //return true;
            }catch(SQLException ed) {
                ed.printStackTrace();
            }
		return row;
    }
	
	public boolean validateLoginDUP(String ud,String pd) {
		try {
			PreparedStatement ps3=con.prepareStatement("SELECT d_username,d_password FROM doctor_login where d_username=? and d_password=?");
			ps3.setString(1,ud);
			ps3.setString(2, pd);
			ResultSet rs=ps3.executeQuery();
			//System.out.println(rs.getString(1));
			while(rs.next()) {
				//System.out.println(rs.getString(1));
				if(ud.equals(rs.getString(1))) {
					if(pd.equals(rs.getString(2))) {
						return true;
					}
					else 
						return false;
				}
				else 
					return false;
				
			}
		}catch(SQLException ed) {
			ed.printStackTrace();
		}
		return false;
	}
	public int observation(int pid,int did,String obs,String med) {
		try {
		PreparedStatement ps=con.prepareStatement("INSERT INTO observation(patient_id,doc_id,prescription,meds_prescribed) VALUES(?,?,?,?)");
		ps.setInt(1,pid);
		ps.setInt(2, did);
		ps.setString(3, obs);
		ps.setString(4, med);
		row=ps.executeUpdate();
		PreparedStatement ps1=con.prepareStatement("DELETE FROM schedules where patient_id=? and doc_id=?" );
		ps1.setInt(1,pid);
		ps1.setInt(2,did);
		ps1.executeUpdate();
		
		}catch(SQLException e) {
		e.printStackTrace();
		}
		return row;
		}
	


	@Override
	public int bookAppointment(int pid, int drid, String date, String healthhist, String consulthist) {
		try {
			PreparedStatement ps=con.prepareStatement("UPDATE patient SET p_consultation_scheduled=?, p_consultation_history=?, p_health_history=? WHERE patient_id=?");
			ps.setString(1, date);
			ps.setString(2, consulthist);
			ps.setString(3, healthhist);
			ps.setInt(4, pid);
			ps.executeUpdate();
			PreparedStatement ps1=con.prepareStatement("INSERT INTO schedules(doc_schedule,doc_id,patient_id) VALUES(?,?,?)");
			ps1.setString(1,date);
			ps1.setInt(2, drid);
			ps1.setInt(3, pid);
			row=ps1.executeUpdate();
			}catch(SQLException e) {
			e.printStackTrace();
			}
			return row;
	}
}

