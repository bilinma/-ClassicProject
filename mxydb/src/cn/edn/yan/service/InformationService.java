package cn.edn.yan.service;

import java.util.List;

import cn.edn.yan.domain.Information;
import cn.edn.yan.util.QueryResult;

/**
 * 
 * @author Administrator
 *
 */
public interface InformationService {

	public int qryCounts(String sectionName);
	/**
	 * 查询当前页的信息并封装成QueryResult对象返回
	 * @param currentPage
	 * @return
	 */
	public QueryResult<Information> findAll(int currentPage);
	public QueryResult<Information> findAll(String sectionName,int currentPage);
	public QueryResult<Information> findBySectionName(String sectionName,int currentPage);
	public List<Information> selectBySectionName(String sectionName,int qryCount);
	public List<Information> selectByModuleName(String moduleName ,int qryCount);
	public QueryResult<Information> selectInfo(int moduleid,String sectionname,String inforname, int currentPage);
	public List<Information> selectHotinfo(String moduleName, int qryCount);
	
	public void deleteInformation(int id);
	public List<Information> findByModuleid(int moduleid);
	public List<Information> findBySectionid(int sectionid);
	public void addInformation(Information information);
	public Information findById(int id);
	public void updateInformation(Information information);
	public int findNewInfor() ;
	public QueryResult<Information> searchInforByName(int sectionid, String inforname, int currentPage);
	public QueryResult<Information> searchInforByContext(int sectionid, String inforcontext, int currentPage);
	
	public List<Information> selectImgUrl(String moduleName, int qryCount);
}
