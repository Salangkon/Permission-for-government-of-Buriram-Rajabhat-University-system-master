package com.hillert.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	// DropDown
		@RequestMapping("/insertPermissionFail")
		public String insertPermissionFail(Model model) {
			model.addAttribute("messes", "F");
			return "Ask_la";
		}

		// DropDown
		@RequestMapping("/insertPermissionSuccess")
		public String insertPermissionSuccess(Model model) {
			model.addAttribute("messes", "S");
			return "Ask_la";
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

	// path test1 from ask
	@RequestMapping("/test1")
	public String tset1() {
		return "test1";
	}

	// path Ask_la
	@RequestMapping("/gotoAsk_la")
	public String gotoAsk_la(HttpServletRequest request,Model model) {
//		UserBean bean = new UserBean();
//		request.getSession().setAttribute("userBean",bean);
		model.addAttribute("messes", "");
		return "Ask_la";
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
	
	// สมัคร username ห้ามซ้ำ
	@RequestMapping(value = "/nserOK")
	public String gotoInserst1(Model model) {
		model.addAttribute("messes", "S");
		return "insert";
	}

	// update user
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(UserBean userBean, Model model) throws SQLException {
		try {
			userDao.update(userBean);
			model.addAttribute("messesUpdate", "S");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("messesUpdate", "F");
		}
		return "update";
	}

	// update user
	@RequestMapping(value = "/gotoUpdate/{values}", method = RequestMethod.GET)
	public String gotoUpdate(@PathVariable("values") String values, HttpServletRequest request, Model model)throws NumberFormatException, SQLException {
		PersonAddressBean bean = new PersonAddressBean();
		List<PersonAddressBean> list = new ArrayList<>();
		try {
			bean = userDao.findByIdCard(Integer.parseInt(values));
			list = userDao.findByIdCard1(Integer.parseInt(values));
			if (values != null) {
				model.addAttribute("messesUpdate", "");
				request.setAttribute("userBean", bean);
				request.setAttribute("listUserBean", list);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "update";
	}

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
