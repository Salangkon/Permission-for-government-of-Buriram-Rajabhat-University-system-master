package com.hillert.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;

import org.springframework.stereotype.Service;

import com.hillert.model.ExpenseSumaryBean;
import com.hillert.model.FacultyBean;
import com.hillert.model.PermissionBean;
import com.hillert.model.UserBean;
import com.hillert.util.ConnectDB;

@Service
public class AdminDao {
	
	// นับจำนวนใบฟอร์ม ที่ขออนุญาตไปราชการทั้งหมด
	public PermissionBean countPer() throws SQLException {
		PermissionBean bean = new PermissionBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(permission_id) AS permission FROM permission");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setPermissionId(rs.getInt("permission"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	// นับจำนวนใบฟอร์ม ที่ขออนุญาตกลับจากราชการทั้งหมด 
	public PermissionBean countPerBack() throws SQLException {
		PermissionBean bean = new PermissionBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(permission_id) AS permission_back FROM permission_back");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setPermissionId(rs.getInt("permission_back"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	// นับจำนวนใบฟอร์ม คณะครุศาสตร์ ที่ขออนุญาตไปราชการทั้งหมด
	public FacultyBean countFac1() throws SQLException {
		FacultyBean bean = new FacultyBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(faculty_id) AS faculty \r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
					"\r\n" + 
					"WHERE f.faculty_id = 1");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setFacultyId(rs.getInt("faculty"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	// นับจำนวนใบฟอร์ม คณะวิทยาศาสตร์ ที่ขออนุญาตไปราชการทั้งหมด
	public FacultyBean countFac2() throws SQLException {
		FacultyBean bean = new FacultyBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(faculty_id) AS faculty \r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
					"\r\n" + 
					"WHERE f.faculty_id = 2");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setFacultyId(rs.getInt("faculty"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	// นับจำนวนใบฟอร์ม คณะมนุษยศาสตร์และสังคมศาสตร์ ที่ขออนุญาตไปราชการทั้งหมด
	public FacultyBean countFac3() throws SQLException {
		FacultyBean bean = new FacultyBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(faculty_id) AS faculty \r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
					"\r\n" + 
					"WHERE f.faculty_id = 3");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setFacultyId(rs.getInt("faculty"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	// นับจำนวนใบฟอร์มคณะวิทยาการจัดการ ที่ขออนุญาตไปราชการทั้งหมด
	public FacultyBean countFac4() throws SQLException {
		FacultyBean bean = new FacultyBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(faculty_id) AS faculty \r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
					"\r\n" + 
					"WHERE f.faculty_id = 4");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setFacultyId(rs.getInt("faculty"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	
	// นับจำนวนใบฟอร์ม คณะเทคโนโลยีอุตสาหกรรม ที่ขออนุญาตไปราชการทั้งหมด
	public FacultyBean countFac5() throws SQLException {
		FacultyBean bean = new FacultyBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(faculty_id) AS faculty \r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
					"\r\n" + 
					"WHERE f.faculty_id = 5");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setFacultyId(rs.getInt("faculty"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	
	// นับจำนวนใบฟอร์ม คณะเทคโนโลยีการเกษตร  ที่ขออนุญาตไปราชการทั้งหมด
	public FacultyBean countFac6() throws SQLException {
		FacultyBean bean = new FacultyBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(faculty_id) AS faculty \r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
					"\r\n" + 
					"WHERE f.faculty_id = 6");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setFacultyId(rs.getInt("faculty"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	//นับจำนวน user ทั้งหมด ที่อยู่ใน SQL
	public UserBean countUser() throws SQLException {
		UserBean bean = new UserBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT COUNT(user_id) AS user FROM user ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setUserId(rs.getInt("user"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	// ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ
	public ExpenseSumaryBean ExpenseSumary() throws SQLException {
		ExpenseSumaryBean bean = new ExpenseSumaryBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT SUM(b_expense_estimate_sum_total) AS expense_estimate FROM expense_sumary_back ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			DecimalFormat myFormatter = new DecimalFormat();
			while (rs.next()) {
				bean.setExpenseEstimateSumTotal(rs.getInt("expense_estimate"));
				bean.setExpenseEstimateSumTotalComma(myFormatter.format(rs.getInt("expense_estimate")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}

	// ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะครุศาสตร์
	public ExpenseSumaryBean ExpenseSumaryFac1() throws SQLException {
		ExpenseSumaryBean bean = new ExpenseSumaryBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		
		try {
			sql.append("SELECT SUM(b_expense_estimate_sum_total) AS expense_estimate_fac1\r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN expense_sumary_back es on es.permission_id = permission.permission_id \r\n" + 
					"WHERE f.faculty_id = 1");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			DecimalFormat myFormatter = new DecimalFormat();
			while (rs.next()) {
				bean.setExpenseEstimateSumTotal(rs.getInt("expense_estimate_fac1"));
				bean.setExpenseEstimateSumTotalComma(myFormatter.format(rs.getInt("expense_estimate_fac1")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
		}
	
	// ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะวิทยาศาสตร์
	public ExpenseSumaryBean ExpenseSumaryFac2() throws SQLException {
		ExpenseSumaryBean bean = new ExpenseSumaryBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		
		try {
			sql.append("SELECT SUM(b_expense_estimate_sum_total) AS expense_estimate_fac2\r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN expense_sumary_back es on es.permission_id = permission.permission_id \r\n" + 
					"WHERE f.faculty_id = 2");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			DecimalFormat myFormatter = new DecimalFormat();
			while (rs.next()) {
				bean.setExpenseEstimateSumTotal(rs.getInt("expense_estimate_fac2"));
				bean.setExpenseEstimateSumTotalComma(myFormatter.format(rs.getInt("expense_estimate_fac2")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
		}
	
	// ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะมนุษยศาสตร์และสังคมศาสตร์
	public ExpenseSumaryBean ExpenseSumaryFac3() throws SQLException {
		ExpenseSumaryBean bean = new ExpenseSumaryBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		
		try {
			sql.append("SELECT SUM(b_expense_estimate_sum_total) AS expense_estimate_fac3\r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN expense_sumary_back es on es.permission_id = permission.permission_id \r\n" + 
					"WHERE f.faculty_id = 3");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			DecimalFormat myFormatter = new DecimalFormat();
			while (rs.next()) {
				bean.setExpenseEstimateSumTotal(rs.getInt("expense_estimate_fac3"));
				bean.setExpenseEstimateSumTotalComma(myFormatter.format(rs.getInt("expense_estimate_fac3")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
		}
	
	// ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะวิทยาการจัดการ
	public ExpenseSumaryBean ExpenseSumaryFac4() throws SQLException {
		ExpenseSumaryBean bean = new ExpenseSumaryBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		
		try {
			sql.append("SELECT SUM(b_expense_estimate_sum_total) AS expense_estimate_fac4\r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN expense_sumary_back es on es.permission_id = permission.permission_id \r\n" + 
					"WHERE f.faculty_id = 4");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			DecimalFormat myFormatter = new DecimalFormat();
			while (rs.next()) {
				bean.setExpenseEstimateSumTotal(rs.getInt("expense_estimate_fac4"));
				bean.setExpenseEstimateSumTotalComma(myFormatter.format(rs.getInt("expense_estimate_fac4")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
		}
	
	// ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะเทคโนโลยีอุตสาหกรรม
	public ExpenseSumaryBean ExpenseSumaryFac5() throws SQLException {
		ExpenseSumaryBean bean = new ExpenseSumaryBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		
		try {
			sql.append("SELECT SUM(b_expense_estimate_sum_total) AS expense_estimate_fac5\r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN expense_sumary_back es on es.permission_id = permission.permission_id \r\n" + 
					"WHERE f.faculty_id = 5");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			DecimalFormat myFormatter = new DecimalFormat();
			while (rs.next()) {
				bean.setExpenseEstimateSumTotal(rs.getInt("expense_estimate_fac5"));
				bean.setExpenseEstimateSumTotalComma(myFormatter.format(rs.getInt("expense_estimate_fac5")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
		}
	
	// ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะเทคโนโลยีการเกษตร
	public ExpenseSumaryBean ExpenseSumaryFac6() throws SQLException {
		ExpenseSumaryBean bean = new ExpenseSumaryBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		
		try {
			sql.append("SELECT SUM(b_expense_estimate_sum_total) AS expense_estimate_fac6\r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN expense_sumary_back es on es.permission_id = permission.permission_id \r\n" + 
					"WHERE f.faculty_id = 6");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			DecimalFormat myFormatter = new DecimalFormat();
			while (rs.next()) {
				bean.setExpenseEstimateSumTotal(rs.getInt("expense_estimate_fac6"));
				bean.setExpenseEstimateSumTotalComma(myFormatter.format(rs.getInt("expense_estimate_fac6")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
		}
	
}//end class
