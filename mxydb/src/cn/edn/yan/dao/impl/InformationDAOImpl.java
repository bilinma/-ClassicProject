package cn.edn.yan.dao.impl;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edn.yan.dao.InformationDAO;
import cn.edn.yan.domain.Information;
import cn.edn.yan.util.MPageParameters;
import cn.edn.yan.util.PageParameters;
import cn.edn.yan.util.SPageParameters;

/**
 * 
 * @author Ma_xbin
 *
 */
public class InformationDAOImpl extends HibernateDaoSupport  implements InformationDAO {

	public List<Information> selectByModuleName(String moduleName, int qryCount) {
		final String hql="from Information Infor where Infor.mname='"+moduleName+"' order by Infor.createdate desc";
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

	public List<Information> selectBySectionName(String sectionName,int qryCount) {
		final String hql="from Information Infor where Infor.sname='"+sectionName+"' order by Infor.createdate desc";
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

	public Collection<Information> queryBySectionName(String sectionName,int currentPage) {
		final int start = (currentPage-1)*PageParameters.ITEMS_EACH_PAGE;
		final int cnt = PageParameters.ITEMS_EACH_PAGE;
		final String hql="from Information infor where infor.sname='"+sectionName+"' order by infor.createdate ";
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
		Long l = (Long)this.getHibernateTemplate().find("select count(*) from Information infor ").get(0) ; 
		return l.intValue();
	}
	public int qryCounts(String sectionName) {
		Long l = (Long)this.getHibernateTemplate().find("select count(*) from Information infor where infor.sname='"+sectionName+"'").get(0) ; 
		return l.intValue();
	}
	public Collection<Information> queryAll(int currentPage) {
		final int start = (currentPage-1)*MPageParameters.ITEMS_EACH_PAGE;
		final int cnt = MPageParameters.ITEMS_EACH_PAGE;
		final String hql="from Information infor  order by infor.id ";
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query qry = session.createQuery(hql);
				qry.setFirstResult(start);
				qry.setMaxResults(cnt);
				return qry.list();
			}
		});
	}
	public int qryCounts(int moduleid,String sectionname,String inforname) {
		Long l = (Long)this.getHibernateTemplate().find("select count(*) from Information Infor where Infor.module.id="+moduleid+" and Infor.section.name like'%"+sectionname+"%' and Infor.name like'%"+inforname+"%'").get(0) ; 
		return l.intValue();
	}
	public List<Information> selectInfo(int moduleid,String sectionname, String inforname, int currentPage) {
		final int start = (currentPage-1)*SPageParameters.ITEMS_EACH_PAGE;
		final int cnt = SPageParameters.ITEMS_EACH_PAGE;
		final String hql="from Information Infor where Infor.module.id="+moduleid+" and Infor.section.name like'%"+sectionname+"%' and Infor.name like'%"+inforname+"%'";
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session)throws HibernateException, SQLException {
				Query qry= session.createQuery(hql);
				qry.setFirstResult(start);
				qry.setMaxResults(cnt);
				return qry.list();
			}
			
		});
	}

	public List<Information> findByModuleid(int moduleid) {
		String hql="from Information infor where infor.module.id=?";
		return getHibernateTemplate().find(hql,moduleid);
	}

	public void deleteInformation(int id) {
		getHibernateTemplate().delete(findById(id));
	}

	public Information findById(int id) {
		Information information= (Information) this.getHibernateTemplate().get(Information.class, id);
		information.setScansum(information.getScansum()+1);
		getHibernateTemplate().update(information);
		return information;
	}

	public List<Information> findBySectionid(int sectionid) {
		String hql="from Information infor where infor.section.id=?";
		return getHibernateTemplate().find(hql,sectionid);
	}

	public void addInformation(Information information) {
		getHibernateTemplate().save(information);
	}

	public void updateInformation(Information information) {
		getHibernateTemplate().update(information);
	}

	public List<Information> selectHotinfo(String moduleName, int qryCount) {
		final String hql="from Information Infor where Infor.mname='"+moduleName+"' order by Infor.scansum ";
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
	
	public Collection<Information> queryAll(String sectionName,int currentPage) {
		final int start = (currentPage-1)*PageParameters.ITEMS_EACH_PAGE;
		final int cnt = PageParameters.ITEMS_EACH_PAGE;
		final String hql="from Information infor where infor.sname='"+sectionName+"' order by infor.createdate ";
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query qry = session.createQuery(hql);
				qry.setFirstResult(start);
				qry.setMaxResults(cnt);
				return qry.list();
			}
		});
	}

	public int findNewInfor() {
		String hql="select max(infor.id) from Information infor ";
		return  (Integer) getHibernateTemplate().find(hql).get(0);
	}
	public int qryCountsByName(int sectionid, String inforname) {
		Long l = (Long)this.getHibernateTemplate().find("select count(*) from Information Infor where Infor.section.id="+sectionid+"and Infor.name like'%"+inforname+"%'").get(0) ; 
		return l.intValue();
	}

	public List<Information> searchInforByName(int sectionid, String inforname, int currentPage) {
		final int start = (currentPage-1)*PageParameters.ITEMS_EACH_PAGE;
		final int cnt = PageParameters.ITEMS_EACH_PAGE;
		final String hql="from Information Infor where Infor.section.id="+sectionid+" and Infor.name like'%"+inforname+"%'";
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session)throws HibernateException, SQLException {
				Query qry= session.createQuery(hql);
				qry.setFirstResult(0);
				qry.setMaxResults(cnt);
				return qry.list();
			}
			
		});
	}
	public int qryCountsByContext(int sectionid, String inforcontext) {
		Long l = (Long)this.getHibernateTemplate().find("select count(*) from Information Infor where Infor.section.id="+sectionid+"and Infor.context like'%"+inforcontext+"%'").get(0) ; 
		return l.intValue();
	}
	public List<Information> searchInforByContext(int sectionid,
			String inforcontext, int currentPage) {
		final int start = (currentPage-1)*PageParameters.ITEMS_EACH_PAGE;
		final int cnt = PageParameters.ITEMS_EACH_PAGE;
		final String hql="from Information Infor where Infor.section.id="+sectionid+" and Infor.context like'%"+inforcontext+"%'";
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session)throws HibernateException, SQLException {
				Query qry= session.createQuery(hql);
				qry.setFirstResult(0);
				qry.setMaxResults(cnt);
				return qry.list();
			}
			
		});
	}

	public List<Information> selectImgUrl(String moduleName, int qryCount) {
		final String hql="from Information Infor where Infor.mname='"+moduleName+"' and imgurl is not null and imgurl!='' order by Infor.createdate desc";
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



}
