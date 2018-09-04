package com.hillert.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hillert.dao.LoginDao;
import com.hillert.dao.PermissionDao;
import com.hillert.dao.UserDao;
import com.hillert.model.PermissionBean;
import com.hillert.model.UserBean;


@Controller
public class LoginController {
	@Autowired
	private LoginDao logindao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private PermissionDao perDao;
	

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
		List<UserBean> list = new ArrayList<>();
		UserBean bean = new UserBean();	
		UserBean bean1 = new UserBean();	
		PermissionBean perBean = new PermissionBean();
		try {
			bean = logindao.login(username, password);
			list = logindao.findAll();
//			String userId = String.valueOf(bean.getUserId());		
			
			if (bean.getUserUsername() != null) {	
				request.getSession().setAttribute("userBean",bean);
				model.addAttribute("messessError", "F");
				request.getSession().setAttribute("listUser", list);
				if(bean.getRole()  == 1) {
					bean1 = userDao.count();
					perBean = perDao.count();
					request.getSession().setAttribute("perBean", perBean);
					request.getSession().setAttribute("userCount",bean1);
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