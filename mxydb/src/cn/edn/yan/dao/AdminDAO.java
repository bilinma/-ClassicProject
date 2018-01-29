package cn.edn.yan.dao;

import java.util.Collection;

import cn.edn.yan.domain.Admin;

public interface AdminDAO {
	/**
	 * 查询记录所有管理员条数
	 * @return
	 */
	public int qryCounts();
	/**
	 * 根据条件查询当前页的数据
	 * @return
	 */
	public Collection<Admin> queryAll(int currentPage);
	/**
	 * 根据longinname和password查询管理员
	 * @return
	 */
	public Admin adminLogin(String loginname,String password);
	/**
	 * 将新管理员加入数据库
	 * @param admin
	 */
	public void addAdmin(Admin admin);
	/**
	 * 更新管理员信息
	 * @param admin
	 */
	public void updateAdmin(Admin admin);
	/**
	 * 根据条件查询管理员
	 * @return
	 */
	public Admin queryByLoginname(String loginname);
	
	/**
	 * 根据id查询管理员
	 * @param id
	 * @return
	 */
	public Admin findById(int id);
	/**
	 * 根据id删除管理员
	 * @param id
	 */
	public void deleteAdmin(int id);
	/**
	 * 根据条件查询记录条数
	 * @param adminname
	 * @return
	 */
	public int qryCounts(String adminname);
	/**
	 * 根据条件查询管理员记录数
	 * @param adminname
	 * @param currentPage
	 * @return
	 */
	public Collection<Admin> selectAdmin(String adminname,int currentPage);
}