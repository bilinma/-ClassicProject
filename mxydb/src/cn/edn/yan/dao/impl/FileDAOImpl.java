package cn.edn.yan.dao.impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edn.yan.dao.FileDAO;
import cn.edn.yan.domain.File;

public class FileDAOImpl extends HibernateDaoSupport implements FileDAO {

	public void addFile(File file) {
		getHibernateTemplate().save(file);	
	}

	public void deleteFile(int id) {
		getHibernateTemplate().delete(findById(id));
	}

	public File findById(int id) {
		return (File) getHibernateTemplate().get(File.class, id);
	}
	
}
