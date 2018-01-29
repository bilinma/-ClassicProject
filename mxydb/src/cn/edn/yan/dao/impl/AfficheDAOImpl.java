package cn.edn.yan.dao.impl;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edn.yan.dao.AfficheDAO;
import cn.edn.yan.domain.Affiche;
import cn.edn.yan.domain.Information;
import cn.edn.yan.util.MPageParameters;
import cn.edn.yan.util.PageParameters;
import cn.edn.yan.util.SPageParameters;

public class AfficheDAOImpl extends HibernateDaoSupport implements AfficheDAO {

	public List<Affiche> selectAffiche(int qryCount) {
		final String hql="from Affiche a  order by a.createdate desc";
		final int count=qryCount;
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){

			public Object doInHibernate(Session session)throws HibernateException, SQLException {
				Query qry= session.createQuery(hql);
				qry.setFirstResult(0);
				qry.setMaxResults(count);
				return qry.list();
			}
			
		});
	}

	public Affiche selectById(int id) {
		return (Affiche) getHibernateTemplate().get(Affiche.class, id);
	}

	public Collection<Affiche> queryAll(int currentPage) {
		final int start = (currentPage-1)*MPageParameters.ITEMS_EACH_PAGE;
		final int cnt = MPageParameters.ITEMS_EACH_PAGE;
		final String hql="from Affiche aff  order by aff.id ";
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query qry = session.createQuery(hql);
				qry.setFirstResult(start);
				qry.setMaxResults(cnt);
				return qry.list();
			}
		});
	}
	public int qryCounts() {
		Long l = (Long)this.getHibernateTemplate().find("select count(*) from Affiche aff ").get(0) ; 
		return l.intValue();
	}
	public int qryCounts(String affichename) {
		Long l = (Long)this.getHibernateTemplate().find("select count(*) from Affiche Aff where Aff.name like'%"+affichename+"%'").get(0) ; 
		return l.intValue();
	}

	public Collection<Affiche> queryHotaff(int qryCount) {
		final String hql="from Affiche aff  order by aff.createdate desc";
		final int cnt = qryCount;
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query qry = session.createQuery(hql);
				qry.setFirstResult(0);
				qry.setMaxResults(cnt);
				return qry.list();
			}
		});
	}

	public void addAffiche(Affiche affiche) {
		getHibernateTemplate().save(affiche);		
	}

	public void deleteAffiche(int id) {
		getHibernateTemplate().delete(findById(id));
	}

	public Affiche findById(int id) {
		return (Affiche) getHibernateTemplate().get(Affiche.class, id);
	}

	public void updateAffiche(Affiche affiche) {
		getHibernateTemplate().update(affiche);
	}

	public List<Affiche> selectAffiche(String affichename, int currentPage) {
		final int start = (currentPage-1)*SPageParameters.ITEMS_EACH_PAGE;
		final int cnt = SPageParameters.ITEMS_EACH_PAGE;
		final String hql="from Affiche Aff where Aff.name like'%"+affichename+"%' order by Aff.scansum ";
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session)throws HibernateException, SQLException {
				Query qry= session.createQuery(hql);
				qry.setFirstResult(start);
				qry.setMaxResults(cnt);
				return qry.list();
			}
			
		});
	}

	public List<Affiche> listAffiche(int qryCount) {
		final int start = (qryCount-1)*PageParameters.ITEMS_EACH_PAGE;
		final int cnt = PageParameters.ITEMS_EACH_PAGE;
		final String hql="from Affiche aff  order by aff.id ";
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
