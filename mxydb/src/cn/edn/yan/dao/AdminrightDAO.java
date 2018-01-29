package cn.edn.yan.dao;

import cn.edn.yan.domain.Adminright;

public interface AdminrightDAO {
	/**
	 * 添加管理员权限
	 * @param adminright
	 */
	public  void addAdminright(Adminright adminright);
	/**
	 * 根据id查询Adminright
	 * @param id
	 * @return
	 */
	public Adminright findById(int id);
	/**
	 * 删除管理员Adminright
	 * @param id
	 */
	public void deleteAdminright(int id);
	
}
