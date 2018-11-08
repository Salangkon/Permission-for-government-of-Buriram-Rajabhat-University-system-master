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

import com.hillert.dao.LoginDao;
import com.hillert.dao.PermissionDao;
import com.hillert.model.ExpenseEstimateBean;
import com.hillert.model.ExpenseSumaryBean;
import com.hillert.model.PermissionBackBean;
import com.hillert.model.PermissionBean;
import com.hillert.model.TestAjex;
import com.hillert.model.TravelExpensesBean;
import com.hillert.model.TravelExpensesFuelCostBean;

@Controller
public class FormController {
	int permissionId;

	@Autowired
	PermissionDao perDao;
	@Autowired 
	LoginDao loginDao;

	// IDpermission
	@RequestMapping(path = "/permissionPDF/{values}", method = RequestMethod.GET)
	public String permissionPrintPDF(@PathVariable("values") String values, HttpServletRequest request, Model model)
			throws NumberFormatException, SQLException {
		PermissionBean bean = new PermissionBean();
		PermissionBackBean beanBack = new PermissionBackBean();
		ExpenseSumaryBean beanEs = new ExpenseSumaryBean();
		ExpenseSumaryBean beanEsBack = new ExpenseSumaryBean();
		TravelExpensesFuelCostBean beanTEFC = new TravelExpensesFuelCostBean();
		List<ExpenseEstimateBean> beanEE = new ArrayList<>();
		List<TravelExpensesBean> beanTr = new ArrayList<>();
		List<TravelExpensesBean> beanTr2 = new ArrayList<>();
		List<TravelExpensesBean> beanTr3 = new ArrayList<>();
		try {
			bean = perDao.fromPermission(Integer.parseInt(values));
			beanBack = perDao.fromPermissionBack(Integer.parseInt(values));
			beanEs = perDao.findByEs(Integer.parseInt(values));
			beanEsBack = perDao.findByEsBack(Integer.parseInt(values));
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
				request.setAttribute("perBackBean", beanBack);
				request.setAttribute("beanEs", beanEs);
				request.setAttribute("beanEsBack", beanEsBack);
				request.setAttribute("beanTEFC", beanTEFC);
				request.setAttribute("beanEE", beanEE);
				request.setAttribute("beanTr", beanTr3);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "permissionPrintPDF";
	}
	
	// IDpermission
	@RequestMapping(path = "/permissionPDFBack/{values}", method = RequestMethod.GET)
	public String permissionPrintPDFBack(@PathVariable("values") String values, HttpServletRequest request, Model model)
			throws NumberFormatException, SQLException {
		PermissionBean bean = new PermissionBean();
		PermissionBackBean beanBack = new PermissionBackBean();
		ExpenseSumaryBean beanEs = new ExpenseSumaryBean();
		ExpenseSumaryBean beanEsBack = new ExpenseSumaryBean();
		TravelExpensesFuelCostBean beanTEFC = new TravelExpensesFuelCostBean();
		List<ExpenseEstimateBean> beanEE = new ArrayList<>();
		List<TravelExpensesBean> beanTr = new ArrayList<>();
		List<TravelExpensesBean> beanTr2 = new ArrayList<>();
		List<TravelExpensesBean> beanTr3 = new ArrayList<>();
	
		try {
			bean = perDao.fromPermission(Integer.parseInt(values));
			beanBack = perDao.fromPermissionBack(Integer.parseInt(values));
			beanEs = perDao.findByEs(Integer.parseInt(values));
			beanEsBack = perDao.findByEsBack(Integer.parseInt(values));
			beanTEFC = perDao.findByIdTEFC(Integer.parseInt(values));
			beanEE = perDao.findByIdExpenseEstimateBack(Integer.parseInt(values));
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
				request.setAttribute("perBackBean", beanBack);
				request.setAttribute("beanEs", beanEs);
				request.setAttribute("beanEsBack", beanEsBack);
				request.setAttribute("beanTEFC", beanTEFC);
				request.setAttribute("beanEE", beanEE);
				request.setAttribute("beanTr", beanTr3);
			}
		} catch (Exception e) {
			// TODO: handle exception
//			e.printStackTrace();
		}

		return "permissionPrintPDFBack";
	}

