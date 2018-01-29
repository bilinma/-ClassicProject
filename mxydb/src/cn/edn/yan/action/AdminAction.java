package cn.edn.yan.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import cn.edn.yan.domain.Admin;
import cn.edn.yan.domain.Adminright;
import cn.edn.yan.domain.Right;
import cn.edn.yan.service.AdminService;
import cn.edn.yan.service.AdminrightService;
import cn.edn.yan.service.RightService;
import cn.edn.yan.util.MPageParameters;
import cn.edn.yan.util.QueryResult;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @author Administrator
 * 管理员action
 */
public class AdminAction extends ActionSupport{
	private final Logger logger = Logger.getLogger(AdminAction.class);
	
	private AdminService adminService;
	private RightService rightService;
	private AdminrightService adminrightService;
	private String adminMsg;
	private String adminname;
	private int id;
	private String name;
	private String loginname;
	private String password;
	private String phone;
	private String email;
	private Date enrolldate;
	private  Set<Integer>  rightSet; 
	private String imgcode;
	private String mpage;
//	private String loginMsg;
//	public String getLoginMsg() {
//		return loginMsg;
//	}
//	public void setLoginMsg(String loginMsg) {
//		this.loginMsg = loginMsg;
//	}
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	public void setRightService(RightService rightService) {
		this.rightService = rightService;
	}
	public void setAdminrightService(AdminrightService adminrightService) {
		this.adminrightService = adminrightService;
	}
	
	public String getAdminMsg() {
		return adminMsg;
	}
	public void setAdminMsg(String adminMsg) {
		this.adminMsg = adminMsg;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getEnrolldate() {
		return enrolldate;
	}
	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}
	public Set<Integer> getRightSet() {
		return rightSet;
	}
	public void setRightSet(Set<Integer> rightSet) {
		this.rightSet = rightSet;
	}
	public String getImgcode() {
		return imgcode;
	}
	public void setImgcode(String imgcode) {
		this.imgcode = imgcode;
	}
	public String getMpage() {
		return mpage;
	}
	public void setMpage(String mpage) {
		this.mpage = mpage;
	}
	/**
	 * 后台生成分页栏内容及链接
	 * @param counts
	 * @param currentPage
	 * @param request
	 * @return
	 */
	private String makePagenavAdmin(int counts, int currentPage, HttpServletRequest request){
		int totalPages;
		if (counts%MPageParameters.ITEMS_EACH_PAGE == 0)
			totalPages = counts / MPageParameters.ITEMS_EACH_PAGE;
		else
			totalPages = counts / MPageParameters.ITEMS_EACH_PAGE + 1;
		String url = request.getContextPath() + request.getServletPath();
		return MPageParameters.pageNavigator(totalPages, currentPage, url);
	}
	
	/**
	 * 管理员登陆
	 * @return
	 */
	public String adminLogin(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String checknum=(String) request.getSession().getAttribute("number");
		Admin admin = adminService.adminLogin(loginname, password);
		if (admin == null||!checknum.equalsIgnoreCase(imgcode)){
//			loginMsg = getText("msg.login");
			return INPUT;

		}else{
			request=ServletActionContext.getRequest();
			request.getSession().setAttribute("ADMIN", admin);
			Set<Adminright> ars = admin.getAdminrights();
			Set<Right> rights = new TreeSet<Right>();
			for(Adminright ar: ars){
				Right right=rightService.findById(ar.getRight().getId());
				rights.add(right);
			}
			request.getSession().setAttribute("ADMIN_RIGHTS",rights );
		}
		return SUCCESS;
	}
	/**
	 * 管理员列表
	 * @return
	 */
	public String listAdmin(){
		HttpServletRequest request=ServletActionContext.getRequest();
		//得到当前页的页码
		int currentPage;
		if(mpage==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(mpage);
		}
		QueryResult<Admin> qr = adminService.findAll(currentPage);
		request.getSession().setAttribute("XYDB_ADMINS", qr.getData());
		String pagenav = makePagenavAdmin(qr.getCount(), currentPage, request);
		request.setAttribute("pagenav", pagenav);
		List<Right> rights=rightService.listRight();
		//管理员管理只有超级管理员能使用
		if(rights!=null||rights.size()>0){
			for(int i=0;i<rights.size();i++){
				if("管理员管理".equals(rights.get(i).getName())){
					rights.remove(i);
				}
			}
		}
		request.getSession().setAttribute("leftRights", rights);
		return SUCCESS;
	}
	/**
	 * 添加管理员
	 * @return
	 */
	public String addAdmin(){
		boolean addAdminflag=false;
		if(loginname!=null&&!"".equals(loginname)){
			//判断是否已经有此loginname的用户
			Admin ad=adminService.findByLoginname(loginname);
			if(ad==null){
				HttpServletRequest request=ServletActionContext.getRequest();
				Date enrolldate=new Date();
				Admin admin=new Admin(name,loginname,password,phone,email,enrolldate);
				adminService.addAdmin(admin);
				adminMsg = getText("addadmin.success");
				addAdminflag=true;
				ActionContext.getContext().getSession().put("addAdminflag", addAdminflag);
				return SUCCESS;
			}
		}
		adminMsg=getText("addadmin.fail");
		ActionContext.getContext().getSession().put("addAdminflag", addAdminflag);
		return INPUT;
	}
	/**
	 * 更新管理员信息
	 * @return
	 */
	public String updateAdmin(){
		Admin admin=adminService.findByLoginname(loginname);
		admin.setName(name);
		admin.setLoginname(loginname);
		admin.setLoginpassword(password);
		admin.setPhone(phone);
		admin.setEmail(email);
		admin.setEnrolldate(enrolldate);
		adminService.updateAdmin(admin);
		return SUCCESS;
	}
	
