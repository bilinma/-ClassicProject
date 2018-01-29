package cn.edn.yan.action;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import cn.edn.yan.domain.Affiche;
import cn.edn.yan.domain.FriendshipConn;
import cn.edn.yan.domain.Information;
import cn.edn.yan.domain.Module;
import cn.edn.yan.domain.Section;
import cn.edn.yan.service.AfficheService;
import cn.edn.yan.service.FriendshipConnService;
import cn.edn.yan.service.InformationService;
import cn.edn.yan.service.ModuleService;
import cn.edn.yan.service.SectionService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ModuleAction extends ActionSupport{
	private final Logger logger = Logger.getLogger(ModuleAction.class);
	
	private ModuleService moduleService;
	private SectionService sectionService;
	private AfficheService afficheService;
	private InformationService informationService;
	private FriendshipConnService friendshipConnService;
	private String addModuleMsg;
	private int id;
	private String name;
	private String url;

	public void setModuleService(ModuleService moduleService) {
		this.moduleService = moduleService;
	}
	public void setSectionService(SectionService sectionService) {
		this.sectionService = sectionService;
	}
	public void setInformationService(InformationService informationService) {
		this.informationService = informationService;
	}
	
	public void setAfficheService(AfficheService afficheService) {
		this.afficheService = afficheService;
	}
	public void setFriendshipConnService(FriendshipConnService friendshipConnService) {
		this.friendshipConnService = friendshipConnService;
	}
	public String getAddModuleMsg() {
		return addModuleMsg;
	}
	public void setAddModuleMsg(String addModuleMsg) {
		this.addModuleMsg = addModuleMsg;
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
	/**
	 * 后台栏目列表
	 * @return
	 */
	public String listModule(){
		HttpServletRequest request=ServletActionContext.getRequest();
		request.getSession().setAttribute("XYDB_MODULES",moduleService.listModule());
		logger.debug(moduleService.listModule());
		return SUCCESS;
	}
	/**
	 * 根据id查询栏目
	 * @return
	 */
	public String findModule(){
		ActionContext.getContext().getSession().put("module", moduleService.findByIdModule(id));
		ActionContext.getContext().getSession().put("moduleupdateid", id);
		logger.debug("根据id查询栏目"+id);
		return SUCCESS;
	}
	/**
	 * 添加栏目
	 * @return
	 */
	public String addModule(){	
		boolean addModuleflag=false;
		Module oldmodule=moduleService.selectModule(name);
		if(oldmodule==null){	
			Module module=new Module(name,url);
			moduleService.addModule(module);
			addModuleflag=true;
			addModuleMsg = getText("addmodule.success");
			ActionContext.getContext().getSession().put("addModuleflag", addModuleflag);
			return SUCCESS;
		}else{
			addModuleMsg = getText("addmodule.fail");
			ActionContext.getContext().getSession().put("addModuleflag", addModuleflag);
			return INPUT;
		}
	}
	/**
	 * 删除栏目
	 * @return
	 */
	public String deleteModule(){
		//删除信息
		List <Information> informations=informationService.findByModuleid(id);
		if(informations!=null){
			for(Information information:informations){
				informationService.deleteInformation(information.getId());
			}
		}
		//删除子栏目
		List<Section> sections=sectionService.findByModuleid(id);
		if(sections!=null){
			for(Section section:sections){
				sectionService.deleteSection(section.getId());
			}
		}
		moduleService.delectModule(id);
		return SUCCESS;
	}
	/**
	 * 更新栏目
	 * @return
	 */
	public String updateModule(){
		Module module=moduleService.findByIdModule(id);
		module.setName(name);
		module.setUrl(url);
		moduleService.updateModule(module);
		return SUCCESS;
	}
	
	/**
	 * 前台代码
	 * 加载主页
	 * @return
	 */
	public String listModules(){
		//加载模块信息
		List<Module> ms = moduleService.listModule();
		ActionContext.getContext().getSession().put("XYDB_MODULES",ms);
		//加载主页图片滚动信息		
		imgRollInfo();
		//加载新闻资讯信息
		List<Information> infors=informationService.selectByModuleName("新闻资讯", 8);
		if(infors!=null&&infors.size()>0){
			Information headInfo=infors.get(0);
			infors.remove(0);
			ActionContext.getContext().getSession().put("XYDB_HEADNEWS",headInfo);
		}
		ActionContext.getContext().getSession().put("XYDB_NEWSS",infors);
		//加载业务内容信息
		Module module=moduleService.selectModule("业务内容");
		if(module!=null){
			Set<Section> sections=module.getSections();
			Set<Section> treeSections=new TreeSet<Section>();
			for(Section section:sections){
				treeSections.add(section);
			}
			ActionContext.getContext().getSession().put("XYDB_SECTIONS",treeSections);
		}
		//加载政策法规信息
		List<Information> operations=informationService.selectByModuleName("政策法规", 6);
		ActionContext.getContext().getSession().put("XYDB_OPERATIONS",operations);
		//加载网站公告信息
		List<Affiche> affiches=afficheService.selectAffiche(10);
		ActionContext.getContext().getSession().put("XYDB_NEWAFFICHES", affiches);
		//加载公司简讯信息
		Section section=sectionService.findSection("公司简讯");
		if(section!=null){
			Set<Information> companynewss=section.getInformations();
			ActionContext.getContext().getSession().put("XYDB_COMPANYNEWS",companynewss);
		}
		//加载友情链接信息
		List<FriendshipConn> fcs=friendshipConnService.listFriendshipConn();
		ActionContext.getContext().getSession().put("XYDB_FRIENDCONN",fcs);
		return SUCCESS;
	}
	/**
	 * 网站新闻图片滚动
	 */
	private void imgRollInfo(){
		String picsUrl=null;
		String linksUrl=null;
		String newsTitle=null;
		List<Information> infors=informationService.selectImgUrl("新闻资讯", 4);
		for(int i=0;i<infors.size();i++){
			if(i==0){
				picsUrl=".."+infors.get(i).getImgurl();
				linksUrl="jsp/news/showNews.action?id="+infors.get(i).getId();
				newsTitle=infors.get(i).getName();
			}else{
				picsUrl=picsUrl+"|.."+infors.get(i).getImgurl();
				linksUrl=linksUrl+"|jsp/news/showNews.action?id="+infors.get(i).getId();
				newsTitle=newsTitle+"|"+infors.get(i).getName();
			}
		}
		logger.debug("picsUrl==============================="+picsUrl);
		logger.debug("linksUrl=============================="+linksUrl);
		logger.debug("newsTitle============================="+newsTitle);
		ActionContext.getContext().getSession().put("picsUrl", picsUrl);
		ActionContext.getContext().getSession().put("linksUrl", linksUrl);
		ActionContext.getContext().getSession().put("newsTitle", newsTitle);
	}
}
