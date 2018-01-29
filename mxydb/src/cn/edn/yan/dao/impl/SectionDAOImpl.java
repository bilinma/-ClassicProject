package cn.edn.yan.dao.impl;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edn.yan.dao.SectionDAO;
import cn.edn.yan.domain.Section;
import cn.edn.yan.util.MPageParameters;
import cn.edn.yan.util.PageParameters;
import cn.edn.yan.util.SPageParameters;

public class SectionDAOImpl extends HibernateDaoSupport implements SectionDAO {

	public List<Section> listSection() {
		return getHibernateTemplate().loadAll(Section.class);
	}
	
	public List<Section> selectSection(String moduleName, int qryCount) {
		final String hql="from Section s where s.module.name='"+moduleName+"'";
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

	public Section findSection(String sectionName) {
		final String name=sectionName;
		return (Section) this.getHibernateTemplate().execute(new HibernateCallback(){

			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				return session.createQuery("from Section s join fetch s.informations where s.name=? ").setString(0, name).uniqueResult();
			}
		});
	}

	public Section selectById(int sid) {
		return (Section) getHibernateTemplate().get(Section.class,sid);
	}

	public int qryCounts() {
		Long l = (Long)this.getHibernateTemplate().find("select count(*) from Section ").get(0) ; 
		return l.intValue();
	}

	public Collection<Section> queryAll(int currentPage) {
		final int start = (currentPage-1)*MPageParameters.ITEMS_EACH_PAGE;
		final int cnt = MPageParameters.ITEMS_EACH_PAGE;
		final String hql="from Section s join fetch s.module order by s.id ";
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query qry = session.createQuery(hql);
				qry.setFirstResult(start);
				qry.setMaxResults(cnt);
				return qry.list();
			}
		});
	}

	public Section findById(int id) {
		return (Section) getHibernateTemplate().get(Section.class,id);
	}

	public void deleteSection(int id) {
		getHibernateTemplate().delete(findById(id));
	}

	public void addSection(Section section) {
		getHibernateTemplate().save(section);
	}

	public void updateSection(Section section) {
		getHibernateTemplate().update(section);
	}

	public List<Section> findByModuleid(int moduleid) {
		String hql="from Section s where s.module.id=?";
		return getHibernateTemplate().find(hql,moduleid);
	}

	public int qryCounts(String sectionname, int moduleid) {
		Long l = (Long)this.getHibernateTemplate().find("select count(*) from Section S where S.name like '%"+sectionname+"%' and S.module.id ="+moduleid).get(0) ; 
		return l.intValue();
	}
	public Collection<Section> selectSection(String sectionname, int moduleid,int currentPage){
		final int start = (currentPage-1)*SPageParameters.ITEMS_EACH_PAGE;
		final int cnt = SPageParameters.ITEMS_EACH_PAGE;
		final String hql="from Section S join fetch S.module where S.name like '%"+sectionname+"%' and S.module.id="+moduleid;
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