	/**
	 * 更新权限
	 * @return
	 */
	public String updateRight(){
		Admin admin=adminService.findById(id);
		if(admin!=null&&rightSet!=null){
			Set<Adminright> ars= admin.getAdminrights();
			//删除除管理员管理的所有权限
			for(Adminright adminright:ars){
				if(!"管理员管理".equals(adminright.getRight().getName())){
					adminrightService.deleteAdminright(adminright.getId());
				}
			}
			//重新为管理员添加权限
			Set<Adminright> adminrights=new HashSet(0);
			Adminright adminright=new Adminright();
			for(Integer rightid:rightSet){
				adminright.setAdmin(admin);
				adminright.setRight(rightService.findById(rightid));
				adminrightService.addAdminright(adminright);
				adminrights.add(adminright);
			}
		}
		return SUCCESS;
	}
	/**
	 * 查找给定id的Admin确定更行对象
	 * @return
	 */
	public String findAdmin(){
		Admin admin=adminService.findById(id);
		Set<Adminright> adminrights= admin.getAdminrights();
		List<Right> rightRights= new ArrayList<Right>();
		
		//获取管理员已经拥有的权限并写入session
		for(Adminright adminright:adminrights){
			rightRights.add(adminright.getRight());
		}
		if(rightRights!=null||rightRights.size()>0){
			for(int i=0;i<rightRights.size();i++){
				if("管理员管理".equals(rightRights.get(i).getName())){
					rightRights.remove(i);
				}
			}
		}
		ActionContext.getContext().getSession().put("rightRights", rightRights);
		
		//获取管理员未拥有的权限并写入session
		List<Right> rights=rightService.listRight();
		if(rights!=null||rights.size()>0){
			for(int i=0;i<rights.size();i++){
				if("管理员管理".equals(rights.get(i).getName())){
					rights.remove(i);
				}
			}
		}
		for(int i=0;i<rights.size();i++){
			for(int j=0;j<rightRights.size();j++){
				if(rights.get(i).getName().equals(rightRights.get(j).getName())){
					rights.remove(i);
					i--;break;
				}
			}
		}
		ActionContext.getContext().getSession().put("leftRights", rights);
		
		ActionContext.getContext().getSession().put("admin", admin);
		ActionContext.getContext().getSession().put("adminupdateid", id);
		return SUCCESS;
	}
	/**
	 * 删除管理员
	 * @return
	 */
	public String deleteAdmin(){
		boolean deleteAdminflag=false;
		Admin admin=adminService.findById(id);
		if(admin.getId()!=1){
			adminService.deleteAdmin(id);
			adminMsg = getText("deleteadmin.success");
			deleteAdminflag=true;
			ActionContext.getContext().getSession().put("deleteAdminflag",deleteAdminflag);
			return SUCCESS;
		}else{
			adminMsg=getText("deleteadmin.fail");
			ActionContext.getContext().getSession().put("deleteAdminflag", deleteAdminflag);
			return INPUT;
		}
	}
	/**
	 * 后台通过管理员姓名查询管理员
	 * @return
	 */
	public String selectAdmin(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int currentPage;
		if(mpage==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(mpage);
		}
		QueryResult<Admin> qr = adminService.selectAdmin(adminname.trim(), currentPage);
		request.getSession().setAttribute("XYDB_ADMINS", qr.getData());
		String pagenav = makePagenavAdmin(qr.getCount(), currentPage, request);
		request.setAttribute("pagenav", pagenav);
		return SUCCESS;
	}
}
