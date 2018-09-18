package com.hillert.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hillert.dao.ExpenseEstimateDao;
import com.hillert.dao.LoginDao;
import com.hillert.dao.PermissionDao;
import com.hillert.model.ExpenseEstimateBean;
import com.hillert.model.PermissionBean;
import com.hillert.model.TestAjex;
import com.hillert.model.TravelBean;
import com.hillert.model.TravelExpensesBean;
import com.hillert.model.TravelExpensesFuelCostBean;

@RestController
public class FormRestController {
	@Autowired
	PermissionDao perDao;
	@Autowired
	LoginDao loginDao;
	@Autowired
	ExpenseEstimateDao EEDao;
	
	// Show dataTable ExpenseEstimateBean By Permission
	@RequestMapping(path = "/ExpenseByPermission")
	public List<ExpenseEstimateBean> expenseEstimateBean(String permissionId) throws SQLException{
		TestAjex perId = new TestAjex();
		perId = perDao.perId();
//		System.out.println(perId);
		 List<ExpenseEstimateBean> listPer = new ArrayList<>();
		 listPer = perDao.findByIdExpenseEstimate(perId.getPerId());
		
		return listPer;
	}
	
	// Show dataTable TravelExpensesBean By Permission
	@RequestMapping(path = "/TravelByPermission")
	public List<TravelExpensesBean> travelExpensesBean(String permissionId) throws SQLException{
		TestAjex perId = new TestAjex();
		perId = perDao.perId();
		
		 List<TravelExpensesBean> listTravel = new ArrayList<>();
		 listTravel = perDao.findByIdTravel(perId.getPerId());
		
		return listTravel;
	}
	
	// Show dataTable TravelExpensesBean By Permission
	@RequestMapping(path = "/TravelExpensesFuelCostByPermission")
	public TravelExpensesFuelCostBean travelExpensesFuelCostBean(String permissionId) throws SQLException{
		TestAjex perId = new TestAjex();
		perId = perDao.perId();
		
		 TravelExpensesFuelCostBean travelFuelCost = new TravelExpensesFuelCostBean();
		 travelFuelCost = perDao.findByIdTEFC(perId.getPerId());
		
		return travelFuelCost;
	}
	
	//List PermissionBean
	@RequestMapping(value="/permission")
	public List<PermissionBean> per() throws SQLException{
		List<PermissionBean> list = new ArrayList<>();
		list = perDao.findAll();
		
		return list;
	}
	
	//List PermissionBean
	@RequestMapping(value="/tablePermissionUser")
	public List<PermissionBean> perCreate(String createBy) throws SQLException{
		TestAjex id = new TestAjex();
		id=loginDao.userId();
		
		List<PermissionBean> list = new ArrayList<>();
		list = perDao.findByPerId(id.getUserID());

		return list;
	}
	
	// พาหนะ รถประจำทาง
	@RequestMapping(value = "/travel")
	public List<TravelBean> TravelBean() throws SQLException {
		List<TravelBean> list = new ArrayList<>();
		list = EEDao.travel();

		return list;
	}

	// พาหนะ รถไปราชการ และ รถประจำตัว
	@RequestMapping(value = "/travel1")
	public List<TravelBean> TravelBean1() throws SQLException {
		List<TravelBean> list = new ArrayList<>();
		list = EEDao.travel1();

		return list;
	}
	
	
}
