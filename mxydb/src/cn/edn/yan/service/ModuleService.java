package cn.edn.yan.service;

import java.util.List;

import cn.edn.yan.domain.Module;

public interface ModuleService {
	public List<Module> listModule();
	public Module selectModule(String moduleName);
	public Module findByIdModule(int id);
	public void addModule(Module module);
	public void delectModule(int id);
	
	public List<Module> findAll();
	public void updateModule(Module module);
}
