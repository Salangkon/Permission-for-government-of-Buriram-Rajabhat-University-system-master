package com.hillert.controller;

import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hillert.dao.AdminDao;
import com.hillert.dao.LoginDao;
import com.hillert.model.FacultyBean;
import com.hillert.model.PermissionBean;
import com.hillert.model.UserBean;


@Controller
public class LoginController {
	@Autowired
	private LoginDao logindao;
	@Autowired
	private AdminDao admidDao;
	

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
		UserBean bean = new UserBean();	
		UserBean countUser = new UserBean();	
		PermissionBean countPer = new PermissionBean();
		FacultyBean countFac1,countFac2,countFac3,countFac4,countFac5,countFac6  = new FacultyBean();
		try {
			bean = logindao.login(username, password);
//			String userId = String.valueOf(bean.getUserId());		
			
			if (bean.getUserUsername() != null) {	
				request.getSession().setAttribute("userBean",bean);
				model.addAttribute("messessError", "F");
				if(bean.getRole()  == 1) {
					
					countUser 	= admidDao.countUser();//จำนวน user
					countPer	= admidDao.countPer();//จำนวน permission
					countFac1 	= admidDao.countFac1();//จำนวน permission faculty1
					countFac2 	= admidDao.countFac2();//จำนวน permission faculty2
					countFac3 	= admidDao.countFac3();//จำนวน permission faculty3
					countFac4 	= admidDao.countFac4();//จำนวน permission faculty4
					countFac5 	= admidDao.countFac5();//จำนวน permission faculty5
					countFac6 	= admidDao.countFac6();//จำนวน permission faculty6
					
					request.getSession().setAttribute("countUser", countUser);//จำนวน user
					request.getSession().setAttribute("countPer", countPer);//จำนวน permission
					request.getSession().setAttribute("countFac1", countFac1);//จำนวน faculty1
					request.getSession().setAttribute("countFac2", countFac2);//จำนวน faculty2
					request.getSession().setAttribute("countFac3", countFac3);//จำนวน faculty3
					request.getSession().setAttribute("countFac4", countFac4);//จำนวน faculty4
					request.getSession().setAttribute("countFac5", countFac5);//จำนวน faculty5
					request.getSession().setAttribute("countFac6", countFac6);//จำนวน faculty6
					
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
			// TODO: handle exception
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