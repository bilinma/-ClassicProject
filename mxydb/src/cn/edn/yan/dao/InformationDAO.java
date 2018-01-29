package cn.edn.yan.dao;

import java.util.Collection;
import java.util.List;

import cn.edn.yan.domain.Information;

public interface InformationDAO {
	/**
	 * 查询信息的行数
	 * @return
	 */
	public int qryCounts();
	public int qryCounts(String sectionName);
	public int qryCounts(int moduleid,String sectionname,String inforname);
	public int qryCountsByName(int sectionid,String inforname);
	public int qryCountsByContext(int sectionid,String inforcontext);
	
	/**
	 * 根据子栏目名查询当前页的信息
	 * @param sectionName
	 * @param currentPage
	 * @return
	 */
	Collection<Information> queryBySectionName(String sectionName,int currentPage);
	Collection<Information> queryAll(int currentPage);
	Collection<Information> queryAll(String sectionName,int currentPage);
	/**
	 * 根据子栏目名查询qryCount行信息
	 * @param sectionName
	 * @param qryCount
	 * @return
	 */
	public List<Information> selectBySectionName(String sectionName,int qryCount);
	public List<Information> selectByModuleName(String moduleName ,int qryCount);
	/**
	 * 根据栏目id、子栏目名和信息名查询当前页信息
	 * @param moduleid
	 * @param sectionname
	 * @param inforname
	 * @param currentPage
	 * @return
	 */
	public List<Information> selectInfo(int moduleid,String sectionname,String inforname ,int currentPage);
	/**
	 * 根据栏目名查询固定行数的信息
	 * @param moduleName
	 * @param qryCount
	 * @return
	 */
	public List<Information> selectHotinfo(String moduleName ,int qryCount);
	
	/**
	 * 根据栏目id查询信息
	 * @param moduleid
	 * @return
	 */
	public List<Information> findByModuleid(int moduleid);
	/**
	 * 根据子栏目id查询信息
	 * @param sectionid
	 * @return
	 */
	public List<Information> findBySectionid(int sectionid);
	/**
	 *  根据信息id查询信息
	 * @param id
	 * @return
	 */
	public Information findById(int id);
	public void deleteInformation(int id);
	public void addInformation(Information information);
	public void updateInformation(Information information);
	/**
	 * 查询最新添加信息的id
	 * @return
	 */
	public int findNewInfor();
	/**
	 * 根据子栏目id和信息名查询当前页的信息
	 * @param sectionid
	 * @param inforname
	 * @param currentPage
	 * @return
	 */
	public List<Information> searchInforByName(int sectionid, String inforname, int currentPage);
	/**
	 * 根据子栏目id和信息内容查询当期页的信息
	 * @param sectionid
	 * @param inforcontext
	 * @param currentPage
	 * @return
	 */
	public List<Information> searchInforByContext(int sectionid, String inforcontext, int currentPage);
	/**
	 * 根据模块名查询qryCount行数据
	 * @param moduleName
	 * @param qryCount
	 * @return
	 */
	public List<Information> selectImgUrl(String moduleName, int qryCount);
}
