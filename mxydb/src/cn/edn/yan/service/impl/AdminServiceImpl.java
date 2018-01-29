package cn.edn.yan.service.impl;

import cn.edn.yan.dao.AdminDAO;
import cn.edn.yan.domain.Admin;
import cn.edn.yan.service.AdminService;
import cn.edn.yan.util.QueryResult;

public class AdminServiceImpl implements AdminService {
	private AdminDAO adminDao;
	public void setAdminDao(AdminDAO adminDao) {
		this.adminDao = adminDao;
	}
	
	public Admin adminLogin(String loginname, String password) {
		return adminDao.adminLogin(loginname, password);
	}

	public QueryResult<Admin> findAll(int currentPage){
		QueryResult<Admin> qr=new QueryResult<Admin>();
		qr.setData(adminDao.queryAll(currentPage));
		qr.setCount(adminDao.qryCounts());
		return qr;
	}
	public QueryResult<Admin> selectAdmin(String adminname, int currentPage) {
		QueryResult<Admin> qr=new QueryResult<Admin>();
		qr.setData(adminDao.selectAdmin(adminname, currentPage));
		qr.setCount(adminDao.qryCounts(adminname));
		return  qr;
	}
	public void addAdmin(Admin admin) {
		adminDao.addAdmin(admin);
	}

	public Admin findByLoginname(String loginname) {
		return adminDao.queryByLoginname(loginname);
	}

	public void updateAdmin(Admin admin) {
		adminDao.updateAdmin(admin);
	}

	public Admin findById(int id) {
		return adminDao.findById(id);
	}

	public void deleteAdmin(int id) {
		adminDao.deleteAdmin(id);
	}




}
