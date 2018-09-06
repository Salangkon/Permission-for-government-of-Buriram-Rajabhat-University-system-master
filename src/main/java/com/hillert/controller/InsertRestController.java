package com.hillert.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
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
import com.hillert.model.PermissionBean;
import com.hillert.model.PersonnelListBean;
import com.hillert.model.TestAjex;
import com.hillert.model.TravelExpensesBean;
import com.hillert.model.UserBean;
import com.hillert.model.TravelExpensesFuelCostBean;

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
	@RequestMapping(value = { "/insert" }, method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String insert(Model model, @RequestBody UserBean userBean) throws SQLException {
		TestAjex rr = new TestAjex();
		rr = userDao.CheckUserName(userBean.getUserUsername());
		try {
			if (rr.getAmphur() == null) {
				userDao.insertNewUser(userBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test";
	}

	// insert_user
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> insertUser(Model model, @RequestBody UserBean userBean, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		TestAjex rr = new TestAjex();
		Map<String, String> insertUser = new HashMap<String, String>();
		rr = userDao.CheckUserName(userBean.getUserUsername());

		try {
			if (rr.getAmphur() == null) {
				userDao.insertNewUser(userBean);
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

	// insert_personel
	@RequestMapping(value = { "/personel" }, method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String insert(Model model, @RequestBody PersonnelListBean plBean) {
		try {
			userDao.insert(plBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test";
	}// end_personel

	// insert_personel
	@RequestMapping(value = "/insertPersonnel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> personel(Model model, @RequestBody List<PersonnelListBean> plBean,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		//UserId
		TestAjex id = new TestAjex();
		id = userDao.userId();
		Map<String, String> insertPersonnel = new HashMap<String, String>();
		try {
			for (PersonnelListBean personnelListBean : plBean) {
				personnelListBean.setUserId(id.getUserId());
				if (id.getUserId() != 0) {
					userDao.insert(personnelListBean);
					insertPersonnel.put("page", "nserOK");
				}else {
					insertPersonnel.put("page", "nser");// insert Fill!! nser
				}	
			}
		} catch (Exception e) {
			e.printStackTrace();
			insertPersonnel.put("page", "nser");// insert Fill!! nser
		}
		return insertPersonnel;
	}// end_personel


	// ตรวจสอบ username in SQL
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public UserBean user(@RequestBody TestAjex testAjex) throws SQLException {
		UserBean bean = new UserBean();
		bean = userDao.user(testAjex.getUserName());
		// System.out.println(testAjex.getUserUsername());
		return bean;
	}

	// insert_permisstion
	@RequestMapping(value = { "/permission" }, method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String insert(Model model, @RequestBody PermissionBean pmBean) {
		try {
			perDao.insertPermission(pmBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test";
	}

	// insert_permisstion
	@RequestMapping(value = "/insertPermission", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> payment(Model model, @RequestBody PermissionBean pmBean, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Map<String, String> insertPermission = new HashMap<String, String>();
		try {
			perDao.insertPermission(pmBean);
			insertPermission.put("page", "insertPermissionSuccess");
		} catch (Exception e) {
			e.printStackTrace();
			insertPermission.put("page", "insertPermissionFail");
		}
		
		
		return insertPermission;
	}

	// insert_ExpenseEstimate
	@RequestMapping(value = { "/expenseEstimate" }, method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String insert(Model model, @RequestBody ExpenseEstimateBean EEBean) {
		try {
			EEDao.insert(EEBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test";
	}// end_ExpenseEstimate

	// insert_ExpenseEstimate
	@RequestMapping(value = "/insertExpenseEstimate", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> payment(Model model, @RequestBody List<ExpenseEstimateBean> EEBean,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		TestAjex perId = new TestAjex();
		perId = perDao.perId();
		Map<String, String> insertExpenseEstimate = new HashMap<String, String>();
		try {
			for (ExpenseEstimateBean expenseEstimateBean : EEBean) {
				expenseEstimateBean.setPermissionId(perId.getPerId());
				EEDao.insert(expenseEstimateBean);
				insertExpenseEstimate.put("page", "insertPermissionSuccess");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		insertExpenseEstimate.put("page", "insertPermissionFail");
		return insertExpenseEstimate;
	}// end_ExpenseEstimate

	// insert_TravelEstimate
	@RequestMapping(value = { "/travelEstimate" }, method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String insert(Model model, @RequestBody TravelExpensesBean TEBean) {
		try {
			EEDao.insert(TEBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test";
	}////end insert_TravelEstimate

	// insert_TravelEstimate
	@RequestMapping(value = "/insertTravelEstimate", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> insertTravelEstimate(Model model, @RequestBody List<TravelExpensesBean> TEBean,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		TestAjex id = new TestAjex();
		id = loginDao.userId();
		TestAjex perId = new TestAjex();
		perId = perDao.perId();
		Map<String, String> insertTravelEstimate = new HashMap<String, String>();
		try {
			for (TravelExpensesBean travelEstimateBean : TEBean) {
				travelEstimateBean.setPersonnelId(id.getUserID());
				travelEstimateBean.setPermissionId(perId.getPerId());
				EEDao.insert(travelEstimateBean);
				insertTravelEstimate.put("page", "insertPermissionSuccess");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		insertTravelEstimate.put("page", "insertPermissionFail");
		return insertTravelEstimate;
		}//end insert_TravelEstimate
	
		// insert_travelExpensesFuelCost
		@RequestMapping(value = { "/travelExpensesFuelCost" }, method = RequestMethod.POST, produces = "application/json")
		@ResponseBody
		public String insert(Model model, @RequestBody TravelExpensesFuelCostBean TEBean) {
			try {
				EEDao.insert1(TEBean);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "test";
		}////end insert_travelExpensesFuelCost

		// insert_travelExpensesFuelCost
		@RequestMapping(value = "/insertTravelExpensesFuelCost", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, String> insertTravelExpensesFuelCost(Model model, @RequestBody List<TravelExpensesFuelCostBean> TEBean,
				HttpServletRequest request, HttpServletResponse response) throws Exception {
			// permisstionId
			TestAjex perId = new TestAjex();
			perId = perDao.perId();
			Map<String, String> insertTravelEstimate = new HashMap<String, String>();
			try {
				for (TravelExpensesFuelCostBean travelExpensesFuelCostBean : TEBean) {
					travelExpensesFuelCostBean.setPermissionId(perId.getPerId());
					EEDao.insert1(travelExpensesFuelCostBean);
					insertTravelEstimate.put("page", "insertPermissionSuccess");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
//			insertTravelEstimate.put("page", "insertPermissionFail");
			return insertTravelEstimate;
		}//end insert_travelExpensesFuelCost
		
		// insert_ExpenseEstimate
		@RequestMapping(value = { "/expenseSumary" }, method = RequestMethod.POST, produces = "application/json")
		@ResponseBody
		public String insert(Model model, @RequestBody ExpenseSumaryBean esBean) {
			try {
				EEDao.insert2(esBean);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "test";
		}// end_ExpenseEstimate

		// insert_ExpenseEstimate
		@RequestMapping(value = "/insertExpenseSumary", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, String> payment1(Model model, @RequestBody ExpenseSumaryBean EEBean,
				HttpServletRequest request, HttpServletResponse response) throws Exception {

			TestAjex perId = new TestAjex();
			perId = perDao.perId();
			Map<String, String> insertExpenseEstimate = new HashMap<String, String>();
			try {
				EEBean.setPermissionId(perId.getPerId());
					EEDao.insert2(EEBean);
					insertExpenseEstimate.put("page", "insertPermissionSuccess");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
//			insertExpenseEstimate.put("page", "insertPermissionFail");
			return insertExpenseEstimate;
		}// end_ExpenseEstimate
	
}//end class
