package com.hillert.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hillert.dao.PermissionDao;
import com.hillert.model.ExpenseEstimateBean;
import com.hillert.model.ExpenseSumaryBean;
import com.hillert.model.PermissionBean;
import com.hillert.model.TravelExpensesBean;
import com.hillert.model.TravelExpensesFuelCostBean;

@Controller
public class FormController {
	int permissionId;

	@Autowired
	PermissionDao perDao;

	// IDpermission
	@RequestMapping(path = "/PerUpdateBy/{values}", method = RequestMethod.GET)
	public String gotoPermission(@PathVariable("values") String values, HttpServletRequest request, Model model)
			throws NumberFormatException, SQLException {
		PermissionBean bean = new PermissionBean();
		ExpenseSumaryBean beanEs = new ExpenseSumaryBean();
		TravelExpensesFuelCostBean beanTEFC = new TravelExpensesFuelCostBean();
		List<ExpenseEstimateBean> beanEE = new ArrayList<>();
		List<TravelExpensesBean> beanTr = new ArrayList<>();
		List<TravelExpensesBean> beanTr2 = new ArrayList<>();
		List<TravelExpensesBean> beanTr3 = new ArrayList<>();
		try {
			bean = perDao.findByIdPer(Integer.parseInt(values));
			beanEs = perDao.findByEs(Integer.parseInt(values));
			beanTEFC = perDao.findByIdTEFC(Integer.parseInt(values));
			beanEE = perDao.findByIdExpenseEstimate(Integer.parseInt(values));
			beanTr = perDao.findByIdTravel(Integer.parseInt(values));
			beanTr2 = perDao.findByIdTravel2();

			a : for (Iterator<TravelExpensesBean> iter2 = beanTr2.listIterator(); iter2.hasNext();) {

				TravelExpensesBean travelExpensesBean2 = iter2.next();

				if (beanTr.isEmpty()) {
					beanTr3.addAll(beanTr2);
					break;
				}
				
			 for (Iterator<TravelExpensesBean> iter = beanTr.listIterator(); iter.hasNext();) {

					TravelExpensesBean travelExpensesBean = iter.next();
					if (travelExpensesBean.getTravelId() == travelExpensesBean2.getTravelId()) {
						beanTr3.add(travelExpensesBean);
						iter.remove();
						iter2.remove();
						continue a;
					}
				}
				beanTr3.add(travelExpensesBean2);
				iter2.remove();

			}

			if (values != null) {
				model.addAttribute("messesUpdate", "");
				request.setAttribute("perBean", bean);
				request.setAttribute("beanEs", beanEs);
				request.setAttribute("beanTEFC", beanTEFC);
				request.setAttribute("beanEE", beanEE);
				request.setAttribute("beanTr", beanTr3);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "test";
	}

	// update permission
	@RequestMapping(path = "/gotoPerUpdate", method = RequestMethod.POST)
	public String gotoPermissionUpdate(int permissionId, HttpServletRequest request, Model model)
			throws NumberFormatException, SQLException {
		PermissionBean bean = new PermissionBean();
		ExpenseSumaryBean beanEs = new ExpenseSumaryBean();
		try {		
			bean = perDao.findByIdPer(permissionId);
			beanEs = perDao.findByEs(permissionId);
			
			permissionId = bean.getPermissionId();
			
			if (permissionId != 0) {
				model.addAttribute("messesUpdate", "");
				request.setAttribute("perBean", bean);
				request.setAttribute("beanEs", beanEs);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		request.setAttribute("perBean", bean);
		return "updatePermission";
	}

//	// update permission
//	@RequestMapping(path = "/gotoPerUpdate/{values}", method = RequestMethod.GET)
//	public String gotoPermissionUpdate(@PathVariable("values") String values, HttpServletRequest request, Model model)
//			throws NumberFormatException, SQLException {
//		PermissionBean bean = new PermissionBean();
//		ExpenseSumaryBean beanEs = new ExpenseSumaryBean();
//		try {		
//			bean = perDao.findByIdPer(Integer.parseInt(values));
//			beanEs = perDao.findByEs(Integer.parseInt(values));
//			
//			permissionId = bean.getPermissionId();
//			
//			if (values != null) {
//				model.addAttribute("messesUpdate", "");
//				request.setAttribute("perBean", bean);
//				request.setAttribute("beanEs", beanEs);
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		request.setAttribute("perBean", bean);
//		return "updatePermission";
//	}
	
	

}
