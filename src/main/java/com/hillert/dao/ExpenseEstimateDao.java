package com.hillert.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hillert.model.ExpenseEstimateBean;
import com.hillert.model.ExpenseSumaryBean;
import com.hillert.model.TravelBean;
import com.hillert.model.TravelExpensesBean;
import com.hillert.model.TravelExpensesFuelCostBean;
import com.hillert.util.ConnectDB;


@Service
public class ExpenseEstimateDao {
	
	//insert ExpenseEstimate
	public ExpenseEstimateBean insert(ExpenseEstimateBean bean) throws Exception{
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("INSERT INTO expense_estimate (personnel_id, permission_id,"
					+ "allowence_type, allowence, allowence_perday, allowence_sum, "
					+ "rent_date, rent_date_perday, rent_date_sum , "
					+ "travel_sum ,other_sum ,expense_estimate_sum, "
					+ "create_date)"
					+ "VALUES (?,?,"
					+ "?,?,?,?,"
					+ "?,?,?,"
					+ "?,?,?,"
					+ "SYSDATE());");
			
			prepared = conn.prepareStatement(sql.toString());
			
			prepared.setInt(1, bean.getPersonnelId());
			prepared.setInt(2, bean.getPermissionId());
			prepared.setInt(3, bean.getAllowenceType());
			prepared.setInt(4, bean.getAllowence());
			prepared.setInt(5, bean.getAllowencePerday());
			prepared.setInt(6, bean.getAllowenceSum());
			prepared.setInt(7, bean.getRentDate());
			prepared.setInt(8, bean.getRentDatePerday());
			prepared.setInt(9, bean.getRentDateSum());
			prepared.setInt(10, bean.getTravelSum());
			prepared.setInt(11, bean.getOtherSum());
			prepared.setInt(12, bean.getExpenseEstimateSum());		

			prepared.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return bean;
	}//end
	
