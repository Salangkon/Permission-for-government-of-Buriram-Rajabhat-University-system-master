package com.hillert.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hillert.model.AmphurBean;
import com.hillert.model.DistrictBean;
import com.hillert.model.ProvinceBean;
import com.hillert.util.ConnectDB;

@Service
public class GeographyDao {
	
	// Province
	public List<ProvinceBean> province() throws SQLException {
		ProvinceBean bean = new ProvinceBean();
		List<ProvinceBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT * from province ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean = new ProvinceBean();
				bean.setProvinceId(rs.getInt("province_id"));
				bean.setProvinceName(rs.getString("province_name"));

				list.add(bean);

			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			conn.close();
		}
		return list;
	}

	// Amphur
	public List<AmphurBean> amphur(String province) throws SQLException {
		AmphurBean bean = new AmphurBean();
		List<AmphurBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT * FROM Amphur WHERE PROVINCE_ID = ?");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, province);

			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean = new AmphurBean();
				bean.setAmphurId(rs.getInt("amphur_id"));
				// bean.setAmphurCode(rs.getString("amphur_code"));
				bean.setAmphurName(rs.getString("amphur_name"));
				// bean.setPostCode(rs.getString("post_code"));
				bean.setProvinceId(rs.getInt("province_id"));
				
				list.add(bean);

			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			conn.close();
		}
		return list;
	}

	// District
	public List<DistrictBean> District(String province, String district) throws SQLException {
		DistrictBean bean = new DistrictBean();
		List<DistrictBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT * FROM district WHERE PROVINCE_ID = ? and AMPHUR_ID = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, province);
			prepared.setString(2, district);
			// prepared.setString(3, district);
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean = new DistrictBean();
				bean.setDistrictId(rs.getInt("district_id"));
				bean.setDistrictCode(rs.getString("district_code"));
				bean.setDistrictName(rs.getString("district_name"));
				bean.setAmphurId(rs.getInt("AMPHUR_ID"));
				bean.setProvinceId(rs.getInt("PROVINCE_ID"));
				
				list.add(bean);

			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			conn.close();
		}
		return list;
	}

}
