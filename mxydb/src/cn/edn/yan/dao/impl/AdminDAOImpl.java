package cn.edn.yan.dao.impl;

import java.sql.SQLException;
import java.util.Collection;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edn.yan.dao.AdminDAO;
import cn.edn.yan.domain.Admin;
import cn.edn.yan.util.PageParameters;

public class AdminDAOImpl extends HibernateDaoSupport implements AdminDAO {
	
	private final Logger logger = Logger.getLogger(AdminDAOImpl.class);

	public Admin adminLogin(String loginname, String password) {
		final String name = loginname;
		final String pwd = password;
		return (Admin) this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				return session.createQuery("from Admin a  where a.loginname=? and a.loginpassword=?").setString(0, name).setString(1, pwd).uniqueResult();
			}
		});
	}

	public int qryCounts() {
		Long l = (Long)this.getHibernateTemplate().find("select count(*) from Admin a ").get(0) ; 
		return l.intValue();
	}


	public Collection<Admin> queryAll(int currentPage) {
		final int start = (currentPage-1)*PageParameters.ITEMS_EACH_PAGE;
		final int cnt = PageParameters.ITEMS_EACH_PAGE;
		final String hql="from Admin ";
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query qry = session.createQuery(hql);
				qry.setFirstResult(start);
				qry.setMaxResults(cnt);
				return qry.list();
			}
		});
	}

	public void addAdmin(Admin admin) {
		getHibernateTemplate().save(admin);
	}

	public Admin queryByLoginname(String loginname) {
		final String name=loginname;
		return (Admin) this.getHibernateTemplate().execute(new HibernateCallback(){

			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				return session.createQuery("from Admin a where a.loginname=? ").setString(0, name).uniqueResult();
			}
		});
	}

	public void updateAdmin(Admin admin) {
		getHibernateTemplate().update(admin);		
	}

	public Admin findById(int id) {
		
		return (Admin) getHibernateTemplate().get(Admin.class, id);
	}

	public void deleteAdmin(int id) {
		getHibernateTemplate().delete(findById(id));
	}
	public int qryCounts(String adminname) {
		Long l = (Long)this.getHibernateTemplate().find("select count(*) from Admin Ad where Ad.name like'%"+adminname+"%'").get(0) ; 
		return l.intValue();
	}
	public Collection<Admin> selectAdmin(String adminname, int currentPage) {
		final int start = (currentPage-1)*PageParameters.ITEMS_EACH_PAGE;
		final int cnt = PageParameters.ITEMS_EACH_PAGE;
		final String hql="from Admin Ad where Ad.name like'%"+adminname+"%'";
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query qry = session.createQuery(hql);
				qry.setFirstResult(start);
				qry.setMaxResults(cnt);
				return qry.list();
			}
		});
	}
}
