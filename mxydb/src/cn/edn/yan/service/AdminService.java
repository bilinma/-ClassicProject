package cn.edn.yan.service;

import cn.edn.yan.domain.Admin;
import cn.edn.yan.util.QueryResult;

public interface AdminService {
	public Admin adminLogin(String loginname, String password);
	public QueryResult<Admin> findAll(int currentPage);
	public void addAdmin(Admin admin);
	public void updateAdmin(Admin admin);
	public Admin findByLoginname(String loginname);
	public Admin findById(int id) ;
	public void deleteAdmin(int id);
	public QueryResult<Admin> selectAdmin(String adminname,int currentPage);
}
