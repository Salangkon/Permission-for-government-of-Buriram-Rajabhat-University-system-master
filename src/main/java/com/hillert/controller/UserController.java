package com.hillert.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hillert.dao.PermissionDao;
import com.hillert.dao.UserDao;
import com.hillert.model.DepartmentBean;
import com.hillert.model.FacultyBean;
import com.hillert.model.PersonAddressBean;
import com.hillert.model.PersonnelListBean;
import com.hillert.model.PositionBean;
import com.hillert.model.SubPositionBean;
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

	// path addFaculty
	@RequestMapping("/addFaculty")
	public String addFaculty() {
		return "addFaculty";
	}
	
	// path insertAddFaculty
	@RequestMapping("/insertAddFaculty")
	public String insertAddFaculty(@RequestBody FacultyBean facBean) throws Exception {
		userDao.insertFacultyBean(facBean);
		return "addFaculty";
	}
	
	// path updateAddFaculty
	@RequestMapping(path = "/updateAddFaculty", method = RequestMethod.POST)
	public String updateAddFaculty(FacultyBean facBean) throws Exception {
		userDao.updateFaculty(facBean);
		return "addFaculty";
	}
	
	// path addDepartment
	@RequestMapping("/addDepartment")
	public String addDepartment() {
		return "addDepartment";
	}
	
	// path insertAddDepartment
	@RequestMapping("/insertAddDepartment")
	public String insertAddDepartment(@RequestBody DepartmentBean depBean) throws Exception {
		userDao.insertDepartmentBean(depBean);
		return "addDepartment";
	}
	
	// path updateAddDepartment
	@RequestMapping(path = "/updateAddDepartment", method = RequestMethod.POST)
	public String updateAddDepartmenty(DepartmentBean depBean) throws Exception {
		userDao.updateDepartment(depBean);
		return "addDepartment";
	}
	
	// path addPosition
	@RequestMapping("/addPosition")
	public String addPosition() {
		return "addPosition";
	}
	
	// path insertAddPosition
	@RequestMapping("/insertAddPosition")
	public String insertAddPosition(@RequestBody PositionBean posBean) throws Exception {
		userDao.insertPositionBean(posBean);
		return "addPosition";
	}
	
	// path updateAddPosition
	@RequestMapping(path = "/updateAddPosition", method = RequestMethod.POST)
	public String updateAddPosition(PositionBean PosBean) throws Exception {
		userDao.updatePosition(PosBean);
		return "addPosition";
	}

	// path addSubPosition
	@RequestMapping("/addSubPosition")
	public String addSubPosition() {
		return "addSubPosition";
	}
	
	// path insertAddSubPosition
	@RequestMapping("/insertAddSubPosition")
	public String insertAddSubPosition(@RequestBody SubPositionBean subBean) throws Exception {
		userDao.insertSubPositionBean(subBean);
		return "addSubPosition";
	}
	
	// path updateAddSubPosition
	@RequestMapping(path = "/updateAddSubPosition", method = RequestMethod.POST)
	public String updateAddSubPosition(SubPositionBean subBean) throws Exception {
		userDao.updateSubPosition(subBean);
		return "addSubPosition";
	}

	// path Ask_la
	@RequestMapping("/gotoAsk_la")
	public String gotoAsk_la(HttpServletRequest request,Model model) {
//		UserBean bean = new UserBean();
//		request.getSession().setAttribute("userBean",bean);
		model.addAttribute("messes", "");
		return "permission";
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
	public String gotoUpdate(Model model,int userId ,HttpServletRequest request)throws NumberFormatException, SQLException {
		UserBean bean = new UserBean();
		List<PersonAddressBean> list = new ArrayList<>();
		try {
			bean = userDao.findByIdCard(userId);
			list = userDao.findByIdCard1(userId);
			if (bean.getUserId() != 0) {
				model.addAttribute("messesUpdate", "");
				model.addAttribute("resultBean", bean);
				model.addAttribute("listUserBean", list);
//				request.getSession().setAttribute("messesUpdate", "");
//				request.getSession().setAttribute("resultBean", bean);
//				request.getSession().setAttribute("listUserBean", list);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "update";
	}//end update user

	// update user
	@RequestMapping(value = "/update")
	public String update(Model model,@ModelAttribute("SpringWeb")UserBean userBean ,HttpServletRequest request) throws SQLException {
		UserBean bean = new UserBean();
		List<PersonAddressBean> list = new ArrayList<>();
		try {
			userDao.update(userBean);
			bean = userDao.findByIdCard(userBean.getUserId()); 
			list = userDao.findByIdCard1(userBean.getUserId());
			model.addAttribute("resultBean", bean);
			model.addAttribute("listUserBean", list);
			model.addAttribute("messesUpdate", "S");
//			request.getSession().setAttribute("resultBean", bean);
//			request.getSession().setAttribute("listUserBean", list);
//			request.getSession().setAttribute("messesUpdate", "S");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("messesUpdate", "F");
		}
		return "update";
	}//end update user
	
//  path UpdatePL
	@RequestMapping( value = "/gotoUpdatePL" , method = RequestMethod.POST)
	public String gotoUpdatePL(int personnelId, Model model) {	
		PersonAddressBean bean = new PersonAddressBean();
		try {
			bean = userDao.findByIdPL(personnelId);
			model.addAttribute("messesUpdate", "");
			model.addAttribute("updatePL", bean);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "updatePL";
	}
	
	// path UpdatePL
	@RequestMapping(value = "/updatePL")
	public String updatePL(Model model,@ModelAttribute("SpringWeb")PersonAddressBean bean) throws SQLException {
		PersonAddressBean beanPL = new PersonAddressBean();
		try {
			userDao.updatePL(bean);
			beanPL = userDao.findByIdPL(bean.getPersonnelId());
			model.addAttribute("updatePL", beanPL);
			model.addAttribute("messesUpdate", "S");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("messesUpdate", "F");
		}
		return "updatePL";
	}//end update user
	
	// update user
	@RequestMapping(value = "/updateUser")
	public String updateUser(Model model,@ModelAttribute("SpringWeb")UserBean userBean ,HttpServletRequest request) throws SQLException {
		UserBean bean = new UserBean();
		
		try {
			userDao.updateUser(userBean);
			bean = userDao.findByIdCard(userBean.getUserId()); 
			model.addAttribute("userBean", bean);
			model.addAttribute("messesUpdate", "S");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("messesUpdate", "F");
		}
		return "Ask_story";
	}//end update user
	
	// path story
	@RequestMapping("/gotoAsk_story")
	public String gotoAsk_story(Model model) {
		UserBean bean = new UserBean();
		try {
			model.addAttribute("resultBean", bean);
			model.addAttribute("messesUpdate", "S");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("messesUpdate", "F");
		}
		return "Ask_story";
	}
	
	// path updateAddFaculty
	@RequestMapping(path = "/updatePLUser", method = RequestMethod.POST)
	public String updatePLUser(PersonnelListBean plUserBean) throws Exception {
		userDao.updatePLUser(plUserBean);
		return "Ask_story";
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
