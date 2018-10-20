package com.hillert.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hillert.dao.ExpenseEstimateDao;
import com.hillert.dao.LoginDao;
import com.hillert.dao.PermissionDao;
import com.hillert.dao.UserDao;
import com.hillert.model.ExpenseEstimateBean;
import com.hillert.model.ExpenseSumaryBean;
import com.hillert.model.PermissionBackBean;
import com.hillert.model.PermissionBean;
import com.hillert.model.PersonnelListBean;
import com.hillert.model.TestAjex;
import com.hillert.model.TravelExpensesBean;
import com.hillert.model.TravelExpensesFuelCostBean;
import com.hillert.model.UserBean;

@RestController
public class InsertRestController {
	
	@Autowired
	LoginDao loginDao;
	@Autowired
	PermissionDao perDao;
	@Autowired
	ExpenseEstimateDao EEDao;
	@Autowired
	UserDao userDao;	


	// insert_user
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> insertUser(Model model, @RequestBody UserBean userBean, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		TestAjex id = new TestAjex();
		int idu = 0;
		Map<String, String> insertUser = new HashMap<String, String>();
		id = userDao.CheckUserName(userBean.getUserUsername());

		try {
			if (id.getUserName() == null) {
				idu = userDao.insertNewUser(userBean);
				for (PersonnelListBean personnelListBean : userBean.getPlBean()) {
					personnelListBean.setUserId(idu);
					userDao.insert(personnelListBean);
				}
				insertUser.put("page", "nserOK");// insert OK gotoUserAll
			} else {
				insertUser.put("page", "nser");// insert Fill!! nser
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			insertUser.put("page", "nser");// insert Fill!! nser
		}
		return insertUser;
	}// end insert user

	// ตรวจสอบ username in SQL
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public UserBean user(@RequestBody TestAjex testAjex) throws SQLException {
		UserBean bean = new UserBean();
		bean = userDao.user(testAjex.getUserName());
		// System.out.println(testAjex.getUserUsername());
		return bean;
	}
	

	// insert_permisstion
	@RequestMapping(value = "/insertPermission", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> payment(Model model, @RequestBody PermissionBean pmBean,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int perId = 0 ;
		Map<String, String> insertPermission = new HashMap<String, String>();
		try {
			perId = perDao.insertPermission(pmBean);
			
			
			for (ExpenseEstimateBean expenseEstimateBean : pmBean.getEeBean()) {
				expenseEstimateBean.setPermissionId(perId);
				EEDao.insert(expenseEstimateBean);
			}
			
			for (TravelExpensesBean travelEstimateBean : pmBean.getTeBean()) {
			travelEstimateBean.setPermissionId(perId);
			EEDao.insert(travelEstimateBean);
			}
			
			for (TravelExpensesFuelCostBean travelExpensesFuelCostBean : pmBean.getTefcBean()) {
				travelExpensesFuelCostBean.setPermissionId(perId);
				EEDao.OfficialCar(travelExpensesFuelCostBean);
			}
			
			for (TravelExpensesFuelCostBean travelExpensesFuelCostBean : pmBean.getTefcBean()) {
			travelExpensesFuelCostBean.setPermissionId(perId);
			EEDao.privateCar(travelExpensesFuelCostBean);
			}
			
			ExpenseSumaryBean expenseSumaryBean = pmBean.getEsBean();
			expenseSumaryBean.setPermissionId(perId);
			EEDao.insert2(expenseSumaryBean);	
		
//			insertPermission.put("page", "permissionPDF/{values}");
			insertPermission.put("page", "insertPermissionSuccess");
		} catch (Exception e) {
			e.printStackTrace();
			insertPermission.put("page", "insertPermissionFail");
		}
		return insertPermission;
	}
	
	
	// insert_insertPermissionBack
	@RequestMapping(value = "/insertPermissionBack", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> insertPermissionBack(Model model, @RequestBody PermissionBackBean pbBean,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> insertPermission = new HashMap<String, String>();
		TestAjex perId = new TestAjex();
//		int perBackId = 0;
		perId = userDao.CheckPerBack(Integer.toString(pbBean.getPermissionId()));
		TestAjex perIdBack = new TestAjex();
		perIdBack = perDao.perId();
		try {
			if (perId.getPerIdBack() ==  null) {
			perDao.insertPBTest(pbBean);
			
			PermissionBean permissionBean = pbBean.getPermissionBean();
			permissionBean.setPermissionId(perIdBack.getPerId());
			perDao.updateStatusPermission(permissionBean);
			
			for (ExpenseEstimateBean expenseEstimateBean : pbBean.getEeBean()) {
				expenseEstimateBean.setPermissionId(perIdBack.getPerId());
				EEDao.insertEEB(expenseEstimateBean);
				}	
	
			ExpenseSumaryBean expenseSumaryBean = pbBean.getEsBean();
			expenseSumaryBean.setPermissionId(perIdBack.getPerId());
			EEDao.insertESB(expenseSumaryBean);
			
			insertPermission.put("page", "insertPermissionBackSuccess");
			}else {
			insertPermission.put("page", "insertPermissionBackSuccess");
			}
		} catch (Exception e) {
			e.printStackTrace();
			insertPermission.put("page", "welcomeUser");
		}
		return insertPermission;
	}
	
	
}//end class
