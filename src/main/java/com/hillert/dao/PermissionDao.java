package com.hillert.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
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
		
	//Java Date Thai Format
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
	
	//Java Date Thai Format
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
		return String.format("%s %s %s", day, " เดือน  " + Months[month] + " พ.ศ. ", year + 543);
	}
	
	// update checkID permission
		public PermissionBean findByIdPer(int userId) throws SQLException {
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

//					bean.setGoDate(dateThai(rs.getString("go_date")));
//					bean.setGoTime(rs.getString("go_time"));
//					bean.setBackDate(dateThai(rs.getString("back_date")));
//					bean.setBackTime(rs.getString("back_time"));
					
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
					permissionId = bean.getPermissionId();	
					perIdBack = bean.getPermissionId();	
//					System.out.println(permissionId);
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
		int perIdBack;
		// permissionId
		public TestAjex perIdBack() {
			TestAjex bean = new TestAjex();
			bean.setPerIdBack(permissionId);
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
				+ "other, create_date)"
				+ " VALUES (?,?,?,?,?" 
				+ ",?,?,?,?" 
				+ ",?,?,?,?" 
				+ ",?,?,?,?,?" 
				+ ",?,?,?,?" 
				+ ",?,?,?,?,?,?"
				+ ",?,SYSDATE())";
				
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
	
	//insert PermissionBean Back บันทึกหลังเดินทางกลับราชการ
		public PermissionBackBean insertPB(PermissionBackBean bean) throws Exception{
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement prepared = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append("INSERT INTO permission_back (permission_id, b_by_order_save, b_date_authorized, b_disbursed_by, b_allowence_type, "
						+ "b_rent_date_type, b_start_travel, b_back_travel, b_house_number ,b_road ,"
						+ "district, b_go_date ,b_go_time, b_back_date, b_back_time, "
						+ "b_day_total ,b_time_total )VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				
				prepared = conn.prepareStatement(sql.toString());
				
				prepared.setInt(1, bean.getPermissionId());
				prepared.setString(2, bean.getbByOrderSave());
				prepared.setString(3, bean.getbDateAuthorized());
				prepared.setInt(4, bean.getbDisbursedBy());
				prepared.setInt(5, bean.getbAllowenceType());
				prepared.setInt(6, bean.getbRentDateType());
				prepared.setInt(7, bean.getbStartTravel());
				prepared.setInt(8, bean.getbBackTravel());
				prepared.setInt(9, bean.getbHouseNumber());
				prepared.setString(10, bean.getbRoad());
				prepared.setString(11, bean.getDistrict());
				prepared.setString(12, bean.getbGoDate());
				prepared.setString(13, bean.getbGoTime());
				prepared.setString(14, bean.getbBackDate());
				prepared.setString(15, bean.getbBackTime());
				prepared.setInt(16, bean.getbDayTotal());
				prepared.setInt(17, bean.getbTimeTotal());
				
				prepared.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				conn.close();
			}
			return bean;
		}//end


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

			while (rs.next()) {
				ExpenseEstimateBean bean = new ExpenseEstimateBean();
				// ExpenseEstimate
				bean.setPermissionId(rs.getInt("permission_id"));
				bean.setPersonnelId(rs.getInt("personnel_id"));
				bean.setSex(rs.getString("sex"));
				bean.setUserFname(rs.getString("user_fname"));
				bean.setUserLname(rs.getString("user_lname"));
				bean.setSubPositionName(rs.getString("sub_position_name"));
				
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
	
	// update checkID TravelExpensesFuelCostBean
		public TravelExpensesFuelCostBean findByIdTEFC(int userId) throws SQLException {
			TravelExpensesFuelCostBean bean = new TravelExpensesFuelCostBean();
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement preperd = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append(" SELECT tefc.travel_id ,t.vehicle_name ,tefc.distance ,tefc.number_per ,tefc.fuel_cost ,tefc.divide "
						+ ",tefc.fuel_cost_sum ,tefc.expressway_expenses ,tefc.expressway_number_per ,tefc.expressway_expenses_sum"
						+ ",tefc.sum  ,tefc.vehicle_c "
						+ "FROM travel_expenses_fuel_cost tefc  INNER JOIN travel t on t.travel_id = tefc.travel_id WHERE Permission_id = ? ");
				preperd = conn.prepareStatement(sql.toString());
				preperd.setInt(1, userId);
				ResultSet rs = preperd.executeQuery();

				while (rs.next()) {
//					bean.setPermissionId(rs.getInt("permission_id"));
					bean.setTravelId(rs.getInt("travel_id"));		
					bean.setDistance(rs.getInt("distance"));	//ระยะทาง
					bean.setNumberPer(rs.getInt("number_per"));	//จำนวน/ต่อ
					bean.setFuelCost(rs.getInt("fuel_cost"));	//ค่าเชื้อเพลิง
					bean.setDivide(rs.getInt("divide"));		//หาร
					bean.setFuelCostSum(rs.getInt("fuel_cost_sum")); //รวมค่าเชื้อเพลิง
					bean.setExpresswayExpenses(rs.getInt("expressway_expenses")); //ค่าทางด่วน
					bean.setExpresswayNumberPer(rs.getInt("expressway_number_per")); //ค่าทางด่วน จำนวน/ต่อ
					bean.setExpresswayExpensesSum(rs.getInt("expressway_expenses_sum"));  //รวมค่าทางด่วน
					
					bean.setSum(rs.getString("sum")); //รวม
					bean.setVehicleC(rs.getString("vehicle_c")); //หมายเหตุ
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

			while (rs.next()) {
				bean.setPermissionId(rs.getInt("permission_id"));

				bean.setUserSumTotal(rs.getString("user_sum_total"));
				bean.setAllowenceSumTotal(rs.getString("allowence_sum_total"));
				bean.setRentDateSumTotal(rs.getString("rent_date_sum_total"));
				bean.setTravelSumTotal(rs.getString("travel_sum_total"));
				bean.setOtherSumTotal(rs.getString("other_sum_total"));
				bean.setExpenseEstimateSumTotal(rs.getString("expense_estimate_sum_total"));
				
				bean.setAllowenceDetails(rs.getString("allowence_details"));
				bean.setRentDateDetails(rs.getString("rent_date_details"));
				
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
			sql.append(" SELECT dt.DISTRICT_NAME, ap.AMPHUR_NAME, pv.PROVINCE_NAME, u.user_fname, u.user_lname, u.date, f.faculty_name, d.department_name , p.position_name,sp.sub_position_name , permission.*\r\n" + 
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
					"INNER JOIN province pv on pv.PROVINCE_ID = ap.PROVINCE_ID"
					+ " WHERE u.user_id = ?");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setInt(1, personnelId);
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				PermissionBean bean = new PermissionBean();
				bean.setPermissionId(rs.getInt("permission_id"));
				
				bean.setUserFname(rs.getString("user_fname"));
				bean.setUserLname(rs.getString("user_lname"));

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
			sql.append(" SELECT dt.DISTRICT_NAME, ap.AMPHUR_NAME, pv.PROVINCE_NAME, u.user_fname, u.user_lname, u.sex, u.date, f.faculty_name, d.department_name , p.position_name,sp.sub_position_name , permission.*\r\n" + 
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
					"INNER JOIN province pv on pv.PROVINCE_ID = ap.PROVINCE_ID");
			prepared = conn.prepareStatement(sql.toString());

			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				PermissionBean bean = new PermissionBean();
				bean.setPermissionId(rs.getInt("permission_id"));
				
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
				
				list.add(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list;
	}
	
	
	// นับจำนวนใบฟอร์ม ที่ขออนุญาตไปราชการทั้งหมด
	public PermissionBean count() throws SQLException {
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
