package cn.edn.yan.service;

import java.util.Collection;
import java.util.List;

import cn.edn.yan.domain.Affiche;
import cn.edn.yan.util.QueryResult;

public interface AfficheService {
	public Affiche findById(int id);
	public List<Affiche> selectAffiche(int qryCount);
	public QueryResult<Affiche> findAll(int currentPage);
	public QueryResult<Affiche> listAffiche(int currentPage);
	public Collection<Affiche> queryHotaff(int qryCount);
	public void addAffiche(Affiche affiche);
	public void delectModule(int id);
	public void updateAffiche(Affiche affiche);
	public QueryResult<Affiche> selectAffiche(String affichename, int currentPage);
}
