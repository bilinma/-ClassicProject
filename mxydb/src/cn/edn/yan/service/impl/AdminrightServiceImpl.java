package cn.edn.yan.service.impl;

import cn.edn.yan.dao.AdminrightDAO;
import cn.edn.yan.domain.Adminright;
import cn.edn.yan.service.AdminrightService;

public class AdminrightServiceImpl implements AdminrightService {
	private AdminrightDAO adminrightDao;
	public void setAdminrightDao(AdminrightDAO adminrightDao) {
		this.adminrightDao = adminrightDao;
	}

	public void addAdminright(Adminright adminright) {
		adminrightDao.addAdminright(adminright);
	}

	public void deleteAdminright(int id) {
		adminrightDao.deleteAdminright(id);
	}

}
