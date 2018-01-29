package cn.edn.yan.dao;

import java.util.Collection;
import java.util.List;

import cn.edn.yan.domain.Section;


public interface SectionDAO {
	public Section selectById(int sid);
	public	List<Section> listSection();
	/**
	 * 根据子栏目名查询子栏目
	 * @param sectionName
	 * @return
	 */
	public Section findSection(String sectionName);
	public List<Section> selectSection(String moduleName ,int qryCount);
	
	/**
	 * 根据子栏目名和栏目id查询当前页的子栏目
	 * @param sectionname
	 * @param moduleid
	 * @param currentPage
	 * @return
	 */
	public Collection<Section> selectSection(String sectionname, int moduleid,int currentPage);
	public int qryCounts();
	public int qryCounts(String sectionname,int moduleid);
	public Collection<Section> queryAll(int currentPage);
	public Section findById(int id);
	public void addSection(Section section);
	public void deleteSection(int id);
	public void updateSection(Section section);
	public List<Section> findByModuleid(int moduleid);
}
