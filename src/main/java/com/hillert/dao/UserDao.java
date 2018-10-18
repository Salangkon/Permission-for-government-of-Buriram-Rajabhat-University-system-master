package com.hillert.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Service;

import com.hillert.model.DepartmentBean;
import com.hillert.model.FacultyBean;
import com.hillert.model.PersonAddressBean;
import com.hillert.model.PersonnelListBean;
import com.hillert.model.PositionBean;
import com.hillert.model.SubPositionBean;
import com.hillert.model.TestAjex;
import com.hillert.model.UserBean;
import com.hillert.util.ConnectDB;

@Service
public class UserDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	int userId;
	int userIdUpdateRole;
	
	static Locale localeTH = new Locale("th", "TH");
	static Locale localeEN = new Locale("en", "EN");
	static SimpleDateFormat formate = new SimpleDateFormat("dd-MM-yyyy", localeTH);
	static SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd",localeEN);
	
	public static java.util.Date DateTHToEN(String date) throws ParseException {
		java.util.Date response = dateformat.parse(date);
	
	return response;
	}

	// เก็บ ID USER และแปลงเพื่อใช้งาน เป็น String
	public TestAjex perId() {
		TestAjex bean = new TestAjex();
		bean.setPerId(userId);
		return bean;
	}// end insert user New
	
	//show users
	public UserBean findByIdCard(int userId) throws SQLException {
		UserBean bean = new UserBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT * FROM user WHERE user_id = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setInt(1, userId);
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {
				bean.setUserId(rs.getInt("user_id"));
				bean.setUserUsername(rs.getString("user_username"));
				bean.setUserPassword(rs.getString("user_password"));
				bean.setUserFname(rs.getString("user_fname"));
				bean.setUserLname(rs.getString("user_lname"));
				bean.setNumberPhone(rs.getString("number_phone"));
				bean.setSex(rs.getString("sex"));
				bean.setRole(rs.getInt("role"));
			    
//				userIdUpdateRole = bean.getUserId();
//				System.out.println(userIdUpdateRole);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (con != null) {
				conn.close();
			}
		}
		return bean;
	}//end
	
	// เก็บ ID USER เข้า table Personel_list
	public TestAjex updateRole() {
		TestAjex bean = new TestAjex();
		bean.setUpdateRole(userIdUpdateRole);
		return bean;
	}
	
	
	public List<PersonAddressBean>  findByIdCard1(int userId) throws SQLException {
		List<PersonAddressBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT pl.personnel_id, u.* , f.faculty_name, d.department_name , p.position_name,sp.sub_position_name ,sp.allowence ,sp.rent_date FROM personnel_list pl INNER JOIN user u on u.user_id = pl.user_id INNER JOIN department d on d.department_code = pl.department_code INNER JOIN faculty f on f.faculty_code = d.faculty_code INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code INNER JOIN position p on p.position_code = sp.position_code WHERE  pl.user_id = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setInt(1, userId);
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {
				PersonAddressBean bean = new PersonAddressBean();
				bean.setUserId(rs.getInt("user_id"));
				bean.setSex(rs.getString("sex"));
				
				bean.setFacultyName(rs.getString("faculty_name"));
				bean.setDepartmentName(rs.getString("department_name"));
				bean.setPositionName(rs.getString("position_name"));
				bean.setSubPositionName(rs.getString("sub_position_name"));
				
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
	
	//listUser
	public List<UserBean> findAll() throws SQLException {
		List<UserBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT * FROM user ORDER BY user_id ASC;");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			
			while (rs.next()) {
				UserBean bean = new UserBean();
				bean.setUserId(rs.getInt("user_id"));
				bean.setUserUsername(rs.getString("user_username"));
				bean.setUserPassword(rs.getString("user_password"));
				bean.setUserFname(rs.getString("user_fname"));
				bean.setUserLname(rs.getString("user_lname"));
				bean.setRole(rs.getInt("role"));
				bean.setSex(rs.getString("sex"));
				list.add(bean);	
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return list;
	}
	
	//addFaculty
	public List<FacultyBean> addFaculty() throws SQLException {
		List<FacultyBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT * FROM faculty ORDER BY faculty_id ASC;");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			
			while (rs.next()) {
				FacultyBean bean = new FacultyBean();
				bean.setFacultyCode(rs.getString("faculty_code"));
				bean.setFacultyId(rs.getInt("faculty_id"));
				bean.setFacultyName(rs.getString("faculty_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return list;
	}
	
	//addDepartment
	public List<DepartmentBean> addDepartment() throws SQLException {
		List<DepartmentBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT d.*,f.faculty_name FROM department d INNER JOIN faculty f ON f.faculty_code = d.faculty_code ORDER BY department_id ASC;");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			
			while (rs.next()) {
				DepartmentBean bean = new DepartmentBean();
				bean.setDepartmentCode(rs.getString("department_code"));
				bean.setDepartmentId(rs.getInt("department_id"));
				bean.setDepartmentName(rs.getString("department_name"));
				bean.setFacultyName(rs.getString("faculty_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return list;
	}

	//addDepartment
	public List<PositionBean> addPosition() throws SQLException {
		List<PositionBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT * FROM position ORDER BY position_id ASC;");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			
			while (rs.next()) {
				PositionBean bean = new PositionBean();
				bean.setPositionCode(rs.getString("position_code"));
				bean.setPositionId(rs.getInt("position_id"));
				bean.setPositionName(rs.getString("position_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return list;
	}
	
	//addDepartment
	public List<SubPositionBean> addSubPosition() throws SQLException {
		List<SubPositionBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT sp.*,p.position_name FROM sub_position sp INNER JOIN position p ON p.position_code = sp.position_code ORDER BY sub_position_id ASC;");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			
			while (rs.next()) {
				SubPositionBean bean = new SubPositionBean();
				bean.setSupPositionCode(rs.getString("sub_position_code"));
				bean.setSubPositionId(rs.getInt("sub_position_id"));
				bean.setSubPositionName(rs.getString("sub_position_name"));
				bean.setPositionName(rs.getString("position_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return list;
	}
	
	
	//insert user
	public int insertNewUser(UserBean bean) throws Exception{
		String sql = " INSERT INTO user(user_username, user_password, user_fname, user_lname, date, role, sex, number_phone)"
				+ " VALUES(?,?,?,?,?,?,?,?) ";	
			
		KeyHolder keyHolder = new GeneratedKeyHolder();
		// JdbcTemplate jdbcTemplate = new JdbcTemplate(new
		// SingleConnectionDataSource(con.openConnect(), false));
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement prepared = con.prepareStatement(sql, new String[] { "user_id" });
	
				try {
					prepared.setString(1, bean.getUserUsername());
					prepared.setString(2, bean.getUserPassword());
					prepared.setString(3, bean.getUserFname());
					prepared.setString(4, bean.getUserLname());
					prepared.setDate(5,  new Date(DateTHToEN(bean.getDateStr()).getTime()));
					prepared.setInt(6, bean.getRole());
					prepared.setString(7, bean.getSex());
					prepared.setString(8, bean.getNumberPhone());
						
				} catch (ParseException e) {
					e.printStackTrace();
				}
				return prepared;
			}
		}, keyHolder);
		userId= keyHolder.getKey().intValue();
		//System.out.println(userId);
		return keyHolder.getKey().intValue();
	}

		//insert PersonnelListBean
		public PersonnelListBean insert(PersonnelListBean bean) throws Exception{
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement prepared = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append("INSERT INTO personnel_list ( user_id, department_code, sub_position_code, create_date)"
						+ "VALUES (?,?,?,SYSDATE());");
				
				prepared = conn.prepareStatement(sql.toString());
				prepared.setInt(1, bean.getUserId());
				prepared.setString(2, bean.getDepartmentCode());
				prepared.setString(3, bean.getSubPositionCode());

				prepared.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				conn.close();
			}
			return bean;
		}//end PersonnelListBean
		
	// update user
	public UserBean update(UserBean bean) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" UPDATE user SET role = ? , user_fname = ? , user_lname = ? , number_phone = ? , sex = ? WHERE user_id = ?");
			preperd = con.openConnect().prepareStatement(sql.toString());
			preperd.setInt(1, bean.getRole());
			preperd.setString(2, bean.getUserFname());
			preperd.setString(3, bean.getUserLname());
			preperd.setString(4, bean.getNumberPhone());
			preperd.setString(5, bean.getSex());
			preperd.setInt(6, bean.getUserId());
			
			preperd.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (con != null) {
				con.openConnect().close();
			}
		}

		return bean;
	}// end method update

	// delete
//	public void delete(String id) throws SQLException {
//		ConnectDB con = new ConnectDB();
//		Connection conn = con.openConnect();
//		PreparedStatement prepared = null;
//		StringBuilder sql = new StringBuilder();
//		try {
//			sql.append(" DELETE FROM user WHERE user_id = ? ");
//			prepared = conn.prepareStatement(sql.toString());
//			prepared.setString(1, id);
//			prepared.executeUpdate();
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		finally {
//			conn.close();
//		}
//	} 
	// end method delete

	
	//check insert username ห้ามซ้ำ
	public TestAjex CheckUserName(String CheckUserId) throws SQLException {
		TestAjex bean = new TestAjex();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT * FROM user WHERE user_username = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setString(1, CheckUserId);
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {
				
				bean.setAmphur(rs.getString("user_username"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (con != null) {
				conn.close();
			}
		}
		return bean;
	}

	// เก็บ ID USER เข้า table Personel_list
	public TestAjex userId() {
		TestAjex bean = new TestAjex();
		bean.setUserId(userId);
		return bean;
	}
	
	//check insert PermissionBack ห้ามซ้ำ
	public TestAjex CheckPerBack(String CheckUserId) throws SQLException {
		TestAjex bean = new TestAjex();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT permission_id FROM permission_back WHERE permission_id = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setString(1, CheckUserId);
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {
				
				bean.setPerIdBack(rs.getString("permission_id"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (con != null) {
				conn.close();
			}
		}
		return bean;
	}
	
	
	//check insert PermissionBack ห้ามซ้ำ
		public TestAjex CheckExpenseSumaryBack(String CheckES) throws SQLException {
			TestAjex bean = new TestAjex();
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement preperd = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append(" SELECT permission_id FROM expense_sumary_back WHERE permission_id = ? ");
				preperd = conn.prepareStatement(sql.toString());
				preperd.setString(1, CheckES);
				ResultSet rs = preperd.executeQuery();

				while (rs.next()) {
					
					bean.setPerIdBack(rs.getString("permission_id"));
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				if (con != null) {
					conn.close();
				}
			}
			return bean;
		}
	
	//check permission
	public TestAjex userId(int userId) throws SQLException {
		TestAjex bean = new TestAjex();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT * FROM user WHERE user_id = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setInt(1, userId);
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {

				bean.setPerId(rs.getInt("user_id"));

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (con != null) {
				conn.close();
			}
		}
		return bean;
	}
		
	// check insert username ห้ามซ้ำ
	public UserBean user(String username) throws SQLException {
		UserBean bean = new UserBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT * FROM user WHERE user_username = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setString(1, username);
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {

				bean.setUserUsername(rs.getString("user_username"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (con != null) {
				conn.close();
			}
		}
		return bean;
	}
		

//	// FacultyName
//	String facultyName(String id) throws SQLException {
//		ConnectDB con = new ConnectDB();
//		Connection conn = con.openConnect();
//		PreparedStatement prepared = null;
//		StringBuilder sql = new StringBuilder();
//		List<FacultyBean> beanResultList = new ArrayList<>();
//		try {
//			sql.append(" SELECT * FROM faculty where faculty_id = ?");
//
//			prepared = conn.prepareStatement(sql.toString());
//			prepared.setString(1, id);
//
//			ResultSet rs = prepared.executeQuery();
//
//			while (rs.next()) {
//				FacultyBean bean = new FacultyBean();
//				bean.setFacultyName(rs.getString("faculty_name"));
//
//				beanResultList.add(bean);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			conn.close();
//		}
//		return beanResultList.get(0).getFacultyName();
//	}
//
//	// DeprtmentName
//	String departmentName(String id) throws SQLException {
//		ConnectDB con = new ConnectDB();
//		Connection conn = con.openConnect();
//		PreparedStatement prepared = null;
//		StringBuilder sql = new StringBuilder();
//		List<DepartmentBean> beanResultList = new ArrayList<>();
//		try {
//			sql.append(" SELECT * FROM department where department_id = ?");
//
//			prepared = conn.prepareStatement(sql.toString());
//			prepared.setString(1, id);
//
//			ResultSet rs = prepared.executeQuery();
//
//			while (rs.next()) {
//				DepartmentBean bean = new DepartmentBean();
//				bean.setDepartmentName(rs.getString("department_name"));
//
//				beanResultList.add(bean);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			conn.close();
//		}
//		return beanResultList.get(0).getDepartmentName();
//	}
//
//	// positionName
//	String positionName(String id) throws SQLException {
//		ConnectDB con = new ConnectDB();
//		Connection conn = con.openConnect();
//		PreparedStatement prepared = null;
//		StringBuilder sql = new StringBuilder();
//		List<PositionBean> beanResultList = new ArrayList<>();
//		try {
//			sql.append(" SELECT * FROM position where position_id = ?");
//
//			prepared = conn.prepareStatement(sql.toString());
//			prepared.setString(1, id);
//
//			ResultSet rs = prepared.executeQuery();
//
//			while (rs.next()) {
//				PositionBean bean = new PositionBean();
//				bean.setPositionName(rs.getString("position_name"));
//
//				beanResultList.add(bean);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			conn.close();
//		}
//		return beanResultList.get(0).getPositionName();
//	}
//
//	// SubPositionName
//	String subPositionName(String id) throws SQLException {
//		ConnectDB con = new ConnectDB();
//		Connection conn = con.openConnect();
//		PreparedStatement prepared = null;
//		StringBuilder sql = new StringBuilder();
//		List<SubPositionBean> beanResultList = new ArrayList<>();
//		try {
//			sql.append(" SELECT * FROM sub_position where sub_position_code = ?");
//
//			prepared = conn.prepareStatement(sql.toString());
//			prepared.setString(1, id);
//
//			ResultSet rs = prepared.executeQuery();
//
//			while (rs.next()) {
//				SubPositionBean bean = new SubPositionBean();
//				bean.setPositionCode(rs.getString("position_code"));
//				bean.setSubPositionName(rs.getString("sub_position_name"));
//				bean.setSupPositionCode(rs.getString("sub_position_code"));
//				bean.setSubPositionId(rs.getInt("position_id"));
//
//				beanResultList.add(bean);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			conn.close();
//		}
//		return beanResultList.get(0).getSubPositionName();
//	}

}