	// permissionBack
		@RequestMapping(path = "/permissionBack", method = RequestMethod.POST)
		public String gotoPermissionUpdate(int permissionId, HttpServletRequest request, Model model)
				throws NumberFormatException, SQLException {
			String authen = "";
			
			PermissionBean bean = new PermissionBean();
			ExpenseSumaryBean beanEs = new ExpenseSumaryBean();
			TestAjex id = new TestAjex();
			
			try {
				bean = perDao.fromPermission(permissionId);
				beanEs = perDao.PermissionBackEs(permissionId);
				id=loginDao.PerBackDisabled(Integer.toString(permissionId));
				
				permissionId = bean.getPermissionId();
				if (id.getPerIdBack() == null) {
					model.addAttribute("messesUpdate", "");
					request.setAttribute("perBean", bean);
					request.setAttribute("beanEs", beanEs);
					authen = "PermissionBack";
				}else {
					authen = "welcomeUser";
				}
						
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			request.setAttribute("perBean", bean);
			return authen;
		}

		@RequestMapping("/insertPermissionFail")
		public String insertPermissionFail(Model model) {
		model.addAttribute("messes", "F");
			return "permission";
		}

		// insertPermissionSuccess
		@RequestMapping("/insertPermissionSuccess")
		public String permissionPrintPDFInsert(TestAjex permissionId, HttpServletRequest request, Model model)
				throws NumberFormatException, SQLException {
			PermissionBean bean = new PermissionBean();
			PermissionBackBean beanBack = new PermissionBackBean();
			ExpenseSumaryBean beanEs = new ExpenseSumaryBean();
			ExpenseSumaryBean beanEsBack = new ExpenseSumaryBean();
			TravelExpensesFuelCostBean beanTEFC = new TravelExpensesFuelCostBean();
			List<ExpenseEstimateBean> beanEE = new ArrayList<>();
			List<TravelExpensesBean> beanTr = new ArrayList<>();
			List<TravelExpensesBean> beanTr2 = new ArrayList<>();
			List<TravelExpensesBean> beanTr3 = new ArrayList<>();
			try {
				permissionId = perDao.perId();
				bean = perDao.fromPermission(permissionId.getPerId());
				beanBack = perDao.fromPermissionBack(permissionId.getPerId());
				beanEs = perDao.findByEs(permissionId.getPerId());
				beanEsBack = perDao.findByEsBack(permissionId.getPerId());
				beanTEFC = perDao.findByIdTEFC(permissionId.getPerId());
				beanEE = perDao.findByIdExpenseEstimate(permissionId.getPerId());
				beanTr = perDao.findByIdTravel(permissionId.getPerId());
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

				if (permissionId.getPerId() != 0) {
					model.addAttribute("messesUpdate", "");
					request.setAttribute("perBean", bean);
					request.setAttribute("perBackBean", beanBack);
					request.setAttribute("beanEs", beanEs);
					request.setAttribute("beanEsBack", beanEsBack);
					request.setAttribute("beanTEFC", beanTEFC);
					request.setAttribute("beanEE", beanEE);
					request.setAttribute("beanTr", beanTr3);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

			return "permissionPrintPDF";
		}
		
		@RequestMapping("/insertPermissionBackSuccess")
		public String insertPermissionBackSuccess(TestAjex permissionId, HttpServletRequest request, Model model) {
			PermissionBean bean = new PermissionBean();
			PermissionBackBean beanBack = new PermissionBackBean();
			ExpenseSumaryBean beanEs = new ExpenseSumaryBean();
			ExpenseSumaryBean beanEsBack = new ExpenseSumaryBean();
			TravelExpensesFuelCostBean beanTEFC = new TravelExpensesFuelCostBean();
			List<ExpenseEstimateBean> beanEE = new ArrayList<>();
			List<TravelExpensesBean> beanTr = new ArrayList<>();
			List<TravelExpensesBean> beanTr2 = new ArrayList<>();
			List<TravelExpensesBean> beanTr3 = new ArrayList<>();
			try {
				permissionId = perDao.perId();
				bean = perDao.fromPermission(permissionId.getPerId());
				beanBack = perDao.fromPermissionBack(permissionId.getPerId());
				beanEs = perDao.findByEs(permissionId.getPerId());
				beanEsBack = perDao.findByEsBack(permissionId.getPerId());
				beanTEFC = perDao.findByIdTEFC(permissionId.getPerId());
				beanEE = perDao.findByIdExpenseEstimateBack(permissionId.getPerId());
				beanTr = perDao.findByIdTravel(permissionId.getPerId());
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

				if (permissionId.getPerId() != 0) {
					model.addAttribute("messesUpdate", "");
					request.setAttribute("perBean", bean);
					request.setAttribute("perBackBean", beanBack);
					request.setAttribute("beanEs", beanEs);
					request.setAttribute("beanEsBack", beanEsBack);
					request.setAttribute("beanTEFC", beanTEFC);
					request.setAttribute("beanEE", beanEE);
					request.setAttribute("beanTr", beanTr3);
				}
			} catch (Exception e) {
				// TODO: handle exception
//				e.printStackTrace();
			}

			return "permissionPrintPDFBack";
		}
		
		// IDpermissionAdmin
		@RequestMapping(path = "/permissionPDFAdmin/{values}", method = RequestMethod.GET)
		public String permissionPrintPDFAdmin(@PathVariable("values") String values, HttpServletRequest request, Model model)
				throws NumberFormatException, SQLException {
			PermissionBean bean = new PermissionBean();
			PermissionBackBean beanBack = new PermissionBackBean();
			ExpenseSumaryBean beanEs = new ExpenseSumaryBean();
			ExpenseSumaryBean beanEsBack = new ExpenseSumaryBean();
			TravelExpensesFuelCostBean beanTEFC = new TravelExpensesFuelCostBean();
			List<ExpenseEstimateBean> beanEE = new ArrayList<>();
			List<TravelExpensesBean> beanTr = new ArrayList<>();
			List<TravelExpensesBean> beanTr2 = new ArrayList<>();
			List<TravelExpensesBean> beanTr3 = new ArrayList<>();
			try {
				bean = perDao.fromPermission(Integer.parseInt(values));
				beanBack = perDao.fromPermissionBack(Integer.parseInt(values));
				beanEs = perDao.findByEs(Integer.parseInt(values));
				beanEsBack = perDao.findByEsBack(Integer.parseInt(values));
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
					request.setAttribute("perBackBean", beanBack);
					request.setAttribute("beanEs", beanEs);
					request.setAttribute("beanEsBack", beanEsBack);
					request.setAttribute("beanTEFC", beanTEFC);
					request.setAttribute("beanEE", beanEE);
					request.setAttribute("beanTr", beanTr3);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

			return "permissionPrintPDFAdmin";
		}
		// IDpermission
		@RequestMapping(path = "/permissionPDFBackAdmin/{values}", method = RequestMethod.GET)
		public String permissionPrintPDFBackAdmin(@PathVariable("values") String values, HttpServletRequest request, Model model)
				throws NumberFormatException, SQLException {
			PermissionBean bean = new PermissionBean();
			PermissionBackBean beanBack = new PermissionBackBean();
			ExpenseSumaryBean beanEs = new ExpenseSumaryBean();
			ExpenseSumaryBean beanEsBack = new ExpenseSumaryBean();
			TravelExpensesFuelCostBean beanTEFC = new TravelExpensesFuelCostBean();
			List<ExpenseEstimateBean> beanEE = new ArrayList<>();
			List<TravelExpensesBean> beanTr = new ArrayList<>();
			List<TravelExpensesBean> beanTr2 = new ArrayList<>();
			List<TravelExpensesBean> beanTr3 = new ArrayList<>();
			try {
				bean = perDao.fromPermission(Integer.parseInt(values));
				beanBack = perDao.fromPermissionBack(Integer.parseInt(values));
				beanEs = perDao.findByEs(Integer.parseInt(values));
				beanEsBack = perDao.findByEsBack(Integer.parseInt(values));
				beanTEFC = perDao.findByIdTEFC(Integer.parseInt(values));
				beanEE = perDao.findByIdExpenseEstimateBack(Integer.parseInt(values));
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
					request.setAttribute("perBackBean", beanBack);
					request.setAttribute("beanEs", beanEs);
					request.setAttribute("beanEsBack", beanEsBack);
					request.setAttribute("beanTEFC", beanTEFC);
					request.setAttribute("beanEE", beanEE);
					request.setAttribute("beanTr", beanTr3);
				}
			} catch (Exception e) {
				// TODO: handle exception
//				e.printStackTrace();
			}

			return "permissionPrintPDFBackAdmin";
		}

}//end class
