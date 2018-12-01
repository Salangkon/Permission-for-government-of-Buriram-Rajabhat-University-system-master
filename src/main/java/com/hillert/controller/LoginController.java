package com.hillert.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.hillert.dao.AdminDao;
import com.hillert.dao.LoginDao;
import com.hillert.model.ExpenseSumaryBean;
import com.hillert.model.FacultyBean;
import com.hillert.model.PermissionBean;
import com.hillert.model.RequsetEnty;
import com.hillert.model.ResposeEnty;
import com.hillert.model.TestAjex;
import com.hillert.model.UserBean;


@Controller
public class LoginController {
	@Autowired
	private LoginDao logindao;
	@Autowired
	private AdminDao admidDao;
	
	int userId;
	
	// เก็บ ID USER และแปลงเพื่อใช้งาน เป็น String
	public TestAjex updateUser() {
		TestAjex bean = new TestAjex();
		bean.setUpdateUser(userId);
		return bean;
	}// end insert user New

	@RequestMapping("/dataUser")
	public String dd(Model model) {
	
		return "DataUser";
	}

	@RequestMapping("/")
	public String login(Model model) {
		model.addAttribute("messessError", "");
		return "login";
	}

	@RequestMapping("/login")
	public String authenLogin(String username, String password,String date , Model model, HttpServletRequest request) {
		String authen = "";
		UserBean bean = new UserBean() , countUser = new UserBean();	
		PermissionBean countPer , countPerBack = new PermissionBean();
		ExpenseSumaryBean es, esFac1, esFac2, esFac3, esFac4, esFac5, esFac6 = new ExpenseSumaryBean();
		FacultyBean countFac1,countFac2,countFac3,countFac4,countFac5,countFac6  = new FacultyBean();
		List<ExpenseSumaryBean> budgetPass = new ArrayList<>();
		try {
			RestTemplate  rest = new RestTemplate();
			 
			RequsetEnty reqEty = new RequsetEnty();
			
			reqEty.setLogin(username);
			reqEty.setPassword(password);
			
			HttpEntity<RequsetEnty> httpEty = new HttpEntity<RequsetEnty>(reqEty);
			String resEnt  = 	rest.postForObject("http://localhost/login_ldap_php/checklogin.php", httpEty, String.class);
			JSONObject obj = new JSONObject(resEnt);
//			
//			ObjectMapper mapper = new ObjectMapper();
			ResposeEnty res = new ResposeEnty();
			res.setStatusFlag(obj.getBoolean("statusFlag"));
			res.setEmail(obj.getString("username"));
			if(res.isStatusFlag()) {
				bean = logindao.login(username, password);	
			}else {
				model.addAttribute("messessError", "F");
				authen = "login";
				return authen;
			}
			
			
			if (bean.getUserUsername() != null) {	
				userId = bean.getUserId();
				request.getSession().setAttribute("userBean",bean);
				model.addAttribute("messessError", "F");
				if(bean.getRole()  == 1) {
					
					countUser 	= admidDao.countUser();//จำนวน user
					countPer	= admidDao.countPer();//จำนวน permission
					countPerBack= admidDao.countPerBack();//จำนวน permission back
					countFac1 	= admidDao.countFac1();//จำนวน permission faculty1
					countFac2 	= admidDao.countFac2();//จำนวน permission faculty2
					countFac3 	= admidDao.countFac3();//จำนวน permission faculty3
					countFac4 	= admidDao.countFac4();//จำนวน permission faculty4
					countFac5 	= admidDao.countFac5();//จำนวน permission faculty5
					countFac6 	= admidDao.countFac6();//จำนวน permission faculty6
					es			= admidDao.ExpenseSumary();//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ
					esFac1		= admidDao.ExpenseSumaryFac1();//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะครุศาสตร์
					esFac2		= admidDao.ExpenseSumaryFac2();//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะวิทยาศาสตร์
					esFac3		= admidDao.ExpenseSumaryFac3();//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะมนุษยศาสตร์และสังคมศาสตร์
					esFac4		= admidDao.ExpenseSumaryFac4();//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะวิทยาการจัดการ
					esFac5		= admidDao.ExpenseSumaryFac5();//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะเทคโนโลยีอุตสาหกรรม
					esFac6		= admidDao.ExpenseSumaryFac6();//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะเทคโนโลยีการเกษตร
					budgetPass	= admidDao.budgetPass();//รายการค่าใช้จ่าย รหัสโครงการ
					
					request.getSession().setAttribute("countUser", countUser);//จำนวน user
					request.getSession().setAttribute("countPer", countPer);//จำนวน permission
					request.getSession().setAttribute("countPerBack", countPerBack);//จำนวน permission back
					request.getSession().setAttribute("countFac1", countFac1);//จำนวน faculty1
					request.getSession().setAttribute("countFac2", countFac2);//จำนวน faculty2
					request.getSession().setAttribute("countFac3", countFac3);//จำนวน faculty3
					request.getSession().setAttribute("countFac4", countFac4);//จำนวน faculty4
					request.getSession().setAttribute("countFac5", countFac5);//จำนวน faculty5
					request.getSession().setAttribute("countFac6", countFac6);//จำนวน faculty6
					request.getSession().setAttribute("es", es);//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ
					request.getSession().setAttribute("esFac1", esFac1);//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะครุศาสตร์
					request.getSession().setAttribute("esFac2", esFac2);//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะวิทยาศาสตร์
					request.getSession().setAttribute("esFac3", esFac3);//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะมนุษยศาสตร์และสังคมศาสตร์
					request.getSession().setAttribute("esFac4", esFac4);//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะวิทยาการจัดการ
					request.getSession().setAttribute("esFac5", esFac5);//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะเทคโนโลยีอุตสาหกรรม
					request.getSession().setAttribute("esFac6", esFac6);//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะเทคโนโลยีการเกษตร
					request.getSession().setAttribute("budgetPass", budgetPass);//ยอดรวมเงินทั้งหมด ของการขออนุญาตไปราชการ คณะเทคโนโลยีการเกษตร
					
					request.getSession().setAttribute("userBean",bean);
					model.addAttribute("messessError", "L");
					authen ="welcomeAdmin";
				 }
				 else if(bean.getRole() == 2)  {
					 request.getSession().setAttribute("userBean",bean);
					 model.addAttribute("messessError", "L");
					 authen ="welcomeUser";
				 }
				 else if(bean.getRole() == 3)  {
					 request.getSession().setAttribute("userBean",bean);
					 model.addAttribute("messessError", "Out");
					 authen ="login";
				 }	 
			}else {
				model.addAttribute("messessError", "F");
				authen = "login";
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return authen;
	}
	
	@RequestMapping("/logout")
	private String logout(HttpServletRequest request, Model model) {
		request.getSession().removeAttribute("userBean");
		request.getSession().removeAttribute("listUser");
		model.addAttribute("messessError", "L");
		return "login";
	}
	
	//  past welcomeAdmin
	@RequestMapping("/welcomeAdmin")
	public String welcomeAdmin(HttpServletRequest request) throws SQLException {
//		UserBean bean = new UserBean();
//		PermissionBean perBean = new PermissionBean();
//		bean = userDao.count();
//		perBean = perDao.count();
//		request.getSession().setAttribute("perBean", perBean);
//		request.getSession().setAttribute("userBean",bean);
		return "welcomeAdmin";
	}
	
	//  past welcomeUser
	@RequestMapping("/welcomeUser")
	public String welcomeUser(HttpServletRequest request) throws SQLException {	
//		UserBean bean = new UserBean();
//		request.getSession().setAttribute("userBean",bean);
		return "welcomeUser";
	}

}