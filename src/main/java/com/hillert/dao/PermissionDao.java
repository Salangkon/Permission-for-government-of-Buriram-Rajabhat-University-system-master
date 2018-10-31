package com.hillert.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Service;

import com.hillert.model.ExpenseEstimateBean;
import com.hillert.model.ExpenseSumaryBean;
import com.hillert.model.PermissionBackBean;
import com.hillert.model.PermissionBean;
import com.hillert.model.TestAjex;
import com.hillert.model.TravelExpensesBean;
import com.hillert.model.TravelExpensesFuelCostBean;
import com.hillert.util.ConnectDB;

@Service
public class PermissionDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	int permissionId;// เก็บ ID Permission

	static Locale localeTH = new Locale("th", "TH");
	static Locale localeEN = new Locale("en", "EN");
	static SimpleDateFormat formate = new SimpleDateFormat("dd-MM-yyyy", localeTH);
	static SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd", localeEN);
	
	//Java Date Thai Format
	public static java.util.Date DateTHToEN(String date) throws ParseException {
		java.util.Date response = dateformat.parse(date);
		return response;
	}
	
	// Java Date Thai Format
	public static String dateThai(String strDate) {
		String Months[] = { " มกราคม", " กุมภาพันธ์", " มีนาคม", " เมษายน", " พฤษภาคม", " มิถุนายน", " กรกฎาคม",
				" สิงหาคม", " กันยายน", " ตุลาคม", " พฤศจิกายน", " ธันวาคม" };
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		int year = 0, month = 0, day = 0;
		try {
			java.util.Date date = df.parse(strDate);
			Calendar c = Calendar.getInstance();
			c.setTime(date);

			year = c.get(Calendar.YEAR);
			month = c.get(Calendar.MONTH);
			day = c.get(Calendar.DATE);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return String.format("%s %s %s", day, "  " + Months[month] + " ", year + 543);
	}
	
	// Java Date Thai Format Day/วัน
	public static String dateThaiDay(String strDate) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		int day = 0;
		try {
			java.util.Date date = df.parse(strDate);
			Calendar c = Calendar.getInstance();
			c.setTime(date);
			day = c.get(Calendar.DATE);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return String.format("%s", day);
	}
		
	//Java Date Thai Format Month/เดือน
	public static String dateThaiMonths(String strDate)
	{
		String Months[] = {
				" มกราคม"," กุมภาพันธ์"," มีนาคม",
				" เมษายน"," พฤษภาคม"," มิถุนายน"," กรกฎาคม",
				" สิงหาคม"," กันยายน"," ตุลาคม"," พฤศจิกายน",
				" ธันวาคม"};
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
		
		int month=0;
		try {
			java.util.Date date = df.parse(strDate);
			Calendar c = Calendar.getInstance();
			c.setTime(date);  
			month = c.get(Calendar.MONTH);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return String.format("%s",  Months[month] );
	}
	
	//Java Date Thai Format Year/ปี
	public static String dateThaiYear(String strDate)
	{
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
		
		int year=0;
		try {
			java.util.Date date = df.parse(strDate);
			Calendar c = Calendar.getInstance();
			c.setTime(date);  
			year = c.get(Calendar.YEAR);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return String.format("%s", year+543);
	}
	
	
	// fromPermission
		public PermissionBean fromPermission(int userId) throws SQLException {
			PermissionBean bean = new PermissionBean();
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement preperd = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append(" SELECT dt.*, ap.AMPHUR_NAME, pv.PROVINCE_NAME, u.*, f.faculty_name, d.department_name , p.position_name,sp.sub_position_name , permission.*\r\n" + 
						"FROM Permission \r\n" + 
						"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
						"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
						"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
						"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
						"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
						"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
						"\r\n" + 
						"INNER JOIN district dt on dt.DISTRICT_ID = permission.district\r\n" + 
						"INNER JOIN amphur ap on ap.AMPHUR_ID = dt.AMPHUR_ID\r\n" + 
						"INNER JOIN province pv on pv.PROVINCE_ID = ap.PROVINCE_ID\r\n" + 
						"\r\n" + 
						"WHERE Permission_id = ? ");
				preperd = conn.prepareStatement(sql.toString());
				preperd.setInt(1, userId);
				ResultSet rs = preperd.executeQuery();

				while (rs.next()) {
					bean.setPermissionId(rs.getInt("permission_id"));
					
					bean.setUserFname(rs.getString("user_fname"));
					bean.setUserLname(rs.getString("user_lname"));
					bean.setSex(rs.getString("sex"));

					bean.setFacultyName(rs.getString("faculty_name"));
					bean.setDepartmentName(rs.getString("department_name"));
					bean.setPositionName(rs.getString("position_name"));
					bean.setSubPositionName(rs.getString("sub_position_name"));
					
					bean.setDateDay(dateThaiDay(rs.getString("date")));
					bean.setDateMonth(dateThaiMonths(rs.getString("date")));
					bean.setDateYear(dateThaiYear(rs.getString("date")));
					
					bean.setGoDateDay(dateThaiDay(rs.getString("go_date")));
					bean.setGoDateMonth(dateThaiMonths(rs.getString("go_date")));
					bean.setGoDateYear(dateThaiYear(rs.getString("go_date")));
					
					bean.setBackDateDay(dateThaiDay(rs.getString("back_date")));
					bean.setBackDateMonth(dateThaiMonths(rs.getString("back_date")));
					bean.setBackDateYear(dateThaiYear(rs.getString("back_date")));
					
					bean.setPurpose(rs.getString("purpose"));
					bean.setPurpose1(rs.getString("purpose1"));
					bean.setPurpose2(rs.getString("purpose2"));
					bean.setStatus(rs.getString("status"));
					bean.setObject(rs.getString("object"));

					bean.setDestinationName(rs.getString("destination_name"));
					bean.setProvince(rs.getString("PROVINCE_NAME"));
					bean.setAmphur(rs.getString("AMPHUR_NAME"));
					bean.setDistrict(rs.getString("DISTRICT_NAME"));
					bean.setDistrictId(rs.getString("DISTRICT_id"));
					
					bean.setGoDate((rs.getString("go_date")));
					bean.setGoTime(rs.getString("go_time"));
					bean.setBackDate((rs.getString("back_date")));
					bean.setBackTime(rs.getString("back_time"));

					bean.setBudget(rs.getString("budget"));
					bean.setBudgetExpenses(rs.getString("budget_expenses"));
					bean.setBudgetBy(rs.getString("budget_by"));
					bean.setBudgetProject(rs.getString("budget_project"));
					bean.setBudgetPass(rs.getString("budget_pass"));

					bean.setTravel(rs.getString("travel"));
					bean.setTravelIdcard(rs.getString("travel_idcard"));

					bean.setCommitA(rs.getString("commit_a"));
					bean.setCommitADt(rs.getString("commit_a_dt"));
					bean.setCommitB(rs.getString("commit_b"));
					bean.setCommitBDt(rs.getString("commit_b_dt"));
					bean.setCommitC(rs.getString("commit_c"));
					bean.setCommitCDt(rs.getString("commit_c_dt"));
					bean.setCommitD(rs.getString("commit_d"));
					bean.setCommitDDt(rs.getString("commit_d_dt"));
					
					bean.setPersonnelId(rs.getInt("personnel_id"));
					bean.setTopics(rs.getString("topics"));
					bean.setOther(rs.getString("other"));
					bean.setOtherC(rs.getString("other_c"));
					permissionId = bean.getPermissionId();	

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
	
		// fromPermission
		public PermissionBackBean fromPermissionBack(int userId) throws SQLException {
			PermissionBackBean bean = new PermissionBackBean();
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement preperd = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append(" SELECT dt.DISTRICT_NAME,ap.AMPHUR_NAME,pv.PROVINCE_NAME,pb.*\r\n" + 
						"FROM permission_back pb\r\n" + 
						"INNER JOIN district dt on dt.DISTRICT_ID = pb.district\r\n" + 
						"INNER JOIN amphur ap on ap.AMPHUR_ID = dt.AMPHUR_ID\r\n" + 
						"INNER JOIN province pv on pv.PROVINCE_ID = ap.PROVINCE_ID"
						+ " WHERE Permission_id = ? ");
				preperd = conn.prepareStatement(sql.toString());
				preperd.setInt(1, userId);
				ResultSet rs = preperd.executeQuery();

				while (rs.next()) {
					bean.setPermissionId(rs.getInt("permission_id"));
					
					bean.setProvinceName(rs.getString("PROVINCE_NAME"));
					bean.setAmphurName(rs.getString("AMPHUR_NAME"));
					bean.setDistrictName(rs.getString("DISTRICT_NAME"));

					bean.setbSaveDateDay(dateThaiDay(rs.getString("b_save_date")));
					bean.setbSaveDateMonth(dateThaiMonths(rs.getString("b_save_date")));
					bean.setbSaveDateYear(dateThaiYear(rs.getString("b_save_date")));
					
					bean.setbByOrderSave(rs.getString("b_by_order_save"));
					
					bean.setbDateAuthorized(dateThai(rs.getString("b_date_authorized")));
					bean.setbDateAuthorizedDay(dateThaiDay(rs.getString("b_date_authorized")));
					bean.setbDateAuthorizedDay(dateThaiMonths(rs.getString("b_date_authorized")));
					bean.setbDateAuthorizedDay(dateThaiYear(rs.getString("b_date_authorized")));
					
					bean.setbDisbursedBy(rs.getInt("b_disbursed_by"));
					bean.setbAllowenceType(rs.getInt("b_allowence_type"));
					bean.setbRentDateType(rs.getInt("b_rent_date_type"));
					bean.setbStartTravel(rs.getInt("b_start_travel"));
					bean.setbBackTravel(rs.getInt("b_back_travel"));
					
					bean.setbHouseNumber(rs.getString("b_house_number"));
					bean.setbRoad(rs.getString("b_road"));
					
					bean.setbGoDate(rs.getString("b_go_date"));
					bean.setbGoDateDay(dateThaiDay(rs.getString("b_go_date")));
					bean.setbGoDateMonth(dateThaiMonths(rs.getString("b_go_date")));
					bean.setbGoDateYear(dateThaiYear(rs.getString("b_go_date")));
					bean.setbGoTime(rs.getString("b_go_time"));
					
					bean.setbBackDate(rs.getString("b_back_date"));
					bean.setbBackDateDay(dateThaiDay(rs.getString("b_back_date")));
					bean.setbBackDateMonth(dateThaiMonths(rs.getString("b_back_date")));
					bean.setbBackDateYear(dateThaiYear(rs.getString("b_back_date")));
					bean.setbBackTime(rs.getString("b_back_time"));
					
					bean.setbDaySum(rs.getString("b_date_sum"));
					bean.setbTimeSum(rs.getString("b_time_sum"));
					
					bean.setbBenefitRecord(rs.getString("b_benefit_record"));
					bean.setbBenefitCourses(rs.getString("b_benefit_courses"));
					bean.setbBenefitUse(rs.getString("b_benefit_use"));
					
					bean.setChoiceBill1(rs.getString("choice_bill1"));
					bean.setChoiceBill2(rs.getString("choice_bill2"));
					bean.setChoiceBill3(rs.getString("choice_bill3"));
					bean.setChoiceBill4(rs.getString("choice_bill4"));
					bean.setChoiceBill5(rs.getString("choice_bill5"));
					bean.setChoiceBill6(rs.getString("choice_bill6"));
					bean.setChoiceBill7(rs.getString("choice_bill7"));
					bean.setChoiceBill7C(rs.getString("choice_bill7_c"));

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

	// insert Permission and getPermission_id
	public int insertPermission(PermissionBean bean) {
		String sql = "INSERT INTO permission (personnel_id, district, purpose, purpose1, purpose2,"
				+ "topics, status, object, destination_name,"
				+ "go_date, go_time, back_date, back_time,"
				+ "budget, budget_expenses, budget_by, budget_project, budget_pass,"
				+ "travel, travel_idcard, commit_a, commit_a_dt,"
				+ "commit_b, commit_b_dt, commit_c, commit_c_dt, commit_d, commit_d_dt," 
				+ "other, other_c, permission_status, create_date)"
				+ " VALUES (?,?,?,?,?" 
				+ ",?,?,?,?" 
				+ ",?,?,?,?" 
				+ ",?,?,?,?,?" 
				+ ",?,?,?,?" 
				+ ",?,?,?,?,?,?"
				+ ",?,?,'0',SYSDATE())";
				
		KeyHolder keyHolder = new GeneratedKeyHolder();
		// JdbcTemplate jdbcTemplate = new JdbcTemplate(new
		// SingleConnectionDataSource(con.openConnect(), false));
		jdbcTemplate.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement prepared = con.prepareStatement(sql, new String[] { "permission_id" });
				try {
					prepared.setInt(1, bean.getPersonnelId());
					prepared.setString(2, bean.getDistrict());
					
					prepared.setString(3, bean.getPurpose());
					prepared.setString(4, bean.getPurpose1());
					prepared.setString(5, bean.getPurpose2());
					prepared.setString(6, bean.getTopics());
					
					prepared.setString(7, bean.getStatus());
					prepared.setString(8, bean.getObject());
					prepared.setString(9, bean.getDestinationName());
					
					prepared.setDate(10, new Date(DateTHToEN(bean.getGoDate()).getTime()));
					prepared.setString(11, bean.getGoTime());
					prepared.setDate(12, new Date(DateTHToEN(bean.getBackDate()).getTime()));
					prepared.setString(13, bean.getBackTime());
					
					prepared.setString(14, bean.getBudget());
					prepared.setString(15, bean.getBudgetExpenses());
					prepared.setString(16, bean.getBudgetBy());
					prepared.setString(17, bean.getBudgetProject());
					prepared.setString(18, bean.getBudgetPass());
					
					prepared.setString(19, bean.getTravel());
					prepared.setString(20, bean.getTravelIdcard());
					
					prepared.setString(21, bean.getCommitA());
					prepared.setString(22, bean.getCommitADt());
					prepared.setString(23, bean.getCommitB());
					prepared.setString(24, bean.getCommitBDt());
					prepared.setString(25, bean.getCommitC());
					prepared.setString(26, bean.getCommitCDt());
					prepared.setString(27, bean.getCommitD());
					prepared.setString(28, bean.getCommitDDt());

					prepared.setString(29, bean.getOther());
					prepared.setString(30, bean.getOtherC());
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
				return prepared;
			}
		}, keyHolder);
		permissionId = keyHolder.getKey().intValue();
		// System.out.println(permissionId);
		return keyHolder.getKey().intValue();
	}

	// permissionId
	public TestAjex perId() {
		TestAjex bean = new TestAjex();
		bean.setPerId(permissionId);
		return bean;
	}
	
	
	// insert PermissionBean Back บันทึกหลังเดินทางกลับราชการ
	public PermissionBackBean insertPBTest(PermissionBackBean bean) throws Exception {
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("INSERT INTO permission_back (permission_id, b_by_order_save, b_date_authorized, b_disbursed_by, b_allowence_type, "
						+ " b_rent_date_type, b_start_travel, b_back_travel, b_house_number ,b_road ,"
						+ " district, b_go_date ,b_go_time, b_back_date, b_back_time, "
						+ " b_save_date , b_date_sum, b_time_sum, b_benefit_record, b_benefit_courses, b_benefit_use, "
						+ " choice_bill1, choice_bill2, choice_bill3, choice_bill4, choice_bill5, choice_bill6, choice_bill7, choice_bill7_c )"
						+ "VALUES (?,?,?,?,?,"
						+ "?,?,?,?,?,"
						+ "?,?,?,?,?,"
						+ "?,?,?,?,?,"
						+ "?,?,?,?,?,"
						+ "?,?,?,?)");

			prepared = conn.prepareStatement(sql.toString());

			prepared.setInt(1, bean.getPermissionId());
			prepared.setString(2, bean.getbByOrderSave());
			prepared.setString(3, bean.getbDateAuthorized());
			prepared.setInt(4, bean.getbDisbursedBy());
			prepared.setInt(5, bean.getbAllowenceType());
			prepared.setInt(6, bean.getbRentDateType());
			prepared.setInt(7, bean.getbStartTravel());
			prepared.setInt(8, bean.getbBackTravel());
			prepared.setString(9, bean.getbHouseNumber());
			prepared.setString(10, bean.getbRoad());
			prepared.setString(11, bean.getDistrict());
			prepared.setString(12, bean.getbGoDate());
			prepared.setString(13, bean.getbGoTime());
			prepared.setString(14, bean.getbBackDate());
			prepared.setString(15, bean.getbBackTime());
			prepared.setString(16, bean.getbSaveDate());
			prepared.setString(17, bean.getbDaySum());
			prepared.setString(18, bean.getbTimeSum());
			
			prepared.setString(19, bean.getbBenefitRecord());
			prepared.setString(20, bean.getbBenefitCourses());
			prepared.setString(21, bean.getbBenefitUse());
			
			prepared.setString(22, bean.getChoiceBill1());
			prepared.setString(23, bean.getChoiceBill2());
			prepared.setString(24, bean.getChoiceBill3());
			prepared.setString(25, bean.getChoiceBill4());
			prepared.setString(26, bean.getChoiceBill5());
			prepared.setString(27, bean.getChoiceBill6());
			prepared.setString(28, bean.getChoiceBill7());
			prepared.setString(29, bean.getChoiceBill7C());

			prepared.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}// end
	
	// update permissiom_status
	public PermissionBean updateStatusPermission(PermissionBean bean) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("UPDATE permission p SET p.permission_status = '1' WHERE p.permission_id = ?");
			preperd = con.openConnect().prepareStatement(sql.toString());
			preperd.setInt(1, bean.getPermissionId());

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
	
	// update checkID permission By ExpenseEstimateBean
			public List<ExpenseEstimateBean> PermissionBackEE(int userId) throws SQLException {
				List<ExpenseEstimateBean> list = new ArrayList<>();
				ConnectDB con = new ConnectDB();
				Connection conn = con.openConnect();
				PreparedStatement preperd = null;
				StringBuilder sql = new StringBuilder();
				
				try {
					sql.append(" SELECT u.sex, u.user_fname, u.user_lname, sp.sub_position_name, ee.*\r\n" + 
							"FROM expense_estimate ee\r\n" + 
							"INNER JOIN personnel_list pl  on pl.personnel_id = ee.personnel_id\r\n" + 
							"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
							"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
							"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
							"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
							"INNER JOIN position p on p.position_code = sp.position_code WHERE Permission_id = ? ");
					preperd = conn.prepareStatement(sql.toString());
					preperd.setInt(1, userId);
					ResultSet rs = preperd.executeQuery();

					while (rs.next()) {
						ExpenseEstimateBean bean = new ExpenseEstimateBean();
						// ExpenseEstimate
						bean.setPermissionId(rs.getInt("permission_id"));
						bean.setPersonnelId(rs.getInt("personnel_id"));
						bean.setSex(rs.getString("sex"));
						bean.setUserFname(rs.getString("user_fname"));
						bean.setUserLname(rs.getString("user_lname"));
						bean.setSubPositionName(rs.getString("sub_position_name"));
						bean.setAllowenceType(rs.getInt("allowence_type"));
						
						bean.setAllowence(rs.getInt("allowence"));
						bean.setAllowencePerday(rs.getInt("allowence_perday"));
						bean.setAllowenceSum(rs.getInt("allowence_sum"));
						
						bean.setRentDate(rs.getInt("rent_date"));
						bean.setRentDatePerday(rs.getInt("rent_date_perday"));
						bean.setRentDateSum(rs.getInt("rent_date_sum"));
						
						bean.setTravelSum(rs.getInt("travel_sum"));
						
						bean.setOtherSum(rs.getInt("other_sum"));
						
						bean.setExpenseEstimateSum(rs.getInt("expense_estimate_sum"));

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
			}
	
	// update checkID permission By ExpenseEstimateBean
		public List<ExpenseEstimateBean> findByIdExpenseEstimate(int userId) throws SQLException {
			List<ExpenseEstimateBean> list = new ArrayList<>();
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement preperd = null;
			StringBuilder sql = new StringBuilder();
			
			try {
				sql.append(" SELECT u.sex, u.user_fname, u.user_lname, sp.sub_position_name, ee.*\r\n" + 
						"FROM expense_estimate ee\r\n" + 
						"INNER JOIN personnel_list pl  on pl.personnel_id = ee.personnel_id\r\n" + 
						"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
						"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
						"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
						"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
						"INNER JOIN position p on p.position_code = sp.position_code WHERE Permission_id = ? ");
				preperd = conn.prepareStatement(sql.toString());
				preperd.setInt(1, userId);
				ResultSet rs = preperd.executeQuery();
				DecimalFormat myFormatter = new DecimalFormat();
				while (rs.next()) {
					ExpenseEstimateBean bean = new ExpenseEstimateBean();
					// ExpenseEstimate
					bean.setPermissionId(rs.getInt("permission_id"));
					bean.setPersonnelId(rs.getInt("personnel_id"));
					bean.setSex(rs.getString("sex"));
					bean.setUserFname(rs.getString("user_fname"));
					bean.setUserLname(rs.getString("user_lname"));
					bean.setSubPositionName(rs.getString("sub_position_name"));
					bean.setAllowenceTypeComma(myFormatter.format(rs.getInt("allowence_type")));
					
					bean.setAllowenceComma(myFormatter.format(rs.getInt("allowence")));
					bean.setAllowencePerdayComma(myFormatter.format(rs.getInt("allowence_perday")));
					bean.setAllowenceSumComma(myFormatter.format(rs.getInt("allowence_sum")));
					
					bean.setRentDateComma(myFormatter.format(rs.getInt("rent_date")));
					bean.setRentDatePerdayComma(myFormatter.format(rs.getInt("rent_date_perday")));
					bean.setRentDateSumComma(myFormatter.format(rs.getInt("rent_date_sum")));
					
					bean.setTravelSumComma(myFormatter.format(rs.getInt("travel_sum")));
					
					bean.setOtherSumComma(myFormatter.format(rs.getInt("other_sum")));
					
					bean.setExpenseEstimateSumComma(myFormatter.format(rs.getInt("expense_estimate_sum")));

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
		}
		
	// update checkID permission By ExpenseEstimateBean
	public List<ExpenseEstimateBean> findByIdExpenseEstimateBack(int userId) throws SQLException {
		List<ExpenseEstimateBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT u.sex, u.user_fname, u.user_lname, sp.sub_position_name, ee.*\r\n" + 
					"FROM expense_estimate_back ee\r\n" + 
					"INNER JOIN personnel_list pl  on pl.personnel_id = ee.personnel_id\r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code WHERE Permission_id = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setInt(1, userId);
			ResultSet rs = preperd.executeQuery();
			DecimalFormat myFormatter = new DecimalFormat();
			while (rs.next()) {
				ExpenseEstimateBean bean = new ExpenseEstimateBean();
				// ExpenseEstimate
				bean.setPermissionId(rs.getInt("permission_id"));
				bean.setPersonnelId(rs.getInt("personnel_id"));
				bean.setSex(rs.getString("sex"));
				bean.setUserFname(rs.getString("user_fname"));
				bean.setUserLname(rs.getString("user_lname"));
				bean.setSubPositionName(rs.getString("sub_position_name"));
				bean.setAllowenceType(rs.getInt("b_allowence_type"));
				
				bean.setAllowence(rs.getInt("b_allowence"));
				bean.setAllowencePerday(rs.getInt("b_allowence_perday"));
				bean.setAllowenceSum(rs.getInt("b_allowence_sum"));
				
				bean.setRentDate(rs.getInt("b_rent_date"));
				bean.setRentDatePerday(rs.getInt("b_rent_date_perday"));
				bean.setRentDateSum(rs.getInt("b_rent_date_sum"));
				
				bean.setTravelSum(rs.getInt("b_travel_sum"));
				
				bean.setOtherSum(rs.getInt("b_other_sum"));

				bean.setExpenseEstimateSum(rs.getInt("b_expense_estimate_sum"));

				bean.setAllowenceComma(myFormatter.format(rs.getInt("b_allowence")));
				bean.setAllowencePerdayComma(myFormatter.format(rs.getInt("b_allowence_perday")));
				bean.setAllowenceSumComma(myFormatter.format(rs.getInt("b_allowence_sum")));
				
				bean.setRentDateComma(myFormatter.format(rs.getInt("b_rent_date")));
				bean.setRentDatePerdayComma(myFormatter.format(rs.getInt("b_rent_date_perday")));
				bean.setRentDateSumComma(myFormatter.format(rs.getInt("b_rent_date_sum")));
				
				bean.setTravelSumComma(myFormatter.format(rs.getInt("b_travel_sum")));
				
				bean.setOtherSumComma(myFormatter.format(rs.getInt("b_other_sum")));

				bean.setExpenseEstimateSumComma(myFormatter.format(rs.getInt("b_expense_estimate_sum")));

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
	}
	
	// update checkID TravelExpensesFuelCostBean
		public TravelExpensesFuelCostBean findByIdTEFC(int userId) throws SQLException {
			TravelExpensesFuelCostBean bean = new TravelExpensesFuelCostBean();
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement preperd = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append(" SELECT tefc.travel_id ,t.vehicle_name ,tefc.teoc_distance ,tefc.teoc_number_per ,tefc.teoc_fuel_cost ,tefc.teoc_rate_fuel_cost "
						+ ",tefc.teoc_fuel_cost_sum ,tefc.teoc_expressway_expenses_sum ,tefc.teoc_sum ,tefc.teoc_vehicle_c "
						+ "FROM travel_expenses_official_car tefc  INNER JOIN travel t on t.travel_id = tefc.travel_id WHERE Permission_id = ? ");
				preperd = conn.prepareStatement(sql.toString());
				preperd.setInt(1, userId);
				ResultSet rs = preperd.executeQuery();
				DecimalFormat myFormatter = new DecimalFormat();
				while (rs.next()) {
//					bean.setPermissionId(rs.getInt("permission_id"));
					bean.setTravelId(rs.getInt("travel_id"));		
					bean.setDistance(rs.getInt("teoc_distance"));	//ระยะทาง
					bean.setNumberPer(rs.getInt("teoc_number_per"));	//จำนวน/ต่อ
					bean.setFuelCost(rs.getInt("teoc_fuel_cost"));	//ค่าเชื้อเพลิง
					bean.setRateFuelCost(rs.getInt("teoc_rate_fuel_cost"));		//หาร
					bean.setFuelCostSum(rs.getInt("teoc_fuel_cost_sum")); //รวมค่าเชื้อเพลิง
					bean.setFuelCostSumComma(myFormatter.format(rs.getInt("teoc_fuel_cost_sum"))); //รวมค่าเชื้อเพลิง
					bean.setExpresswayExpensesSum(rs.getInt("teoc_expressway_expenses_sum"));  //รวมค่าทางด่วน
					bean.setExpresswayExpensesSumComma(myFormatter.format(rs.getInt("teoc_expressway_expenses_sum"))); //รวม
					
					bean.setSum(rs.getString("teoc_sum")); //รวม
					bean.setVehicleC(rs.getString("teoc_vehicle_c")); //หมายเหตุ
					bean.setVehicleName(rs.getString("vehicle_name")); //หมายเหตุ
//					permissionId = bean.getPermissionId();
					

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
	
	// ExpenseSumaryBean
	public ExpenseSumaryBean findByEs(int userId) throws SQLException {
		ExpenseSumaryBean bean = new ExpenseSumaryBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT * FROM expense_sumary WHERE Permission_id = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setInt(1, userId);
			ResultSet rs = preperd.executeQuery();
			DecimalFormat myFormatter = new DecimalFormat();
			
			while (rs.next()) {
				bean.setPermissionId(rs.getInt("permission_id"));

				bean.setUserSumTotalComma(myFormatter.format(rs.getInt("user_sum_total")));
				bean.setAllowenceSumTotalComma(myFormatter.format(rs.getInt("allowence_sum_total")));
				bean.setAllowencePerdayTotalComma(myFormatter.format(rs.getFloat("allowence_perday_total")));
				bean.setRentDateSumTotalComma(myFormatter.format(rs.getInt("rent_date_sum_total")));
				bean.setRentDatePerdayTotalComma(myFormatter.format(rs.getFloat("rent_date_perday_total")));
				bean.setTravelSumTotalComma(myFormatter.format(rs.getInt("travel_sum_total")));
				bean.setOtherSumTotalComma(myFormatter.format(rs.getInt("other_sum_total")));
				bean.setExpenseEstimateSumTotalComma(myFormatter.format(rs.getInt("expense_estimate_sum_total")));
				
				bean.setUserSumTotal(rs.getInt("user_sum_total"));
				bean.setAllowenceSumTotal(rs.getInt("allowence_sum_total"));
				bean.setAllowencePerdayTotal(rs.getFloat("allowence_perday_total"));
				bean.setRentDateSumTotal(rs.getInt("rent_date_sum_total"));
				bean.setRentDatePerdayTotal(rs.getFloat("rent_date_perday_total"));
				bean.setTravelSumTotal(rs.getInt("travel_sum_total"));
				bean.setOtherSumTotal(rs.getInt("other_sum_total"));
				bean.setExpenseEstimateSumTotal(rs.getInt("expense_estimate_sum_total"));
				
				permissionId = bean.getPermissionId();

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
	}// end ES
	
	// PermissionBackEs
		public ExpenseSumaryBean PermissionBackEs(int userId) throws SQLException {
			ExpenseSumaryBean bean = new ExpenseSumaryBean();
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement preperd = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append(" SELECT * FROM expense_sumary WHERE Permission_id = ? ");
				preperd = conn.prepareStatement(sql.toString());
				preperd.setInt(1, userId);
				ResultSet rs = preperd.executeQuery();
				
				while (rs.next()) {
					bean.setPermissionId(rs.getInt("permission_id"));

					bean.setUserSumTotal(rs.getInt("user_sum_total"));
					bean.setAllowenceSumTotal(rs.getInt("allowence_sum_total"));
					bean.setAllowencePerdayTotal(rs.getFloat("allowence_perday_total"));
					bean.setRentDateSumTotal(rs.getInt("rent_date_sum_total"));
					bean.setRentDatePerdayTotal(rs.getFloat("rent_date_perday_total"));
					bean.setTravelSumTotal(rs.getInt("travel_sum_total"));
					bean.setOtherSumTotal(rs.getInt("other_sum_total"));
					bean.setExpenseEstimateSumTotal(rs.getInt("expense_estimate_sum_total"));
					
					permissionId = bean.getPermissionId();

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
		}// end PermissionBackEs

	private static final String[] SCALE_TH = { "ล้าน", "สิบ", "ร้อย", "พัน", "หมื่น", "แสน", "" };
    private static final String[] DIGIT_TH = { "ศูนย์", "หนึ่ง", "สอง", "สาม", "สี่", "ห้า", "หก", "เจ็ด", "แปด", "เก้า" };
    private static final String[] SYMBOLS_TH = { "ลบ", "บาท", "ถ้วน", "สตางค์" ,"ยี่", "เอ็ด", ",", " ", "฿"};
 
    private String valueText;
 
    // ···········Methods··············//
    public String getText(double amount) {
        BigDecimal value = new BigDecimal(amount);
        this.valueText = getThaiBaht(value);
        return this.valueText;
    }
 
    public String getText(float amount) {
        BigDecimal value = new BigDecimal(amount);
        this.valueText = getThaiBaht(value);
        return this.valueText;
    }
 
    public String getText(int amount) {
        BigDecimal value = new BigDecimal(amount);
        this.valueText = getThaiBaht(value);
        return this.valueText;
    }
 
    public String getText(long amount) {
        BigDecimal value = new BigDecimal(amount);
        this.valueText = getThaiBaht(value);
        return this.valueText;
    }
 
    public String getText(String amount) {
        //ไม่ต้องการเครื่องหมายคอมมาร์, ไม่ต้องการช่องว่าง, ไม่ต้องการตัวหนังสือ บาท, ไม่ต้องการสัญลักษณ์สกุลเงินบาท
        for (String element : SYMBOLS_TH) {
            amount = amount.replace (element, "");
        }
 
        BigDecimal value = new BigDecimal(amount.trim());
        this.valueText = getThaiBaht(value);
        return this.valueText;
    }
 
    public String getText(Number amount) {
        BigDecimal value = new BigDecimal(String.valueOf(amount));
        this.valueText = getThaiBaht(value);
        return this.valueText;
    }
 
    private static String getThaiBaht(BigDecimal amount) {
        StringBuilder builder = new StringBuilder();
        BigDecimal absolute = amount.abs();
        int precision = absolute.precision();
        int scale = absolute.scale();
        int rounded_precision = ((precision - scale) + 2);
        MathContext mc = new MathContext(rounded_precision,RoundingMode.HALF_UP);
        BigDecimal rounded = absolute.round(mc);
        BigDecimal[] compound = rounded.divideAndRemainder(BigDecimal.ONE);
        boolean negative_amount = (-1 == amount.compareTo(BigDecimal.ZERO));
 
        compound[0] = compound[0].setScale(0);
        compound[1] = compound[1].movePointRight(2);
 
        if (negative_amount) {
            builder.append(SYMBOLS_TH[0].toString());
        }
 
        builder.append(getNumberText(compound[0].toBigIntegerExact()));
        builder.append(SYMBOLS_TH[1].toString());
 
        if (0 == compound[1].compareTo(BigDecimal.ZERO)) {
            builder.append(SYMBOLS_TH[2].toString());
        } else {
            builder.append(getNumberText(compound[1].toBigIntegerExact()));
            builder.append(SYMBOLS_TH[3].toString());
        }
        return builder.toString();
    }
    
    private static String getNumberText(BigInteger number) {
        StringBuffer buffer = new StringBuffer();
        char[] digits = number.toString().toCharArray();
 
        for (int index = digits.length; index > 0; --index) {
            int digit = Integer.parseInt(String.valueOf(digits[digits.length
                    - index]));
            String digit_text = DIGIT_TH[digit];
            int scale_idx = ((1 < index) ? ((index - 1) % 6) : 6);
 
            if ((1 == scale_idx) && (2 == digit)) {
                digit_text = SYMBOLS_TH[4].toString();
            }
 
            if (1 == digit) {
                switch (scale_idx) {
                case 0:
                case 6:
                    buffer.append((index < digits.length) ? SYMBOLS_TH[5].toString() : digit_text);
                    break;
                case 1:
                    break;
                default:
                    buffer.append(digit_text);
                    break;
                }
            } else if (0 == digit) {
                if (0 == scale_idx) {
                    buffer.append(SCALE_TH[scale_idx]);
                }
                continue;
            } else {
                buffer.append(digit_text);
            }
            buffer.append(SCALE_TH[scale_idx]);
        }
        return buffer.toString();
    }
	
	
	
	// ExpenseSumaryBack
	public ExpenseSumaryBean findByEsBack(int userId) throws SQLException {
		ExpenseSumaryBean bean = new ExpenseSumaryBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT * FROM expense_sumary_back WHERE Permission_id = ? ");
			preperd = conn.prepareStatement(sql.toString());
			preperd.setInt(1, userId);
			ResultSet rs = preperd.executeQuery();
			DecimalFormat myFormatter = new DecimalFormat();
			while (rs.next()) {
				bean.setPermissionId((rs.getInt("permission_id")));

				bean.setUserSumTotal(rs.getInt("b_user_sum_total"));
				bean.setAllowenceSumTotal(rs.getInt("b_allowence_sum_total"));
				bean.setAllowencePerdayTotal(rs.getFloat("b_allowence_perday_total"));
				bean.setRentDateSumTotal(rs.getInt("b_rent_date_sum_total"));
				bean.setRentDatePerdayTotal(rs.getFloat("b_rent_date_perday_total"));
				bean.setTravelSumTotal(rs.getInt("b_travel_sum_total"));
				bean.setOtherSumTotal(rs.getInt("b_other_sum_total"));
				bean.setExpenseEstimateSumTotal(rs.getInt("b_expense_estimate_sum_total"));
				bean.setExpenseEstimateSumTotalThaiBaht(getText(rs.getString("b_expense_estimate_sum_total")));
				permissionId = bean.getPermissionId();
				
				bean.setUserSumTotalComma(myFormatter.format(rs.getInt("b_user_sum_total")));
				bean.setAllowenceSumTotalComma(myFormatter.format(rs.getInt("b_allowence_sum_total")));
				bean.setAllowencePerdayTotalComma(myFormatter.format(rs.getFloat("b_allowence_perday_total")));
				bean.setRentDateSumTotalComma(myFormatter.format(rs.getInt("b_rent_date_sum_total")));
				bean.setRentDatePerdayTotalComma(myFormatter.format(rs.getFloat("b_rent_date_perday_total")));
				bean.setTravelSumTotalComma(myFormatter.format(rs.getInt("b_travel_sum_total")));
				bean.setOtherSumTotalComma(myFormatter.format(rs.getInt("b_other_sum_total")));
				bean.setExpenseEstimateSumTotalComma(myFormatter.format(rs.getInt("b_expense_estimate_sum_total")));

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
	}// end ExpenseSumaryBack
	
	// update Permission
	public void update(PermissionBean bean) throws Exception {
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("UPDATE permission SET faculty=? ,department=? ,position=? ,sub_position= ? ,"
					+ "status=? ,object=? ,destination_name=? ,province=? ,amphur=? ,"
					+ "district=? ,go_date=? ,go_time=? ,back_date=? ,back_time=? ,"
					+ "budget=? ,budget_expenses=? ,budget_by=? ,budget_project=? ,budget_pass=? ,"
					+ "travel=? ,travel_idcard=? ,commit_a=? ,commit_a_dt=? ,"
					+ "commit_b=? ,commit_b_dt=? ,commit_c=? ,commit_c_dt=? ,commit_d=? ,"
					+ "commit_d_dt=? WHERE permission_id = ?;");
			prepared = conn.prepareStatement(sql.toString());
			// prepared.setString(1, bean.getName());
			prepared.setString(1, bean.getFacultyName());
			prepared.setString(2, bean.getDepartmentName());
			prepared.setString(3, bean.getPositionName());
			prepared.setString(4, bean.getSubPositionName());
			prepared.setString(5, bean.getStatus());
			prepared.setString(6, bean.getObject());
			prepared.setString(7, bean.getDestinationName());
			prepared.setString(8, bean.getProvince());
			prepared.setString(9, bean.getAmphur());
			prepared.setString(10, bean.getDistrict());
			prepared.setDate(11, new Date(DateTHToEN(bean.getGoDate()).getTime()));
			prepared.setString(12, bean.getGoTime());
			prepared.setDate(13, new Date(DateTHToEN(bean.getBackDate()).getTime()));
			prepared.setString(14, bean.getBackTime());
			prepared.setString(15, bean.getBudget());
			prepared.setString(16, bean.getBudgetExpenses());
			prepared.setString(17, bean.getBudgetBy());
			prepared.setString(18, bean.getBudgetProject());
			prepared.setString(19, bean.getBudgetPass());
			prepared.setString(20, bean.getTravel());
			prepared.setString(21, bean.getTravelIdcard());
			prepared.setString(22, bean.getCommitA());
			prepared.setString(23, bean.getCommitADt());
			prepared.setString(24, bean.getCommitB());
			prepared.setString(25, bean.getCommitBDt());
			prepared.setString(26, bean.getCommitC());
			prepared.setString(27, bean.getCommitCDt());
			prepared.setString(28, bean.getCommitD());
			prepared.setString(29, bean.getCommitDDt());

			// prepared.setString(32, bean.getCreateBy());

			prepared.setInt(31, bean.getPermissionId());
			
			prepared.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			if (con != null) {
				conn.close();
			}
		}
		}

	// update checkID permission By TravelExpensesBean
	public List<TravelExpensesBean> findByIdTravel(int userId) throws SQLException {
		List<TravelExpensesBean> list = new ArrayList<>();
//		List<TravelBean> listTrave = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT t.travel_id,t.vehicle_name,ts.number_per,ts.travel_expenses,ts.user_sum,ts.sum,ts.vehicle_c "
					+ "FROM travel_expenses ts LEFT JOIN travel t  ON t.travel_id  = ts.travel_id "
					+ "WHERE ts.permission_id = ? ");
				
			preperd = conn.prepareStatement(sql.toString());
			preperd.setInt(1, userId);
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {
				TravelExpensesBean bean = new TravelExpensesBean();
				bean.setTravelId(rs.getInt("travel_id"));
				bean.setVehicleName(rs.getString("vehicle_name"));
				bean.setNumberPer(rs.getInt("number_per"));
				bean.setTravelExpenses(rs.getInt("travel_expenses"));
				bean.setUserSum(rs.getInt("user_sum"));
				bean.setSum(rs.getInt("sum"));
				bean.setVehicleC(rs.getString("vehicle_c"));
				
//				TravelBean beanTravel = new TravelBean();
//				beanTravel.setId(rs.getInt("id"));
//				beanTravel.setTravel(rs.getString("travel"));
				
//				listTrave.add(beanTravel);
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
	}
	public List<TravelExpensesBean> findByIdTravel2() throws SQLException {
		List<TravelExpensesBean> list = new ArrayList<>();
//		List<TravelBean> listTrave = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement preperd = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("select   t.travel_id, t.vehicle_name , null as number_per,null as travel_expenses,null as user_sum,null as sum from travel t " + 
					"LEft JOIN travel_expenses te on  t.travel_id = te.travel_expenses WHERE t.travel_id  = 1 or t.travel_id = 2 or t.travel_id = 3 or t.travel_id = 4 or t.travel_id = 5");
				
			preperd = conn.prepareStatement(sql.toString());
			ResultSet rs = preperd.executeQuery();

			while (rs.next()) {
//				TravelExpensesBean bean = new TravelExpensesBean();
//				bean.setId(rs.getInt("id"));
//				bean.setTravel(rs.getString("travel"));
//				bean.setNumberPer(rs.getInt("number_per"));
//				bean.setTravelExpenses(rs.getInt("travel_expenses"));
//				bean.setUserSum(rs.getInt("user_sum"));
//				bean.setSum(rs.getInt("sum"));
//				bean.setVehicleC(rs.getString("vehicle_c"));
				
				TravelExpensesBean beanTravel = new TravelExpensesBean();
				beanTravel.setTravelId(rs.getInt("travel_id"));
				beanTravel.setVehicleName(rs.getString("vehicle_name"));
				
				list.add(beanTravel);
//				list.add(bean);
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
	}

	// listUser By user
	public List<PermissionBean> findByPerId(int personnelId) throws SQLException {
		List<PermissionBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT dt.DISTRICT_NAME, ap.AMPHUR_NAME, pv.PROVINCE_NAME, u.sex, u.user_fname, \r\n" + 
					"u.user_lname, u.date, f.faculty_name, d.department_name , p.position_name,sp.sub_position_name , \r\n" + 
					"permission.*, es.expense_estimate_sum_total\r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id \r\n" + 
					"INNER JOIN expense_sumary es on es.permission_id = permission.permission_id\r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code	\r\n" + 
					"INNER JOIN district dt on dt.DISTRICT_ID = permission.district\r\n" + 
					"INNER JOIN amphur ap on ap.AMPHUR_ID = dt.AMPHUR_ID\r\n" + 
					"INNER JOIN province pv on pv.PROVINCE_ID = ap.PROVINCE_ID\r\n" + 
					"WHERE u.user_id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setInt(1, personnelId);
			ResultSet rs = prepared.executeQuery();
			DecimalFormat myFormatter = new DecimalFormat();
			while (rs.next()) {
				PermissionBean bean = new PermissionBean();
				bean.setPermissionId(rs.getInt("permission_id"));
				bean.setPermissionStatus(rs.getString("permission_status"));
				
				bean.setUserFname(rs.getString("user_fname"));
				bean.setUserLname(rs.getString("user_lname"));
				bean.setSex(rs.getString("sex"));

				bean.setFacultyName(rs.getString("faculty_name"));
				bean.setDepartmentName(rs.getString("department_name"));
				bean.setPositionName(rs.getString("position_name"));
				bean.setSubPositionName(rs.getString("sub_position_name"));
				bean.setDate(dateThai(rs.getString("date")));
				
				bean.setPurpose(rs.getString("purpose"));
				bean.setPurpose1(rs.getString("purpose1"));
				bean.setPurpose2(rs.getString("purpose2"));
				bean.setStatus(rs.getString("status"));
				bean.setObject(rs.getString("object"));

				bean.setDestinationName(rs.getString("destination_name"));
				bean.setProvince(rs.getString("PROVINCE_NAME"));
				bean.setAmphur(rs.getString("AMPHUR_NAME"));
				bean.setDistrict(rs.getString("DISTRICT_NAME"));

				bean.setGoDate(dateThai(rs.getString("go_date")));
				bean.setGoTime(rs.getString("go_time"));
				bean.setBackDate(dateThai(rs.getString("back_date")));
				bean.setBackTime(rs.getString("back_time"));

				bean.setBudget(rs.getString("budget"));
				bean.setBudgetExpenses(rs.getString("budget_expenses"));
				bean.setBudgetBy(rs.getString("budget_by"));
				bean.setBudgetProject(rs.getString("budget_project"));
				bean.setBudgetPass(rs.getString("budget_pass"));

				bean.setTravel(rs.getString("travel"));
				bean.setTravelIdcard(rs.getString("travel_idcard"));

				bean.setCommitA(rs.getString("commit_a"));
				bean.setCommitADt(rs.getString("commit_a_dt"));
				bean.setCommitB(rs.getString("commit_b"));
				bean.setCommitBDt(rs.getString("commit_b_dt"));
				bean.setCommitC(rs.getString("commit_c"));
				bean.setCommitCDt(rs.getString("commit_c_dt"));
				bean.setCommitD(rs.getString("commit_d"));
				bean.setCommitDDt(rs.getString("commit_d_dt"));
				
				bean.setPersonnelId(rs.getInt("personnel_id"));
				bean.setTopics(rs.getString("topics"));
				bean.setOther(rs.getString("other"));
				
				bean.setExpenseEstimateSumTotalComma(myFormatter.format(rs.getInt("expense_estimate_sum_total")));
				
				list.add(bean);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list;
	}

	// listUser
	public List<PermissionBean> findAll() throws SQLException {
		List<PermissionBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT dt.DISTRICT_NAME, ap.AMPHUR_NAME, pv.PROVINCE_NAME, "
					+ "u.user_fname, u.user_lname, u.sex, u.date, f.faculty_name, d.department_name , p.position_name,sp.sub_position_name , "
					+ "permission.*, es.expense_estimate_sum_total\r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" +
					"INNER JOIN expense_sumary es on es.permission_id = permission.permission_id\r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
					"\r\n" + 
					"INNER JOIN district dt on dt.DISTRICT_ID = permission.district\r\n" + 
					"INNER JOIN amphur ap on ap.AMPHUR_ID = dt.AMPHUR_ID\r\n" + 
					"INNER JOIN province pv on pv.PROVINCE_ID = ap.PROVINCE_ID");
			prepared = conn.prepareStatement(sql.toString());

			ResultSet rs = prepared.executeQuery();
			DecimalFormat myFormatter = new DecimalFormat();
			while (rs.next()) {
				PermissionBean bean = new PermissionBean();
				bean.setPermissionId(rs.getInt("permission_id"));
				bean.setPermissionStatus(rs.getString("permission_status"));
				
				bean.setUserFname(rs.getString("user_fname"));
				bean.setUserLname(rs.getString("user_lname"));
				bean.setSex(rs.getString("sex"));

				bean.setFacultyName(rs.getString("faculty_name"));
				bean.setDepartmentName(rs.getString("department_name"));
				bean.setPositionName(rs.getString("position_name"));
				bean.setSubPositionName(rs.getString("sub_position_name"));
				bean.setDate(dateThai(rs.getString("date")));
				
				bean.setPurpose(rs.getString("purpose"));
				bean.setPurpose1(rs.getString("purpose1"));
				bean.setPurpose2(rs.getString("purpose2"));
				bean.setStatus(rs.getString("status"));
				bean.setObject(rs.getString("object"));

				bean.setDestinationName(rs.getString("destination_name"));
				bean.setProvince(rs.getString("PROVINCE_NAME"));
				bean.setAmphur(rs.getString("AMPHUR_NAME"));
				bean.setDistrict(rs.getString("DISTRICT_NAME"));

				bean.setGoDate(dateThai(rs.getString("go_date")));
				bean.setGoTime(rs.getString("go_time"));
				bean.setBackDate(dateThai(rs.getString("back_date")));
				bean.setBackTime(rs.getString("back_time"));

				bean.setBudget(rs.getString("budget"));
				bean.setBudgetExpenses(rs.getString("budget_expenses"));
				bean.setBudgetBy(rs.getString("budget_by"));
				bean.setBudgetProject(rs.getString("budget_project"));
				bean.setBudgetPass(rs.getString("budget_pass"));

				bean.setTravel(rs.getString("travel"));
				bean.setTravelIdcard(rs.getString("travel_idcard"));

				bean.setCommitA(rs.getString("commit_a"));
				bean.setCommitADt(rs.getString("commit_a_dt"));
				bean.setCommitB(rs.getString("commit_b"));
				bean.setCommitBDt(rs.getString("commit_b_dt"));
				bean.setCommitC(rs.getString("commit_c"));
				bean.setCommitCDt(rs.getString("commit_c_dt"));
				bean.setCommitD(rs.getString("commit_d"));
				bean.setCommitDDt(rs.getString("commit_d_dt"));
				
				bean.setPersonnelId(rs.getInt("personnel_id"));
				bean.setTopics(rs.getString("topics"));
				bean.setOther(rs.getString("other"));
				
				bean.setExpenseEstimateSumTotalComma(myFormatter.format(rs.getInt("expense_estimate_sum_total")));
				
				list.add(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list;
	}
	

	// provineName
//	String provineName(String id) throws SQLException {
//		ConnectDB con = new ConnectDB();
//		Connection conn = con.openConnect();
//		PreparedStatement prepared = null;
//		StringBuilder sql = new StringBuilder();
//		List<ProvinceBean> beanResultList = new ArrayList<>();
//		try {
//			sql.append(" SELECT * FROM province where province_id = ?");
//
//			prepared = conn.prepareStatement(sql.toString());
//			prepared.setString(1, id);
//
//			ResultSet rs = prepared.executeQuery();
//
//			while (rs.next()) {
//				ProvinceBean bean = new ProvinceBean();
//				bean.setProvinceName(rs.getString("province_name"));
//
//				beanResultList.add(bean);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			conn.close();
//		}
//		return beanResultList.get(0).getProvinceName();
//	}
//
//	// districtName
//	String districtName(String id) throws SQLException {
//		ConnectDB con = new ConnectDB();
//		Connection conn = con.openConnect();
//		PreparedStatement prepared = null;
//		StringBuilder sql = new StringBuilder();
//		List<DistrictBean> beanResultList = new ArrayList<>();
//		try {
//			sql.append(" SELECT * FROM district where district_id = ?");
//
//			prepared = conn.prepareStatement(sql.toString());
//			prepared.setString(1, id);
//
//			ResultSet rs = prepared.executeQuery();
//
//			while (rs.next()) {
//				DistrictBean bean = new DistrictBean();
//				bean.setDistrictName(rs.getString("district_name"));
//
//				beanResultList.add(bean);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			conn.close();
//		}
//		return beanResultList.get(0).getDistrictName();
//	}
//
//	// amphurName
//	String amphurName(String id) throws SQLException {
//		ConnectDB con = new ConnectDB();
//		Connection conn = con.openConnect();
//		PreparedStatement prepared = null;
//		StringBuilder sql = new StringBuilder();
//		List<AmphurBean> beanResultList = new ArrayList<>();
//		try {
//			sql.append(" SELECT * FROM amphur where amphur_id = ?");
//
//			prepared = conn.prepareStatement(sql.toString());
//			prepared.setString(1, id);
//
//			ResultSet rs = prepared.executeQuery();
//
//			while (rs.next()) {
//				AmphurBean bean = new AmphurBean();
//				bean.setAmphurName(rs.getString("amphur_name"));
//
//				beanResultList.add(bean);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			conn.close();
//		}
//		return beanResultList.get(0).getAmphurName();
//	}
//	
//	//FacultyName
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
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		finally {
//			conn.close();
//		}
//		return beanResultList.get(0).getFacultyName();
//	}
//	
//	//DeprtmentName
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
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		finally {
//			conn.close();
//		}
//		return beanResultList.get(0).getDepartmentName();
//	}
//	
//	//positionName
//		String positionName(String id) throws SQLException {
//			ConnectDB con = new ConnectDB();
//			Connection conn = con.openConnect();
//			PreparedStatement prepared = null;
//			StringBuilder sql = new StringBuilder();
//			List<PositionBean> beanResultList = new ArrayList<>();
//			try {
//				sql.append(" SELECT * FROM position where position_id = ?");
//				
//				prepared = conn.prepareStatement(sql.toString());
//				prepared.setString(1, id);
//
//				ResultSet rs = prepared.executeQuery();
//				
//				while (rs.next()) {
//					PositionBean bean = new PositionBean();
//					bean.setPositionName(rs.getString("position_name"));
//
//					beanResultList.add(bean);
//				}
//				
//			}catch (Exception e) {
//				e.printStackTrace();
//			}
//			finally {
//				conn.close();
//			}
//			return beanResultList.get(0).getPositionName();
//		}
//	
//	//SubPositionName
//	String subPositionName(String id) throws SQLException {
//		ConnectDB con = new ConnectDB();
//		Connection conn = con.openConnect();
//		PreparedStatement prepared = null;
//		StringBuilder sql = new StringBuilder();
//		List<SubPositionBean> beanResultList = new ArrayList<>();
//			try {
//					sql.append(" SELECT * FROM sub_position where sub_position_id = ?");
//						
//					prepared = conn.prepareStatement(sql.toString());
//					prepared.setString(1, id);
//
//					ResultSet rs = prepared.executeQuery();
//						
//					while (rs.next()) {
//					SubPositionBean bean = new SubPositionBean();
//					bean.setSubPositionName(rs.getString("sub_position_name"));
//
//					beanResultList.add(bean);
//				}
//						
//			}catch (Exception e) {
//				e.printStackTrace();
//			}
//			finally {
//				conn.close();
//			}
//				return beanResultList.get(0).getSubPositionName();
//		}

}
