package cn.edn.yan.service;

import java.util.List;

import cn.edn.yan.domain.Section;
import cn.edn.yan.util.QueryResult;

public interface SectionService {
	public	List<Section> listSection();
	public Section selectById(int sid);
	public Section findSection(String sectionName);
	public List<Section> selectSection(String moduleName ,int qryCount);
	
	public QueryResult<Section> selectSection(String sectionname, int moduleid,int currentPage);
	public QueryResult<Section> findAll(int currentPage);
	public Section findById(int id);
	public void deleteSection(int id);
	public void addSection(Section section);
	public void updateSection(Section section);
	public List<Section> findByModuleid(int moduleid);
	
}
