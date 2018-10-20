package com.hillert.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hillert.model.PersonAddressBean;

import com.hillert.util.ConnectDB;

@Service
public class PersonnelListDao {
	int userId;
	
	//show users 
		public List<PersonAddressBean> userPersonnel(int personnel) throws SQLException {
			List<PersonAddressBean> list = new ArrayList<>();
	
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement prepared = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append("SELECT pl.*, u.* , f.faculty_name, d.department_name , p.position_name,sp.sub_position_name ,sp.allowence ,sp.rent_date "
						+ "FROM personnel_list pl"
						+ " INNER JOIN user u on u.user_id = pl.user_id"
						+ " INNER JOIN department d on d.department_code = pl.department_code"
						+ " INNER JOIN faculty f on f.faculty_code = d.faculty_code"
						+ " INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code"
						+ " INNER JOIN position p on p.position_code = sp.position_code"
						+ " WHERE u.user_id = ?"
						+ " ORDER BY u.user_id ");
				prepared = conn.prepareStatement(sql.toString());
				prepared.setInt(1, personnel);
				ResultSet rs = prepared.executeQuery();

				while (rs.next()) {
					PersonAddressBean bean = new PersonAddressBean();
					bean.setPersonnelId(rs.getInt("personnel_id"));
					bean.setUserId(rs.getInt("user_id"));
					bean.setDepartmentCode(rs.getString("department_code"));
					bean.setSubPositionCode(rs.getString("sub_position_code"));
	
					bean.setUserFname(rs.getString("user_fname"));
					bean.setUserLname(rs.getString("user_Lname"));
					bean.setSex(rs.getString("sex"));
					
					bean.setFacultyName(rs.getString("faculty_name"));
					bean.setDepartmentName(rs.getString("department_name"));
					bean.setPositionName(rs.getString("position_name"));
					bean.setSubPositionName(rs.getString("sub_position_name"));
					bean.setAllowence(rs.getInt("allowence"));
					bean.setRentDate(rs.getInt("rent_date"));
					userId=bean.getUserId();
					list.add(bean);


				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				if (con != null) {
					conn.close();
				}
			}
			return list;
		}//end
		
		//show users
		public List<PersonAddressBean>  findByUser() throws SQLException  {
			List<PersonAddressBean> list = new ArrayList<>();
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement preperd = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append("SELECT pl.*, u.* , f.faculty_name, d.department_name , p.position_name,sp.sub_position_name ,sp.allowence ,sp.allowence_type ,sp.rent_date "
						+ " FROM personnel_list pl"
						+ " INNER JOIN user u on u.user_id = pl.user_id"
						+ " INNER JOIN department d on d.department_code = pl.department_code"
						+ " INNER JOIN faculty f on f.faculty_code = d.faculty_code"
						+ " INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code"
						+ " INNER JOIN position p on p.position_code = sp.position_code"
						+ " ORDER BY u.user_id DESC ");
				preperd = conn.prepareStatement(sql.toString());
				ResultSet rs = preperd.executeQuery();

				while (rs.next()) {
					PersonAddressBean bean = new PersonAddressBean();
					bean.setPersonnelId(rs.getInt("personnel_id"));
					bean.setUserId(rs.getInt("user_id"));
					bean.setDepartmentCode(rs.getString("department_code"));
					bean.setSubPositionCode(rs.getString("sub_position_code"));
					
					bean.setUserUsername(rs.getString("user_username"));
					bean.setUserFname(rs.getString("user_fname"));
					bean.setUserLname(rs.getString("user_Lname"));
					bean.setSex(rs.getString("sex"));
					bean.setRole(rs.getInt("role"));
					
					bean.setFacultyName(rs.getString("faculty_name"));
					bean.setDepartmentName(rs.getString("department_name"));
					bean.setPositionName(rs.getString("position_name"));
					bean.setSubPositionName(rs.getString("sub_position_name"));
					bean.setAllowence(rs.getInt("allowence"));
					bean.setAllowenceType(rs.getInt("allowence_type"));
					bean.setRentDate(rs.getInt("rent_date"));

					list.add(bean);
				
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				if (con != null) {
					conn.close();
				}
			}
			return list;
		}//end

}
