package cn.edn.yan.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import cn.edn.yan.domain.Information;
import cn.edn.yan.domain.Module;
import cn.edn.yan.domain.Section;
import cn.edn.yan.service.InformationService;
import cn.edn.yan.service.ModuleService;
import cn.edn.yan.service.SectionService;
import cn.edn.yan.util.MPageParameters;
import cn.edn.yan.util.QueryResult;
import cn.edn.yan.util.SPageParameters;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SectionAction extends ActionSupport{
	private final Logger logger = Logger.getLogger(SectionAction.class);
	private SectionService sectionService;
	private ModuleService moduleService;
	private InformationService informationService;
	private String addSectionMsg;
	private String sectionname;
	private int id;
	private String name;
	private String author;
	private int moduleid;
	private String mpage;
	private String spage;
	
	public void setSectionService(SectionService sectionService) {
		this.sectionService = sectionService;
	}
	public void setModuleService(ModuleService moduleService) {
		this.moduleService = moduleService;
	}
	public void setInformationService(InformationService informationService) {
		this.informationService = informationService;
	}
	public String getAddSectionMsg() {
		return addSectionMsg;
	}
	public void setAddSectionMsg(String addSectionMsg) {
		this.addSectionMsg = addSectionMsg;
	}
	public String getSectionname() {
		return sectionname;
	}
	public void setSectionname(String sectionname) {
		this.sectionname = sectionname;
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
	public int getModuleid() {
		return moduleid;
	}
	public void setModuleid(int moduleid) {
		this.moduleid = moduleid;
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
	 * 网站后台子栏目列表
	 * @return
	 */
	public String listSection(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int currentPage;
		if(mpage==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(mpage);
		}
		QueryResult<Section> qr = sectionService.findAll(currentPage);
		request.getSession().setAttribute("XYDB_SECTIONS", qr.getData());
		String pagenav = makePagenavAdmin(qr.getCount(), currentPage, request);
		request.setAttribute("pagenav", pagenav);
		ActionContext.getContext().getSession().put("modules", moduleService.findAll());
		return SUCCESS;
	}
	/**
	 * 网站后台添加子栏目
	 * @return
	 */
	public String addSection(){
		boolean addSectionflag=true;
		Module module=moduleService.findByIdModule(moduleid);
		Section section=new Section(name,author);
		section.setModule(module);
		sectionService.addSection(section);
		addSectionMsg = getText("addaffiche.success");
		ActionContext.getContext().getSession().put("addSectionflag", addSectionflag);
		return SUCCESS;
	}
	/**
	 * 根据id查询子栏目
	 * @return
	 */
	public String findSection(){
		ActionContext.getContext().getSession().put("section", sectionService.findById(id));
		ActionContext.getContext().getSession().put("sectionupdateid", id);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.getSession().setAttribute("modules",moduleService.listModule());
		return SUCCESS;
	}
	/**
	 * 更新子栏目
	 * @return
	 */
	public String updateSection(){
		Section section=sectionService.findById(id);
		section.setName(name);
		section.setAuthor(author);
		Module module=moduleService.findByIdModule(moduleid);
		section.setModule(module);
		sectionService.updateSection(section);
		return SUCCESS;
	}
	/**
	 * 删除子栏目
	 * @return
	 */
	public String deleteSection(){
		List <Information> informations=informationService.findBySectionid(id);
		if(informations!=null){
			for(Information information:informations){
				informationService.deleteInformation(information.getId());
			}
		}
		sectionService.deleteSection(id);
		return SUCCESS;
	}
	/**
	 * 后台查询子栏目列表
	 * @return
	 */
	public String selectSection(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int currentPage=1;
		if(spage==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(spage);
		}
		QueryResult<Section> qr = sectionService.selectSection(sectionname.trim(), moduleid, currentPage);
		request.getSession().setAttribute("XYDB_SECTIONS", qr.getData());
		String pagenav = makePagenavSelect(qr.getCount(), currentPage, request);
		request.setAttribute("pagenav", pagenav);
		return SUCCESS;
	}
}
