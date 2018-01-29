package cn.edn.yan.action;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.htmlparser.util.ParserException;

import cn.edn.yan.domain.Information;
import cn.edn.yan.domain.Module;
import cn.edn.yan.domain.Section;
import cn.edn.yan.service.InformationService;
import cn.edn.yan.service.ModuleService;
import cn.edn.yan.service.SectionService;
import cn.edn.yan.util.MPageParameters;
import cn.edn.yan.util.PageParameters;
import cn.edn.yan.util.PictureUrl;
import cn.edn.yan.util.QueryResult;
import cn.edn.yan.util.SPageParameters;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class InformationAction extends ActionSupport{
	private final Logger logger = Logger.getLogger(InformationAction.class);
	
	private InformationService informationService;
	private ModuleService moduleService;
	private SectionService sectionService;
	private String addInformationMsg;
	private String inforname;
	private int id;
	private String name;
	private String author;
	private Date createdate;
	private String autdit;
	private String releaseunit;
	private String context;
	private int scansum;
	private int moduleid;
	private String mname;
	private int sectionid;
	private String sectionname;
	private String sname;
	private String addfile;
	private String mpage;
	private String page;
	private String spage;
	private String searchtype;
	public void setInformationService(InformationService informationService) {
		this.informationService = informationService;
	}
	public void setModuleService(ModuleService moduleService) {
		this.moduleService = moduleService;
	}
	public void setSectionService(SectionService sectionService) {
		this.sectionService = sectionService;
	}
	public String getAddInformationMsg() {
		return addInformationMsg;
	}
	public void setAddInformationMsg(String addInformationMsg) {
		this.addInformationMsg = addInformationMsg;
	}
	
	public String getInforname() {
		return inforname;
	}
	public void setInforname(String inforname) {
		this.inforname = inforname;
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
	public int getModuleid() {
		return moduleid;
	}
	public void setModuleid(int moduleid) {
		this.moduleid = moduleid;
	}
	public int getSectionid() {
		return sectionid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getSectionname() {
		return sectionname;
	}
	public void setSectionname(String sectionname) {
		this.sectionname = sectionname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public void setSectionid(int sectionid) {
		this.sectionid = sectionid;
	}
	public String getAddfile() {
		return addfile;
	}
	public void setAddfile(String addfile) {
		this.addfile = addfile;
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
	public String getSearchtype() {
		return searchtype;
	}
	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
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
	 * 网站后台查询分页栏内容及链接
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
	 * 网站后台信息列表
	 * @return
	 */
	public String listInformation(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int currentPage;
		if(mpage==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(mpage);
		}
		QueryResult<Information> qr = informationService.findAll(currentPage);
		request.getSession().setAttribute("XYDB_INFORMATIONS", qr.getData());
		String pagenav = makePagenavAdmin(qr.getCount(), currentPage, request);
		request.setAttribute("pagenav", pagenav);
		ActionContext.getContext().getSession().put("modules", moduleService.findAll());
		return SUCCESS;
	}
	/**
	 * 网站后台添加信息
	 * @return
	 */
	public String addInformation(){
		boolean addInformationflag=true;
		String imgurl=null;
		try {
			imgurl=PictureUrl.getImageURL(context);
		} catch (ParserException e) {
			e.printStackTrace();
		}
		Information information=new Information(name, author,createdate, autdit,releaseunit,context,1,imgurl);
		Module module=moduleService.findByIdModule(moduleid);
		if(module!=null){
			information.setModule(module);
			information.setMname(module.getName());
		}
		Section section=sectionService.findById(sectionid);
		if(section!=null){
			information.setSection(section);
			information.setSname(section.getName());
		}
		informationService.addInformation(information);
		addInformationMsg = getText("addinformation.success");
		ActionContext.getContext().getSession().put("addInformationflag", addInformationflag);
		if("yes".equals(addfile)){
			ActionContext.getContext().getSession().put("files",null );
			return INPUT;
		}
		return SUCCESS;
	}
	/**
	 * 网站后台根据id查询信息
	 * @return
	 */
	public String findInformation(){
		Information information=informationService.findById(id);
		ActionContext.getContext().getSession().put("sections", sectionService.findByModuleid(information.getModule().getId()));
		ActionContext.getContext().getSession().put("inforupdateid",id );
		ActionContext.getContext().getSession().put("information",information );
		return SUCCESS;
	}
	/**
	 * 网站后台更新信息
	 * @return
	 */
	public String updateInformation(){
		String imgurl=null;
		try {
			imgurl=PictureUrl.getImageURL(context);
		} catch (ParserException e) {
			e.printStackTrace();
		}
		Information information=informationService.findById(id);
		information.setName(name);
		information.setImgurl(imgurl);
		information.setAuthor(author);
		information.setAutdit(autdit);
		information.setCreatedate(createdate);
		information.setContext(context);
		information.setReleaseunit(releaseunit);
		
		Module module=moduleService.findByIdModule(moduleid);
		if(module!=null){
			information.setModule(module);
			information.setMname(module.getName());
		}
		Section section=sectionService.findById(sectionid);
		if(section!=null){
			information.setSection(section);
			information.setSname(section.getName());
		}
		informationService.updateInformation(information);
		return SUCCESS;
	}
	/**
	 * 网站后台删除信息
	 * @return
	 */
	public String deleteInformation(){
		informationService.deleteInformation(id);
		return SUCCESS;
	}
	/**
	 * 网站后台查询信息
	 * @return
	 */
	public String selectInfor(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int currentPage=1;
		if(spage==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(spage);
		}
		QueryResult<Information> qr = informationService.selectInfo(moduleid,sectionname.trim(),inforname.trim(), currentPage);
		request.getSession().setAttribute("XYDB_INFORMATIONS", qr.getData());
		String pagenav = makePagenavSelect(qr.getCount(), currentPage, request);
		request.setAttribute("pagenav", pagenav);
		return SUCCESS;
	}
	/**
	 * 加载子栏目信息
	 */
	private void loadSection(){
		String moduleName=null;
		if(mname!=null){
			try { 
				//moduleName = new String(mname.getBytes("ISO-8859-1"),"utf-8");
				moduleName=java.net.URLDecoder.decode(mname,"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}else{
			moduleName="新闻资讯";
		}
		System.out.println("+++++++++++++++"+mname+"+++++++++++++++++");
		System.out.println("+++++++++++++++"+moduleName+"+++++++++++++++++");
		Module module=moduleService.selectModule(moduleName);
		moduleid=module.getId();
		if(module!=null){
			Set<Section> sections=module.getSections();
			Set<Section> treeSections=new TreeSet<Section>();
			for(Section section:sections){
				treeSections.add(section);
			}
			ActionContext.getContext().getSession().put("XYDB_SECTIONS",treeSections);
		}
		
	}

	/**
	 * 查找新闻信息
	 * @return
	 */
	public String findInfo(){
		//加载最新新闻
		List<Information> infors=informationService.selectByModuleName("新闻资讯", 10);
		ActionContext.getContext().getSession().put("XYDB_LAESTRINFOS",infors);
		
		//加载热门新闻
		List<Information> hotinfors=informationService.selectHotinfo("新闻资讯",10);
		ActionContext.getContext().getSession().put("XYDB_HOTINFOS",hotinfors);
		loadSection();
		
		Information info=informationService.findById(id);
		ActionContext.getContext().getSession().put("XYDB_INFO", info);
		
		Set<cn.edn.yan.domain.File> files=info.getFiles();
		ActionContext.getContext().getSession().put("XYDB_FILES", files);
		return SUCCESS;
	}
	
	/**
	 * 加载关于我们首页
	 * @return
	 */
	public String listAboutusInfo(){
		loadSection();
		List<Information> informations=null;
		List<Section> sections=sectionService.findByModuleid(moduleid);
		for(Section section:sections){
			informations=informationService.selectBySectionName(section.getName(), 3);
			ActionContext.getContext().getSession().put("XYDB_Infors"+section.getId(), informations);
		}
		return SUCCESS;
	}
	/**
	 * 加载新闻首页
	 * @return
	 */
	public String listNewsInfo(){
		//加载子栏目信息
		loadSection();
		List<Information> informations=null;
		List<Section> sections=sectionService.findByModuleid(moduleid);
		for(Section section:sections){
			informations=informationService.selectBySectionName(section.getName(), 6);
			ActionContext.getContext().getSession().put("XYDB_Infors"+section.getId(), informations);
		}
//		//加载公司新闻
//		informations=informationService.selectBySectionName("公司新闻", 6);
//		ActionContext.getContext().getSession().put("XYDB_INFO_corpNews", informations);
//		//加载行业资讯
//		informations=informationService.selectBySectionName("行业资讯", 6);
//		ActionContext.getContext().getSession().put("XYDB_INFO_industryNews", informations);
//		//加载媒体报道
//		informations=informationService.selectBySectionName("媒体报道", 6);
//		ActionContext.getContext().getSession().put("XYDB_INFO_mediaReport", informations);
//		//加载公司简讯
//		informations=informationService.selectBySectionName("公司简讯", 6);
//		ActionContext.getContext().getSession().put("XYDB_INFO_corpInfo", informations);
		
		//加载最新新闻
		List<Information> infors=informationService.selectByModuleName("新闻资讯", 10);
		ActionContext.getContext().getSession().put("XYDB_LAESTRINFOS",infors);
		
		//加载热门新闻
		List<Information> hotinfors=informationService.selectHotinfo("新闻资讯",10);
		ActionContext.getContext().getSession().put("XYDB_HOTINFOS",hotinfors);
		return SUCCESS;
	}
	/**
	 * 加载政策法规首页
	 * @return
	 */
	public String listPolicyInfo(){
		//加载子栏目信息
		loadSection();
		List<Information> informations=null;
		List<Section> sections=sectionService.findByModuleid(moduleid);
		for(Section section:sections){
			informations=informationService.selectBySectionName(section.getName(), 6);
			ActionContext.getContext().getSession().put("XYDB_Infors"+section.getId(), informations);
		}
//		//加载国家法规
//		informations=informationService.selectBySectionName("国家法规", 6);
//		ActionContext.getContext().getSession().put("XYDB_INFO_countryLaw", informations);
//		//加载地方法规
//		informations=informationService.selectBySectionName("地方法规", 6);
//		ActionContext.getContext().getSession().put("XYDB_INFO_localLaw", informations);
//		//加载行业法规
//		informations=informationService.selectBySectionName("行业法规", 6);
//		ActionContext.getContext().getSession().put("XYDB_INFO_industryLaw", informations);
		
		//加载最新政策法规
		List<Information> infors=informationService.selectByModuleName("政策法规", 10);
		ActionContext.getContext().getSession().put("XYDB_LAESTRINFOS",infors);
		
		//加载热门政策法规
		List<Information> hotinfors=informationService.selectHotinfo("政策法规",10);
		ActionContext.getContext().getSession().put("XYDB_HOTINFOS",hotinfors);
		return SUCCESS;
	}
	/**
	 * 加载业务内容首页
	 * @return
	 */
	public String listOperationInfo(){
		//加载子栏目信息
		loadSection();
		List<Information> informations=null;
		List<Section> sections=sectionService.findByModuleid(moduleid);
		for(Section section:sections){
			informations=informationService.selectBySectionName(section.getName(), 6);
			ActionContext.getContext().getSession().put("XYDB_Infors"+section.getId(), informations);
		}
		return SUCCESS;
	}
	/**
	 * 跳转到某个子栏目
	 * @return
	 */
	public String listInfor(){
		HttpServletRequest request=ServletActionContext.getRequest();
		Section section=sectionService.selectById(sectionid);
		request.setAttribute("SectionName", section.getName());
		int currentPage;
		if(page==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(page);
		}
		QueryResult<Information> qr = informationService.findAll(section.getName(),currentPage);
		request.getSession().setAttribute("XYDB_LISTINFO", qr.getData());
		String pagenav = makePagenav(qr.getCount(), currentPage, request);
		request.setAttribute("pagenav", pagenav);
		return SUCCESS;
	}
	/**
	 * 查询子栏目信息
	 * @return
	 */
	public String sectionInfor(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String sectionName;
		try {
			sectionName = new String(sname.trim().getBytes("ISO-8859-1"),"UTF-8");
			request.setAttribute("SectionName", sectionName);
			int currentPage;
			if(page==null){
				currentPage=1;
			}else{
				currentPage=Integer.parseInt(page);
			}
			QueryResult<Information> qr = informationService.findAll(sectionName,currentPage);
			request.getSession().setAttribute("XYDB_LISTINFO", qr.getData());
			String pagenav = makePagenav(qr.getCount(), currentPage, request);
			request.setAttribute("pagenav", pagenav);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	/**
	 * 网站前台查询新闻
	 * @return
	 */
	public String searchNews(){
		HttpServletRequest request=ServletActionContext.getRequest();
		Section section=sectionService.selectById(sectionid);
		request.setAttribute("SectionName", section.getName());
		int currentPage;
		if(page==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(page);
		}
		if("title".equals(searchtype)){
			QueryResult<Information> qr = informationService.searchInforByName(sectionid, inforname, currentPage);
			request.getSession().setAttribute("XYDB_LISTINFO", qr.getData());
			String pagenav = makePagenav(qr.getCount(), currentPage, request);
			request.setAttribute("pagenav", pagenav);
		}else{
			QueryResult<Information> qr = informationService.searchInforByContext(sectionid, inforname, currentPage);
			request.getSession().setAttribute("XYDB_LISTINFO", qr.getData());
			String pagenav = makePagenav(qr.getCount(), currentPage, request);
			request.setAttribute("pagenav", pagenav);
		}
		return SUCCESS;
	}
	
}
