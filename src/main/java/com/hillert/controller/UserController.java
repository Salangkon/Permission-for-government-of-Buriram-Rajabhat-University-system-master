package com.hillert.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hillert.dao.PermissionDao;
import com.hillert.dao.UserDao;
import com.hillert.model.PersonAddressBean;
import com.hillert.model.UserBean;

@Controller
public class UserController {
	@Autowired
	UserDao userDao;
	@Autowired
	PermissionDao perDao;
	
	// DropDown
	@RequestMapping("/DropDown")
	public String DropDown() {
		return "DropDown";
	}

	// DropDown
	@RequestMapping("/gotoRequest")
	public String Request() {
		return "Request";
	}

	// dataTable
	@RequestMapping("/datatable")
	public String dataTable() {
		return "datatable";
	}

	// path test from ask
	@RequestMapping("/test")
	public String tset() {
		return "test";
	}

	// path Ask_la
	@RequestMapping("/gotoAsk_la")
	public String gotoAsk_la(HttpServletRequest request,Model model) {
//		UserBean bean = new UserBean();
//		request.getSession().setAttribute("userBean",bean);
		model.addAttribute("messes", "");
		return "permission";
	}

	// path story
	@RequestMapping("/gotoAsk_story")
	public String gotoAsk_story(HttpServletRequest request) {
//		UserBean bean = new UserBean();
//		request.getSession().setAttribute("userBean",bean);
		return "Ask_story";
	}

	// path Help
	@RequestMapping("/gotoAsk_Help")
	public String gotoHelp() {
		return "Ask_help";
	}

	// path userAll
	@RequestMapping("/gotoUserAll")
	public String userAll() {
		return "userAll";
	}

	// path Insert
	@RequestMapping(value = "/gotoInsert", method = RequestMethod.POST)
	public String gotoInsert(Model model,HttpServletRequest request) {
		model.addAttribute("messes", "");
//		UserBean bean = new UserBean();
//		request.getSession().setAttribute("userBean",bean);
		return "insert";
	}

	// สมัคร username ห้ามซ้ำ
	@RequestMapping(value = "/nser")
	public String gotoInserst(Model model) {
		model.addAttribute("messes", "F");
		return "insert";
	}
	
	// บันทึกการเดินทางกลับ
	@RequestMapping(value = "/perBackOk")
	public String gotoWelcome(Model model) {
		model.addAttribute("messes", "S");
		return "welcomeUser";
	}
	
	// สมัคร username ห้ามซ้ำ
	@RequestMapping(value = "/nserOK")
	public String gotoInserst1(Model model) {
		model.addAttribute("messes", "S");
		return "insert";
	}
	
	// update user
	@RequestMapping(value = "/gotoUpdate", method = RequestMethod.POST)
	public String gotoUpdate(Model model,int userId)throws NumberFormatException, SQLException {
		UserBean bean = new UserBean();
		List<PersonAddressBean> list = new ArrayList<>();
		try {
			bean = userDao.findByIdCard(userId);
			list = userDao.findByIdCard1(userId);
			if (bean.getUserId() != 0) {
				model.addAttribute("messesUpdate", "");
				model.addAttribute("resultBean", bean);
				model.addAttribute("listUserBean", list);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "update";
	}//end update user

	// update user
	@RequestMapping(value = "/update")
	public String update(Model model,@ModelAttribute("SpringWeb")UserBean userBean) throws SQLException {
		UserBean bean = new UserBean();
		List<PersonAddressBean> list = new ArrayList<>();
		try {
			userDao.update(userBean);
			bean = userDao.findByIdCard(userBean.getUserId()); 
			list = userDao.findByIdCard1(userBean.getUserId());
			model.addAttribute("resultBean", bean);
			model.addAttribute("listUserBean", list);
			model.addAttribute("messesUpdate", "S");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("resultBean", bean);
			model.addAttribute("listUserBean", list);
			model.addAttribute("messesUpdate", "F");
		}
		return "update";
	}//end update user

	//delete
//	@RequestMapping("/delete")
//	public String delete(Model model,String userIdcard,HttpServletRequest request) {	
//		
//		List<UserBean> list = new ArrayList<>();
//		
//		try {
//			userDao.delete(userIdcard);
//			list =  userDao.findAll();
//			request.getSession().setAttribute("listUser", list);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "welcomeAdmin";
//	}
	
}
