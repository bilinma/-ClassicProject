package cn.edn.yan.service.impl;

import java.util.List;

import cn.edn.yan.dao.ModuleDAO;
import cn.edn.yan.domain.Module;
import cn.edn.yan.service.ModuleService;
import cn.edn.yan.util.QueryResult;

public class ModuleServiceImpl implements ModuleService {
	private ModuleDAO moduleDao;
	public void setModuleDao(ModuleDAO moduleDao) {
		this.moduleDao = moduleDao;
	}
	
	public List<Module> listModule() {
		List<Module> modules=moduleDao.listModule();
		return modules;
	}

	public Module selectModule(String moduleName) {
		return moduleDao.selectModule(moduleName);
	}

	public Module findByIdModule(int id) {
		return moduleDao.findByIdModule(id);
	}

	public List<Module> findAll() {
		return moduleDao.listModule();
	}

	public void addModule(Module module) {
		moduleDao.addModule(module);
	}

	public void delectModule(int id) {
		moduleDao.delectModule(id);
	}

	public void updateModule(Module module) {
		moduleDao.updateModule(module);
	}

}
