package cn.edn.yan.dao;

import java.util.Collection;
import java.util.List;

import cn.edn.yan.domain.Affiche;

public interface AfficheDAO {
	/**
	 * 查询所有公告记录数
	 * @return
	 */
	public int qryCounts();
	/**
	 * 根据公告名查询公告记录数
	 * @param affichename
	 * @return
	 */
	public int qryCounts(String affichename);
	/**
	 * 根据id查询公告
	 * @param id
	 * @return
	 */
	public Affiche selectById(int id);
	/**
	 * 查询qryCount行公告
	 * @param qryCount
	 * @return
	 */
	public List<Affiche> selectAffiche(int qryCount);
	/**
	 * 网站根据页号查询公告
	 * @param currentPage
	 * @return
	 */
	public List<Affiche> listAffiche(int qryCount);
	/**
	 * 后台根据页号查询公告
	 * @param currentPage
	 * @return
	 */
	public Collection<Affiche> queryAll(int currentPage);
	/**
	 * 查询最近公告
	 * @param qryCount
	 * @return
	 */
	public Collection<Affiche> queryHotaff(int qryCount);
	/**
	 * 添加公告
	 * @param affiche
	 */
	public void addAffiche(Affiche affiche);
	/**
	 * 根据公告id删除公告
	 * @param id
	 */
	public void deleteAffiche(int id);
	/**
	 * 根据公告id查询此公告
	 * @param id
	 * @return
	 */
	public Affiche findById(int id);
	/**
	 * 跟新公告
	 * @param affiche
	 */
	public void updateAffiche(Affiche affiche);
	/**
	 * 根据公告名查询当前页的公告
	 * @param affichename
	 * @param currentPage
	 * @return
	 */
	public List<Affiche> selectAffiche(String affichename ,int currentPage);
}
