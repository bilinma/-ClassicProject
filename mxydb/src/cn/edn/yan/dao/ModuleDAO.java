package cn.edn.yan.dao;

import java.util.List;

import cn.edn.yan.domain.Module;

public interface ModuleDAO {
	/**
	 * 查询所有栏目
	 */
	public List<Module> listModule();
	/**
	 * 根据栏目名查询栏目
	 * @param moduleName
	 * @return
	 */
	public Module selectModule(String moduleName);
	public Module findByIdModule(int id);
	public void addModule(Module module);
	public void delectModule(int id);
	public void updateModule(Module module);
	
}
