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
					+ "allowence, allowence_perday, allowence_sum, "
					+ "rent_date, rent_date_perday, rent_date_sum , "
					+ "travel_sum ,other_sum ,expense_estimate_sum, "
					+ "create_date)"
					+ "VALUES (?,?,"
					+ "?,?,?,"
					+ "?,?,?,"
					+ "?,?,?,"
					+ "SYSDATE());");
			
			prepared = conn.prepareStatement(sql.toString());
			
			prepared.setInt(1, bean.getPersonnelId());
			prepared.setInt(2, bean.getPermissionId());

			prepared.setInt(3, bean.getAllowence());
			prepared.setInt(4, bean.getAllowencePerday());
			prepared.setInt(5, bean.getAllowenceSum());
			prepared.setInt(6, bean.getRentDate());
			prepared.setInt(7, bean.getRentDatePerday());
			prepared.setInt(8, bean.getRentDateSum());
			prepared.setInt(9, bean.getTravelSum());
			prepared.setInt(10, bean.getOtherSum());
			prepared.setInt(11, bean.getExpenseEstimateSum());		

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
	
	//insert TravelExpense รถส่วนตัว/รถประจำทาง
	public TravelExpensesFuelCostBean insert1(TravelExpensesFuelCostBean bean) throws Exception{
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("INSERT INTO travel_expenses_fuel_cost (travel_id, permission_id, "
					+ "distance, number_per, fuel_cost, divide, fuel_cost_sum, "
					+ "expressway_expenses, expressway_number_per, expressway_expenses_sum, "
					+ "sum, vehicle_c, create_date) "
					+ "VALUES(?,?,"
					+ "?,?,?,?,?,"
					+ "?,?,?,"
					+ "?,?,SYSDATE())");
			
			prepared = conn.prepareStatement(sql.toString());
			prepared.setInt(1, bean.getTravelId());
			prepared.setInt(2, bean.getPermissionId());
			
			prepared.setInt(3, bean.getDistance());
			prepared.setInt(4, bean.getNumberPer());
			prepared.setInt(5, bean.getFuelCost());
			prepared.setInt(6, bean.getDivide());
			prepared.setInt(7, bean.getFuelCostSum());
			
			prepared.setInt(8, bean.getExpresswayExpenses());
			prepared.setInt(9, bean.getExpresswayNumberPer());
			prepared.setInt(10, bean.getExpresswayExpensesSum());
			prepared.setString(11, bean.getSum());
			
			prepared.setString(12, bean.getVehicleC());

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
