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
	static SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd", localeEN);

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

	// show users
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

				// userIdUpdateRole = bean.getUserId();
				// System.out.println(userIdUpdateRole);
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
	}// end

	// เก็บ ID USER เข้า table Personel_list
	public TestAjex updateRole() {
		TestAjex bean = new TestAjex();
		bean.setUpdateRole(userIdUpdateRole);
		return bean;
	}

	public List<PersonAddressBean> findByIdCard1(int userId) throws SQLException {
		List<PersonAddressBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(
					" SELECT pl.personnel_id, u.* , f.faculty_name, d.department_name , p.position_name,sp.sub_position_name ,sp.allowence ,sp.rent_date "
					+ "FROM personnel_list pl " + "INNER JOIN user u on u.user_id = pl.user_id "
					+ "INNER JOIN department d on d.department_code = pl.department_code "
					+ "INNER JOIN faculty f on f.faculty_code = d.faculty_code "
					+ "INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code "
					+ "INNER JOIN position p on p.position_code = sp.position_code "
					+ "WHERE  pl.user_id = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setInt(1, userId);
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {
				PersonAddressBean bean = new PersonAddressBean();
				bean.setUserId(rs.getInt("user_id"));
				bean.setSex(rs.getString("sex"));
				bean.setPersonnelId(rs.getInt("personnel_id"));
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
	}// end
	
	public PersonAddressBean findByIdPL(int personnelId) throws SQLException {
		PersonAddressBean bean = new PersonAddressBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT pl.personnel_id, u.* , f.*, d.* , p.* ,sp.* \r\n" + 
					"FROM personnel_list pl  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id \r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code \r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code \r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code \r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code \r\n" + 
					"WHERE  pl.personnel_id = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setInt(1, personnelId);
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {
				bean.setPersonnelId(rs.getInt("personnel_id"));
				bean.setUserId(rs.getInt("user_id"));
				
				bean.setFacultyCode(rs.getString("faculty_code"));
				bean.setFacultyName(rs.getString("faculty_name"));
				bean.setDepartmentCode(rs.getString("department_code"));
				bean.setDepartmentName(rs.getString("department_name"));
				bean.setPositionCode(rs.getString("position_code"));
				bean.setPositionName(rs.getString("position_name"));
				bean.setSubPositionCode(rs.getString("sub_position_code"));
				bean.setSubPositionName(rs.getString("sub_position_name"));

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
	}// end
	
	// update user
	public PersonAddressBean updatePL(PersonAddressBean bean) throws SQLException {
			ConnectDB con = new ConnectDB();
			PreparedStatement preperd = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append(" UPDATE personnel_list SET department_code = ? , sub_position_code = ? WHERE personnel_id = ? ");
				preperd = con.openConnect().prepareStatement(sql.toString());
				preperd.setString(1, bean.getDepartmentCode());
				preperd.setString(2, bean.getSubPositionCode());
				preperd.setInt(3, bean.getPersonnelId());


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

	// listUser
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
		} finally {
			conn.close();
		}
		return list;
	}

	// addFaculty
	public List<FacultyBean> addFaculty() throws SQLException {
		List<FacultyBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT * FROM faculty ORDER BY faculty_code ASC;");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				FacultyBean bean = new FacultyBean();
				bean.setFacultyCode(rs.getString("faculty_code"));
				bean.setFacultyName(rs.getString("faculty_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list;
	}

	// addDepartment
	public List<DepartmentBean> addDepartment() throws SQLException {
		List<DepartmentBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(
					"SELECT d.*,f.faculty_name FROM department d INNER JOIN faculty f ON f.faculty_code = d.faculty_code ORDER BY department_code ASC;");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				DepartmentBean bean = new DepartmentBean();
				bean.setDepartmentCode(rs.getString("department_code"));
				bean.setDepartmentName(rs.getString("department_name"));
				bean.setFacultyName(rs.getString("faculty_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list;
	}

	// addDepartment
	public List<PositionBean> addPosition() throws SQLException {
		List<PositionBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT * FROM position ORDER BY position_code ASC;");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				PositionBean bean = new PositionBean();
				bean.setPositionCode(rs.getString("position_code"));
				bean.setPositionName(rs.getString("position_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list;
	}

	// addDepartment
	public List<SubPositionBean> addSubPosition() throws SQLException {
		List<SubPositionBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(
					"SELECT sp.*,p.position_name FROM sub_position sp INNER JOIN position p ON p.position_code = sp.position_code ORDER BY sub_position_code ASC;");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				SubPositionBean bean = new SubPositionBean();
				bean.setSupPositionCode(rs.getString("sub_position_code"));
				bean.setSubPositionName(rs.getString("sub_position_name"));
				bean.setPositionName(rs.getString("position_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list;
	}

	// insert user
	public int insertNewUser(UserBean bean) throws Exception {
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
					prepared.setDate(5, new Date(DateTHToEN(bean.getDateStr()).getTime()));
					prepared.setInt(6, bean.getRole());
					prepared.setString(7, bean.getSex());
					prepared.setString(8, bean.getNumberPhone());

				} catch (ParseException e) {
					e.printStackTrace();
				}
				return prepared;
			}
		}, keyHolder);
		userId = keyHolder.getKey().intValue();
		// System.out.println(userId);
		return keyHolder.getKey().intValue();
	}

	// insert PersonnelListBean
	public PersonnelListBean insert(PersonnelListBean bean) throws Exception {
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
		} finally {
			conn.close();
		}
		return bean;
	}// end PersonnelListBean

	// update user
	public UserBean update(UserBean bean) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(
					" UPDATE user SET role = ? , user_fname = ? , user_lname = ? , number_phone = ? , sex = ? WHERE user_id = ?");
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
	
	// update user
		public UserBean updateUser(UserBean bean) throws SQLException {
			ConnectDB con = new ConnectDB();
			PreparedStatement preperd = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append(
						" UPDATE user SET user_fname = ? , user_lname = ? , number_phone = ? , sex = ? , user_password = ? WHERE user_id = ?");
				preperd = con.openConnect().prepareStatement(sql.toString());
				preperd.setString(1, bean.getUserFname());
				preperd.setString(2, bean.getUserLname());
				preperd.setString(3, bean.getNumberPhone());
				preperd.setString(4, bean.getSex());
				preperd.setString(5, bean.getUserPassword());
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
	// public void delete(String id) throws SQLException {
	// ConnectDB con = new ConnectDB();
	// Connection conn = con.openConnect();
	// PreparedStatement prepared = null;
	// StringBuilder sql = new StringBuilder();
	// try {
	// sql.append(" DELETE FROM user WHERE user_id = ? ");
	// prepared = conn.prepareStatement(sql.toString());
	// prepared.setString(1, id);
	// prepared.executeUpdate();
	// } catch (Exception e) {
	// // TODO: handle exception
	// }
	// finally {
	// conn.close();
	// }
	// }
	// end method delete

	// check insert username ห้ามซ้ำ
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

				bean.setUserName(rs.getString("user_username"));
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

	// check insert PermissionBack ห้ามซ้ำ
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

	// check insert PermissionBack ห้ามซ้ำ
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

	// check permission
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

	// insert FacultyBean
	public int insertFacultyBean(FacultyBean bean) throws Exception {
		String sql = " INSERT INTO faculty (faculty_name)" + " VALUES(?) ";

		KeyHolder keyHolder = new GeneratedKeyHolder();
		// JdbcTemplate jdbcTemplate = new JdbcTemplate(new
		// SingleConnectionDataSource(con.openConnect(), false));
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement prepared = con.prepareStatement(sql, new String[] { "faculty_code" });

				try {
					prepared.setString(1, bean.getFacultyName());

				} catch (SQLException e) {
					e.printStackTrace();
				}
				return prepared;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}

	// update faculty
	public FacultyBean findById(String userId) throws SQLException {
		FacultyBean bean = new FacultyBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT * FROM faculty WHERE faculty_code = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setString(1, userId);
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {
				bean.setFacultyCode(rs.getString("faculty_code"));
				bean.setFacultyName(rs.getString("faculty_name"));
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
	}// end

	// update Faculty
	public void updateFaculty(FacultyBean bean) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" UPDATE faculty SET  faculty_name = ? WHERE faculty_code = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, bean.getFacultyName());
			prepared.setString(2, bean.getFacultyCode());

			prepared.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}// end method update
	
	// update Faculty
	public void updatePLUser(PersonnelListBean bean) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" UPDATE personnel_list SET  department_code = ? ,sub_position_code = ? WHERE personnel_id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, bean.getDepartmentCode());
			prepared.setString(2, bean.getSubPositionCode());
			prepared.setInt(3, bean.getPersonnelId());

			prepared.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}// end method update
	
	// update Department
	public void updateDepartment(DepartmentBean bean) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" UPDATE department SET  department_name = ?, faculty_code = ? WHERE department_code = ? ");
			prepared = conn.prepareStatement(sql.toString());
//			prepared.setString(1, bean.getFacultyName());
			prepared.setString(2, bean.getFacultyCode());
			prepared.setString(1, bean.getDepartmentName());
			prepared.setString(3, bean.getDepartmentCode());

			prepared.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}// end method update


	// insert DepartmentBean
	public int insertDepartmentBean(DepartmentBean bean) throws Exception {
		String sql = " INSERT INTO department (department_name, faculty_code) VALUES(?,?) ";

		KeyHolder keyHolder = new GeneratedKeyHolder();
		// JdbcTemplate jdbcTemplate = new JdbcTemplate(new
		// SingleConnectionDataSource(con.openConnect(), false));
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement prepared = con.prepareStatement(sql, new String[] { "department_code" });

				try {
					prepared.setString(1, bean.getDepartmentName());
					prepared.setString(2, bean.getFacultyCode());

				} catch (SQLException e) {
					e.printStackTrace();
				}
				return prepared;
			}
		}, keyHolder);

		return keyHolder.getKey().intValue();
	}
	
	// update DepartmentBean
	public DepartmentBean DepartmentByCode(String userId) throws SQLException {
		DepartmentBean bean = new DepartmentBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT * FROM department d INNER JOIN faculty f ON f.faculty_code = d.faculty_code WHERE department_code = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setString(1, userId);
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {
				bean.setDepartmentCode(rs.getString("department_code"));
				bean.setDepartmentName(rs.getString("department_name"));
				bean.setFacultyCode(rs.getString("faculty_code"));
				bean.setFacultyName(rs.getString("faculty_name"));
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
	}// end

	// insert PositionBean
	public int insertPositionBean(PositionBean bean) throws Exception {
		String sql = " INSERT INTO position (position_name)" + " VALUES(?) ";

		KeyHolder keyHolder = new GeneratedKeyHolder();
		// JdbcTemplate jdbcTemplate = new JdbcTemplate(new
		// SingleConnectionDataSource(con.openConnect(), false));
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement prepared = con.prepareStatement(sql, new String[] { "position_code" });

				try {
					prepared.setString(1, bean.getPositionName());

				} catch (SQLException e) {
					e.printStackTrace();
				}
				return prepared;
			}
		}, keyHolder);

		return keyHolder.getKey().intValue();
	}
	
	// update Position
	public void updatePosition(PositionBean bean) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" UPDATE position SET  position_name = ? WHERE position_code = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, bean.getPositionName());
			prepared.setString(2, bean.getPositionCode());

			prepared.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}// end method update
	
	// update PositionBean
	public PositionBean positionBeanByCode(String userId) throws SQLException {
		PositionBean bean = new PositionBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT * FROM position WHERE position_code = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setString(1, userId);
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {
				bean.setPositionCode(rs.getString("position_code"));
				bean.setPositionName(rs.getString("position_name"));
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
	}// end


	// insert SubPositionBean
	public int insertSubPositionBean(SubPositionBean bean) throws Exception {
		String sql = " INSERT INTO sub_position (sub_position_name, position_code, allowence, rent_date) VALUES(?,?,?,?) ";

		KeyHolder keyHolder = new GeneratedKeyHolder();
		// JdbcTemplate jdbcTemplate = new JdbcTemplate(new
		// SingleConnectionDataSource(con.openConnect(), false));
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement prepared = con.prepareStatement(sql, new String[] { "sup_position_code" });

				try {
					prepared.setString(1, bean.getSubPositionName());
					prepared.setString(2, bean.getPositionCode());
					prepared.setInt(3, bean.getAllowence());
					prepared.setInt(4, bean.getRentDate());

				} catch (SQLException e) {
					e.printStackTrace();
				}
				return prepared;
			}
		}, keyHolder);

		return keyHolder.getKey().intValue();
	}
	
	// update SubPositionBean
	public SubPositionBean subPositionByCode(String userId) throws SQLException {
		SubPositionBean bean = new SubPositionBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT * FROM sub_position sp INNER JOIN position p ON p.position_code = sp.position_code WHERE sp.sub_position_code = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setString(1, userId);
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {
				bean.setSupPositionCode(rs.getString("sub_position_code"));
				bean.setSubPositionName(rs.getString("sub_position_name"));
				bean.setAllowence(rs.getInt("allowence"));
				bean.setRentDate(rs.getInt("rent_date"));
				bean.setPositionName(rs.getString("position_code"));
				bean.setPositionCode(rs.getString("position_name"));
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
	}// end
	
	// update SubPosition
	public void updateSubPosition(SubPositionBean bean) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" UPDATE sub_position SET sub_position_name = ?, allowence = ?, rent_date = ?, position_code = ? WHERE sub_position_code = ? ");
			prepared = conn.prepareStatement(sql.toString());
//			prepared.setString(1, bean.getPositionName());
//			prepared.setString(2, bean.getPositionCode());
			prepared.setString(1, bean.getSubPositionName());
			prepared.setInt(2, bean.getAllowence());
			prepared.setInt(3, bean.getRentDate());
			prepared.setString(4, bean.getPositionCode());
			prepared.setString(5, bean.getSupPositionCode());

			prepared.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}// end method update


}
