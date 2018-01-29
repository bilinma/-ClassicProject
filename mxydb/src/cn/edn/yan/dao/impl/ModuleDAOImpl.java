package cn.edn.yan.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edn.yan.dao.ModuleDAO;
import cn.edn.yan.domain.Module;

public class ModuleDAOImpl extends HibernateDaoSupport implements ModuleDAO {

	public List<Module> listModule() {
		return getHibernateTemplate().loadAll(Module.class);
	}

	public Module selectModule(String moduleName) {
		final String name=moduleName;
		return (Module) this.getHibernateTemplate().execute(new HibernateCallback(){

			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				return session.createQuery("from Module m join fetch m.sections where m.name=? ").setString(0, name).uniqueResult();
			}
		});
	}

	public Module findByIdModule(int id) {
		return (Module) getHibernateTemplate().get(Module.class, id);
		
	}
	
	public Module findModle(int id){
		return (Module) getHibernateTemplate().get(Module.class, id);
	}
	public void addModule(Module module) {
		getHibernateTemplate().save(module);
	}

	public void delectModule(int id) {
		getHibernateTemplate().delete(findModle(id));
	}

	public void updateModule(Module module) {
		getHibernateTemplate().update(module);
	}


}
