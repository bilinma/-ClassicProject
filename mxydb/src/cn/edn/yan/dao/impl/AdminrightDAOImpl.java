package cn.edn.yan.dao.impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edn.yan.dao.AdminrightDAO;
import cn.edn.yan.domain.Adminright;

public class AdminrightDAOImpl extends HibernateDaoSupport implements AdminrightDAO {

	public void addAdminright(Adminright adminright) {
		getHibernateTemplate().save(adminright);
	}
	
	public Adminright findById(int id){
		return (Adminright) getHibernateTemplate().get(Adminright.class, id);
	}
	public void deleteAdminright(int id) {
		getHibernateTemplate().delete(findById(id));
	}
	
	
}
