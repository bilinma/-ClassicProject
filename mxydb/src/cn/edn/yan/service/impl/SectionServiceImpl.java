package cn.edn.yan.service.impl;

import java.util.List;

import cn.edn.yan.dao.SectionDAO;
import cn.edn.yan.domain.Information;
import cn.edn.yan.domain.Section;
import cn.edn.yan.service.SectionService;
import cn.edn.yan.util.QueryResult;

public class SectionServiceImpl implements SectionService {
	private SectionDAO sectionDao;

	public void setSectionDao(SectionDAO sectionDao) {
		this.sectionDao = sectionDao;
	}

	public List<Section> listSection() {
		return null;
	}

	public List<Section> selectSection(String moduleName, int qryCount) {
		return null;
	}

	public Section findSection(String sectionName) {
		return sectionDao.findSection(sectionName);
	}

	public Section selectById(int sid) {
		return sectionDao.selectById(sid);
	}

	public QueryResult<Section> findAll(int currentPage) {
		QueryResult<Section> qr=new QueryResult<Section>();
		qr.setData(sectionDao.queryAll(currentPage));
		qr.setCount(sectionDao.qryCounts());
		return qr;
	}

	public Section findById(int id) {
		return sectionDao.findById(id);
	}

	public void deleteSection(int id) {
		sectionDao.deleteSection(id);
	}

	public void addSection(Section section) {
		sectionDao.addSection(section);
	}

	public void updateSection(Section section) {
		sectionDao.updateSection(section);
	}

	public List<Section> findByModuleid(int moduleid) {
		return sectionDao.findByModuleid(moduleid);
	}

	public QueryResult<Section> selectSection(String sectionname,
			int moduleid, int currentPage) {
		QueryResult<Section> qr=new QueryResult<Section>();
		qr.setData(sectionDao.selectSection(sectionname, moduleid, currentPage));
		qr.setCount(sectionDao.qryCounts(sectionname, moduleid));
		return qr;
	}

}
