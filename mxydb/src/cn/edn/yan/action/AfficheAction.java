package cn.edn.yan.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import cn.edn.yan.domain.Affiche;
import cn.edn.yan.service.AfficheService;
import cn.edn.yan.util.PageParameters;
import cn.edn.yan.util.QueryResult;
import cn.edn.yan.util.SPageParameters;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AfficheAction extends ActionSupport{
	private final Logger logger = Logger.getLogger(AfficheAction.class);
	
	private AfficheService afficheService;
	private String addAfficheMsg;
	private String affichename;
	private int id;
	private String name;
	private String simplename;
	private String author;
	private Date createdate;
	private String autdit;
	private String releaseunit;
	private String context;
	private int scansum;
	private String page;
	private String mpage;
	private String spage;
	public void setAfficheService(AfficheService afficheService) {
		this.afficheService = afficheService;
	}
	public String getAddAfficheMsg() {
		return addAfficheMsg;
	}

	public void setAddAfficheMsg(String addAfficheMsg) {
		this.addAfficheMsg = addAfficheMsg;
	}

	public String getAffichename() {
		return affichename;
	}

	public void setAffichename(String affichename) {
		this.affichename = affichename;
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
	public String getSimplename() {
		return simplename;
	}
	public void setSimplename(String simplename) {
		this.simplename = simplename;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getAutdit() {
		return autdit;
	}
	public void setAutdit(String autdit) {
		this.autdit = autdit;
	}
	public String getReleaseunit() {
		return releaseunit;
	}
	public void setReleaseunit(String releaseunit) {
		this.releaseunit = releaseunit;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public int getScansum() {
		return scansum;
	}
	public void setScansum(int scansum) {
		this.scansum = scansum;
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
	public String getSpage() {
		return spage;
	}
	public void setSpage(String spage) {
		this.spage = spage;
	}
	/**
	 * 
	 * 网站前台生成分页栏内容及链接
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
	private String makePagenavSelect(int counts, int currentPage, HttpServletRequest request){
		int totalPages;
		if (counts%SPageParameters.ITEMS_EACH_PAGE == 0)
			totalPages = counts / SPageParameters.ITEMS_EACH_PAGE;
		else
			totalPages = counts / SPageParameters.ITEMS_EACH_PAGE + 1;
		String url = request.getContextPath() + request.getServletPath();
		return SPageParameters.pageNavigator(totalPages, currentPage, url);
	}
	/**
	 * 网站后台公告列表
	 * @return
	 */
	public String listAffiche(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int currentPage;
		if(mpage==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(mpage);
		}
		QueryResult<Affiche> qr = afficheService.findAll(currentPage);
		request.getSession().setAttribute("XYDB_AFFICHES", qr.getData());
		String pagenav = makePagenavAdmin(qr.getCount(), currentPage, request);
		request.setAttribute("pagenav", pagenav);
		logger.debug(pagenav);
		return SUCCESS;
	}
	/**
	 * 添加公告
	 * @return
	 */
	public String addAffiche(){
		boolean addAfficheflag=true;
		Affiche affiche=new Affiche(name, simplename,  author,createdate, autdit,releaseunit,context,1);
		afficheService.addAffiche(affiche);
		addAfficheMsg = getText("addaffiche.success");
		ActionContext.getContext().getSession().put("addAfficheflag", addAfficheflag);
		return SUCCESS;
	}
	/**
	 *  查找公告确定更行对象
	 * @return
	 */
	 
	public String findAffiche(){
		Affiche affiche=afficheService.findById(id);
		ActionContext.getContext().getSession().put("affiche", affiche);
		ActionContext.getContext().getSession().put("afficheupdateid", id);
		return SUCCESS;
	}
	/**
	 * 更新公告
	 * @return
	 */
	public String updateAffiche(){
		Affiche affiche=afficheService.findById(id);
		affiche.setName(name);
		affiche.setSimplename(simplename);
		affiche.setAuthor(author);
		affiche.setCreatedate(createdate);
		affiche.setContext(context);
		affiche.setReleaseunit(releaseunit);
		affiche.setAutdit(autdit);
		afficheService.updateAffiche(affiche);
		return SUCCESS;
	}
	/**
	 * 删除公告
	 * @return
	 */
	public String deleteAffiche(){
		afficheService.delectModule(id);
		return SUCCESS;
	}
	/**
	 * 后台查询公告
	 * @return
	 */
	public String selectAffiche(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int currentPage;
		if(spage==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(spage);
		}
		QueryResult<Affiche> qr = afficheService.selectAffiche(affichename.trim(), currentPage);
		request.getSession().setAttribute("XYDB_AFFICHES", qr.getData());
		String pagenav = makePagenavSelect(qr.getCount(), currentPage, request);
		request.setAttribute("pagenav", pagenav);
		return SUCCESS;
	}
	/*
	 * 前台代码
	 */
	
	/**
	 * 网站前台主页公告列表
	 */
	public String listAffiches(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int currentPage;
		if(page==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(page);
		}
		QueryResult<Affiche> qr = afficheService.findAll(currentPage);
		request.getSession().setAttribute("XYDB_AFFICHES", qr.getData());
		String pagenav = makePagenav(qr.getCount(), currentPage, request);
		request.setAttribute("pagenav", pagenav);
		List<Affiche> affiches=afficheService.selectAffiche(10);
		ActionContext.getContext().getSession().put("XYDB_FFICHES", affiches);
		return SUCCESS;
	}
	/**
	 * 查看公告
	 * @return
	 */
	public String findById(){
		Affiche affiche=afficheService.findById(id);
		ActionContext.getContext().getSession().put("XYDB_AFFICHE", affiche);
		return SUCCESS;
	}
	

}
