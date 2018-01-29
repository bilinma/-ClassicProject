package cn.edn.yan.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import cn.edn.yan.domain.FriendshipConn;
import cn.edn.yan.service.FriendshipConnService;
import cn.edn.yan.util.MPageParameters;
import cn.edn.yan.util.PageParameters;
import cn.edn.yan.util.QueryResult;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FriendshipConnAction extends ActionSupport{
	private final Logger logger = Logger.getLogger(FriendshipConnAction.class);
	
	private FriendshipConnService friendshipConnService;
	private String addFriendshipConnMsg;
	private int id;
	private String name;
	private String url;
	private String page;
	private String mpage;
	public void setFriendshipConnService(FriendshipConnService friendshipConnService) {
		this.friendshipConnService = friendshipConnService;
	}
	public String getAddFriendshipConnMsg() {
		return addFriendshipConnMsg;
	}
	public void setAddFriendshipConnMsg(String addFriendshipConnMsg) {
		this.addFriendshipConnMsg = addFriendshipConnMsg;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getMpage() {
		return mpage;
	}
	public void setMpage(String mpage) {
		this.mpage = mpage;
	}
	/**
	 * 网站前台生成分页栏内容及链接
	 * @param counts
	 * @param currentPage
	 * @param request
	 * @return
	 */
	private String makePagenav(int counts, int currentPage, HttpServletRequest request){
		int totalPages;
		if (counts%PageParameters.ITEMS_EACH_PAGE == 0)
			totalPages = counts / PageParameters.ITEMS_EACH_PAGE;
		else
			totalPages = counts / PageParameters.ITEMS_EACH_PAGE + 1;
		String url = request.getContextPath() + request.getServletPath();
		return PageParameters.pageNavigator(totalPages, currentPage, url);
		
	}
	/**
	 * 网站后台生成分页栏内容及链接
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
	 * 网站后台友情链接列表
	 * @return
	 */
	public String listFriendshipConn(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int currentPage;
		if(mpage==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(mpage);
		}
		QueryResult<FriendshipConn> qr = friendshipConnService.findAll(currentPage);
		request.getSession().setAttribute("XYDB_FSHIPCONNS", qr.getData());
		String pagenav = makePagenavAdmin(qr.getCount(), currentPage, request);
		request.setAttribute("pagenav", pagenav);
		return SUCCESS;
	}
	/**
	 * 添加友情链接列表
	 * @return
	 */
	public String addFriendshipConn(){
		boolean addFshipconflag=true;
		FriendshipConn friendshipConn=new FriendshipConn(name,url);
		friendshipConnService.addFriendshipConn(friendshipConn);
		addFriendshipConnMsg = getText("addfshipcon.success");
		ActionContext.getContext().getSession().put("addFshipconflag", addFshipconflag);
		return SUCCESS;
	}
	/**
	 * 查询给定id友情链接
	 * @return
	 */
	public String findFriendshipConn(){
		ActionContext.getContext().getSession().put("friendshipConn", friendshipConnService.findById(id));
		ActionContext.getContext().getSession().put("friendshipConnupdateid", id);
		return SUCCESS;
	}
	/**
	 * 更新友情链接
	 * @return
	 */
	public String updateFriendshipConn(){
		FriendshipConn friendshipConn=friendshipConnService.findById(id);
		friendshipConn.setName(name);
		friendshipConn.setUrl(url);
		friendshipConnService.updateFriendshipConn(friendshipConn);
		return SUCCESS;
	}
	/**
	 * 删除友情链接
	 * @return
	 */
	public String deleteFriendshipConn(){
		friendshipConnService.deleteFriendshipConn(id);
		return SUCCESS;
	}
}
