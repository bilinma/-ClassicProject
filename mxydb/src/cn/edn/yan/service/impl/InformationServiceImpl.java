package cn.edn.yan.service.impl;

import java.util.List;

import cn.edn.yan.dao.InformationDAO;
import cn.edn.yan.domain.Information;
import cn.edn.yan.service.InformationService;
import cn.edn.yan.util.QueryResult;

public class InformationServiceImpl implements InformationService {
	private InformationDAO informationDao;
	
	public void setInformationDao(InformationDAO informationDao) {
		this.informationDao = informationDao;
	}

	public List<Information> selectByModuleName(String moduleName, int qryCount) {
		return informationDao.selectByModuleName(moduleName, qryCount);
	}

	public Information findById(int id) {
		return informationDao.findById(id);
	}

	public List<Information> selectBySectionName(String sectionName,int qryCount) {
		return informationDao.selectBySectionName(sectionName, qryCount);
	}
	public QueryResult<Information> findAll(int currentPage) {
		QueryResult<Information> qr = new QueryResult<Information>();
		qr.setData(informationDao.queryAll(currentPage));
		qr.setCount(informationDao.qryCounts());

		return qr;
	}
	
	public QueryResult<Information> findBySectionName(String sectionName,int currentPage) {
		QueryResult<Information> qr = new QueryResult<Information>();
		qr.setData(informationDao.queryBySectionName(sectionName,currentPage));
		qr.setCount(informationDao.qryCounts(sectionName));
		return qr;
	}

	public int qryCounts(String sectionName) {
		return informationDao.qryCounts(sectionName);
	}

	public QueryResult<Information> selectInfo(int moduleid,String sectionname,String inforname, int currentPage) {
		QueryResult<Information> qr = new QueryResult<Information>();
		qr.setData(informationDao.selectInfo(moduleid,sectionname,inforname, currentPage));
		qr.setCount(informationDao.qryCounts( moduleid, sectionname,inforname));
		return qr;
	}

	public List<Information> findByModuleid(int moduleid) {
		return informationDao.findByModuleid(moduleid);
	}

	public void deleteInformation(int id) {
		informationDao.deleteInformation(id);
	}

	public List<Information> findBySectionid(int sectionid) {
		return informationDao.findBySectionid(sectionid);
	}

	public void addInformation(Information information) {
		informationDao.addInformation(information);
	}

	public void updateInformation(Information information) {
		informationDao.updateInformation(information);
	}

	public List<Information> selectHotinfo(String moduleName, int qryCount) {
		return informationDao.selectHotinfo(moduleName, qryCount);
	}
	public QueryResult<Information> findAll(String sectionName,int currentPage) {
		QueryResult<Information> qr = new QueryResult<Information>();
		qr.setData(informationDao.queryAll(sectionName,currentPage));
		qr.setCount(informationDao.qryCounts(sectionName));

		return qr;
	}

	public int findNewInfor() {
		return informationDao.findNewInfor();
	}

	public QueryResult<Information> searchInforByName(int sectionid,
			String inforname, int currentPage) {
		QueryResult<Information> qr = new QueryResult<Information>();
		qr.setData(informationDao.searchInforByName(sectionid, inforname, currentPage));
		qr.setCount(informationDao.qryCountsByName(sectionid, inforname));
		return qr;
	}

	public QueryResult<Information> searchInforByContext(int sectionid,
			String inforcontext, int currentPage) {
		QueryResult<Information> qr = new QueryResult<Information>();
		qr.setData(informationDao.searchInforByContext(sectionid, inforcontext, currentPage));
		qr.setCount(informationDao.qryCountsByContext(sectionid, inforcontext));
		return qr;
	}

	public List<Information> selectImgUrl(String moduleName, int qryCount) {
		return informationDao.selectImgUrl(moduleName, qryCount);
	}

	
}