	//insert ExpenseSumaryBean
		public ExpenseSumaryBean insert2(ExpenseSumaryBean bean) throws Exception{
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement prepared = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append("INSERT INTO expense_sumary (user_sum_total, allowence_sum_total, rent_date_sum_total,travel_sum_total, other_sum_total, expense_estimate_sum_total,"
						+ "allowence_perday_total,  rent_date_perday_total, "
						+ "allowence_details, rent_date_details, "
						+ "permission_id , create_date)"
						+ "VALUES (?,?,?,?,?,?, "
						+ "?,?, "
						+ "?,?, "
						+ "?,SYSDATE());");
				
				prepared = conn.prepareStatement(sql.toString());
				
				prepared.setString(1, bean.getUserSumTotal());
				prepared.setString(2, bean.getAllowenceSumTotal());
				prepared.setString(3, bean.getRentDateSumTotal());
				prepared.setString(4, bean.getTravelSumTotal());
				prepared.setString(5, bean.getOtherSumTotal());
				prepared.setString(6, bean.getExpenseEstimateSumTotal());
				
				prepared.setString(7, bean.getAllowencePerdayTotal());
				prepared.setString(8, bean.getRentDatePerdayTotal());
				
				prepared.setString(9, bean.getAllowenceDetails());
				prepared.setString(10, bean.getRentDateDetails());

				prepared.setInt(11, bean.getPermissionId());
				
				prepared.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				conn.close();
			}
			return bean;
		}//end
	
	//insert ExpenseEstimate Back บันทึกหลังเดินทางกลับราชการ
	public ExpenseEstimateBean insertEEB(ExpenseEstimateBean bean) throws Exception{
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("INSERT INTO expense_estimate_back (personnel_id, permission_id,"
					+ "b_allowence_type, b_allowence, b_allowence_perday, b_allowence_sum, "
					+ "b_rent_date, b_rent_date_perday, b_rent_date_sum , "
					+ "b_travel_sum ,b_other_sum ,b_expense_estimate_sum, "
					+ "b_create_date)"
					+ "VALUES (?,?,"
					+ "?,?,?,?,"
					+ "?,?,?,"
					+ "?,?,?,"
					+ "SYSDATE());");
			
			prepared = conn.prepareStatement(sql.toString());
			
			prepared.setInt(1, bean.getPersonnelId());
			prepared.setInt(2, bean.getPermissionId());
			prepared.setInt(3, bean.getAllowenceType());
			prepared.setInt(4, bean.getAllowence());
			prepared.setInt(5, bean.getAllowencePerday());
			prepared.setInt(6, bean.getAllowenceSum());
			prepared.setInt(7, bean.getRentDate());
			prepared.setInt(8, bean.getRentDatePerday());
			prepared.setInt(9, bean.getRentDateSum());
			prepared.setInt(10, bean.getTravelSum());
			prepared.setInt(11, bean.getOtherSum());
			prepared.setInt(12, bean.getExpenseEstimateSum());		

			prepared.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return bean;
	}//end
	
	//insert ExpenseSumaryBean บันทึกผลรวมหลังเดินทางกลับจารราชการ
		public ExpenseSumaryBean insertESB(ExpenseSumaryBean bean) throws Exception{
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement prepared = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append("INSERT INTO expense_sumary_back (b_user_sum_total, b_allowence_perday_total, b_rent_date_perday_total, b_travel_sum_total, b_other_sum_total, b_expense_estimate_sum_total, "
						+ "b_allowence_sum_total, b_rent_date_sum_total,"
						+ "permission_id , b_create_date)"
						+ "VALUES (?,?,?,?,?,?,"
						+ "?,?,"
						+ "?,SYSDATE());");
				
				prepared = conn.prepareStatement(sql.toString());
				
				prepared.setString(1, bean.getUserSumTotal());
				prepared.setString(2, bean.getAllowenceSumTotal());
				prepared.setString(3, bean.getRentDateSumTotal());
				prepared.setString(4, bean.getTravelSumTotal());
				prepared.setString(5, bean.getOtherSumTotal());
				prepared.setString(6, bean.getExpenseEstimateSumTotal());
				
				prepared.setString(7, bean.getAllowencePerdayTotal());
				prepared.setString(8, bean.getRentDatePerdayTotal());

				prepared.setInt(9, bean.getPermissionId());
				
				prepared.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				conn.close();
			}
			return bean;
		}//end
	
	
	
	//insert TravelExpense รถประจำทาง
	public TravelExpensesBean insert(TravelExpensesBean bean) throws Exception{
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("INSERT INTO travel_expenses (permission_id, travel_id, "
					+ "number_per, travel_expenses, user_sum, sum, vehicle_c, create_date) "
					+ "VALUES(?,?,"
					+ "?,?,?,?,?,SYSDATE())");
			
			prepared = conn.prepareStatement(sql.toString());
			prepared.setInt(1, bean.getPermissionId());
			prepared.setInt(2, bean.getTravelId());

			prepared.setInt(3, bean.getNumberPer());
			prepared.setInt(4, bean.getTravelExpenses());
			prepared.setInt(5, bean.getUserSum());
			prepared.setInt(6, bean.getSum());
			prepared.setString(7, bean.getVehicleC());
	
			prepared.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return bean;
	}//end
	
	//insert TravelExpense รถประจำทาง
	public TravelExpensesFuelCostBean OfficialCar(TravelExpensesFuelCostBean bean) throws Exception{
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("INSERT INTO travel_expenses_official_car (travel_id, permission_id, "
					+ "teoc_distance, teoc_number_per, teoc_fuel_cost, teoc_rate_fuel_cost, teoc_fuel_cost_sum, "
					+ "teoc_expressway_expenses_sum, teoc_sum, "
					+ "teoc_vehicle_c, teoc_create_date) "
					+ "VALUES(?,?,"
					+ "?,?,?,?,?,"
					+ "?,?,"
					+ "?,SYSDATE())");
			
			prepared = conn.prepareStatement(sql.toString());
			prepared.setInt(1, bean.getTravelId());
			prepared.setInt(2, bean.getPermissionId());
			
			prepared.setInt(3, bean.getDistance());
			prepared.setInt(4, bean.getNumberPer());
			prepared.setInt(5, bean.getFuelCost());
			prepared.setInt(6, bean.getRateFuelCost());
			prepared.setInt(7, bean.getFuelCostSum());
			
			prepared.setInt(8, bean.getExpresswayExpensesSum());
			prepared.setString(9, bean.getSum());
			
			prepared.setString(10, bean.getVehicleC());

			prepared.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return bean;
	}//end
	
	//insert TravelExpense รถส่วนตัว
		public TravelExpensesFuelCostBean privateCar(TravelExpensesFuelCostBean bean) throws Exception{
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement prepared = null;
			StringBuilder sql = new StringBuilder();

			try {
				sql.append("INSERT INTO travel_expenses_private_car (travel_id, permission_id, "
						+ "tepc_distance, tepc_number_per, tepc_rate_fuel_cost, tepc_fuel_cost_sum, "
						+ "tepc_expressway_expenses_sum, tepc_sum, "
						+ "tepc_vehicle_c, tepc_create_date) "
						+ "VALUES(?,?,"
						+ "?,?,?,?,"
						+ "?,?,"
						+ "?,SYSDATE())");
				
				prepared = conn.prepareStatement(sql.toString());
				prepared.setInt(1, bean.getTravelId());
				prepared.setInt(2, bean.getPermissionId());
				
				prepared.setInt(3, bean.getDistance());
				prepared.setInt(4, bean.getNumberPer());
				prepared.setInt(5, bean.getRateFuelCost());
				prepared.setInt(6, bean.getFuelCostSum());
	
				prepared.setInt(7, bean.getExpresswayExpensesSum());
				prepared.setString(8, bean.getSum());
				
				prepared.setString(9, bean.getVehicleC());

				prepared.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				conn.close();
			}
			return bean;
		}//end
	
	//Travel พาหนะรถประจำทาง
	public List<TravelBean> travel() throws SQLException {
		TravelBean bean = new TravelBean();
		List<TravelBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT * from travel WHERE travel.travel_id = 1 or travel.travel_id = 2 or travel.travel_id = 3 or travel.travel_id = 4 or travel.travel_id = 5 ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean = new TravelBean();
				bean.setTravelId(rs.getInt("travel_id"));
				bean.setVehicleName(rs.getString("vehicle_name"));

				list.add(bean);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			conn.close();
		}
		return list;
	}
		//Travel พาหนะ รถไปราชการ รถส่วนตัว
	public List<TravelBean> travel1() throws SQLException {
		TravelBean bean = new TravelBean();
		List<TravelBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT * from travel WHERE travel.travel_id = 6");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean = new TravelBean();
				bean.setTravelId(rs.getInt("travel_id"));
				bean.setVehicleName(rs.getString("vehicle_name"));
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
