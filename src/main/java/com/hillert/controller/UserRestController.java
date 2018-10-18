package com.hillert.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hillert.dao.DataUserDao;
import com.hillert.dao.GeographyDao;
import com.hillert.dao.LoginDao;
import com.hillert.dao.PersonnelListDao;
import com.hillert.dao.UserDao;
import com.hillert.model.AmphurBean;
import com.hillert.model.DepartmentBean;
import com.hillert.model.DistrictBean;
import com.hillert.model.FacultyBean;
import com.hillert.model.PersonAddressBean;
import com.hillert.model.PositionBean;
import com.hillert.model.ProvinceBean;
import com.hillert.model.SubPositionBean;
import com.hillert.model.TestAjex;
import com.hillert.model.UserBean;

@RestController
public class UserRestController {

	@Autowired
	GeographyDao provinceDao;
	@Autowired
	UserDao userDao;
	@Autowired
	LoginDao loginDao;
	@Autowired
	DataUserDao auDao;
	@Autowired
	PersonnelListDao perDao;

	//List user dataTable แสดง บุคคลากร ในตาราง
	@RequestMapping(value="/user")
	public List<UserBean> bean() throws SQLException{
		List<UserBean> list = new ArrayList<>();
		list = userDao.findAll();
		
		return list;
	}
	
	//List FacultyBean
	@RequestMapping(value="/addFacultyTable")
	public List<FacultyBean> addFaculty() throws SQLException{
		List<FacultyBean> list = new ArrayList<>();
		list = userDao.addFaculty();
		
		return list;
	}
	
	//List addDepartmentTable
	@RequestMapping(value="/addDepartmentTable")
	public List<DepartmentBean> addDepartment() throws SQLException{
		List<DepartmentBean> list = new ArrayList<>();
		list = userDao.addDepartment();
		
		return list;
	}
	
	//List addPositionTable
	@RequestMapping(value="/addPositionTable")
	public List<PositionBean> addPosition() throws SQLException{
		List<PositionBean> list = new ArrayList<>();
		list = userDao.addPosition();
		
		return list;
	}

	//List addSubPositionTable
	@RequestMapping(value="/addSubPositionTable")
	public List<SubPositionBean> addSubPosition() throws SQLException{
		List<SubPositionBean> list = new ArrayList<>();
		list = userDao.addSubPosition();
		
		return list;
	}
	
	// userPersonnel
	@RequestMapping(value = "/userPersonnel")
	public List<PersonAddressBean> userPersonnel() throws SQLException {
		TestAjex id = new TestAjex();
		id=loginDao.userId();
		
		List<PersonAddressBean> list = new ArrayList<>();
		list = perDao.userPersonnel(id.getUserID());
		return list;
	}

	// List user dataTable แสดง บุคคลากร ในตาราง
	@RequestMapping(value = "/personnel")
	public List<PersonAddressBean> bean1() throws SQLException {
		List<PersonAddressBean> list = new ArrayList<>();
		list = perDao.findByUser();

		return list;
	}
	
	//จังหวัด
	@RequestMapping(value = "/province")
	public List<ProvinceBean> province() throws SQLException {
		List<ProvinceBean> list = new ArrayList<>();

		list = provinceDao.province();
		return list;
	}
	//อำเภอ
	@RequestMapping(value = "/amphur", method = RequestMethod.POST)
	public List<AmphurBean> amphur(@RequestBody TestAjex testAjex) throws SQLException {

		List<AmphurBean> list = new ArrayList<>();
		list = provinceDao.amphur(testAjex.getProvince());

		return list;
	}
	//ตำบล
	@RequestMapping(value = "/district", method = RequestMethod.POST)
	public List<DistrictBean> district(@RequestBody TestAjex testAjex) throws SQLException {

		List<DistrictBean> list = new ArrayList<>();
		list = provinceDao.District(testAjex.getProvince(), testAjex.getAmphur());

		return list;
	}
	
	//คณะ
		@RequestMapping(value="/faculty1")
		public List<FacultyBean> faculty1() throws SQLException{
			List<FacultyBean> list = new ArrayList<>();
			list = auDao.faculty1();
			
			return list;
		}
	
	//คณะ
	@RequestMapping(value="/faculty")
	public List<FacultyBean> faculty() throws SQLException{
		List<FacultyBean> list = new ArrayList<>();
		list = auDao.faculty();
		
		return list;
	}
	//สาขา
	@RequestMapping(value="/department" , method = RequestMethod.POST)
	public List<DepartmentBean> department(@RequestBody TestAjex testAjex) throws SQLException{
		List<DepartmentBean> list = new ArrayList<>();
		list = auDao.department(testAjex.getFaculty());
		
		return list;
	}
	//ตำแหน่ง
	@RequestMapping(value="/position")
	public List<PositionBean> position() throws SQLException{
		List<PositionBean> list = new ArrayList<>();
		list = auDao.position();
		
		return list;
	}
	//ระดับ
	@RequestMapping(value="/subPosition" , method = RequestMethod.POST)
	public List<SubPositionBean> subPosition(@RequestBody TestAjex testAjex) throws SQLException{
		List<SubPositionBean> list = new ArrayList<>();
		list = auDao.subPosition(testAjex.getPosition());
		
		return list;
	}
	

}
