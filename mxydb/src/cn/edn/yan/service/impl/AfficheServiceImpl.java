package cn.edn.yan.service.impl;

import java.util.Collection;
import java.util.List;

import cn.edn.yan.dao.AfficheDAO;
import cn.edn.yan.domain.Affiche;
import cn.edn.yan.domain.Information;
import cn.edn.yan.service.AfficheService;
import cn.edn.yan.util.QueryResult;

public class AfficheServiceImpl implements AfficheService {
	private AfficheDAO afficheDao;
	public void setAfficheDao(AfficheDAO afficheDao) {
		this.afficheDao = afficheDao;
	}

	public List<Affiche> selectAffiche(int qryCount) {
		return afficheDao.selectAffiche(qryCount);
	}

	public Affiche findById(int id) {
		return afficheDao.selectById(id);
	}
	public QueryResult<Affiche> findAll(int currentPage) {
		QueryResult<Affiche> qr = new QueryResult<Affiche>();
		qr.setData(afficheDao.queryAll(currentPage));
		qr.setCount(afficheDao.qryCounts());

		return qr;
	}
	public Collection<Affiche> queryHotaff(int qryCount) {
		return afficheDao.queryHotaff(qryCount);
		
	}
	public void addAffiche(Affiche affiche) {
		afficheDao.addAffiche(affiche);
	}

	public void delectModule(int id) {
		afficheDao.deleteAffiche(id);
	}

	public void updateAffiche(Affiche affiche) {
		afficheDao.updateAffiche(affiche);
		
	}

	public QueryResult<Affiche> selectAffiche(String affichename,
			int currentPage) {
		QueryResult<Affiche> qr = new QueryResult<Affiche>();
		qr.setData(afficheDao.selectAffiche(affichename, currentPage));
		qr.setCount(afficheDao.qryCounts(affichename));
		return qr;
	}

	public QueryResult<Affiche> listAffiche(int currentPage) {
		QueryResult<Affiche> qr = new QueryResult<Affiche>();
		qr.setData(afficheDao.listAffiche(currentPage));
		qr.setCount(afficheDao.qryCounts());
		return qr;
	}
	

}
