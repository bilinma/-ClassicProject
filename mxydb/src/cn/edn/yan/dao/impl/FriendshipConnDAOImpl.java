package cn.edn.yan.dao.impl;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edn.yan.dao.FriendshipConnDAO;
import cn.edn.yan.domain.Admin;
import cn.edn.yan.domain.FriendshipConn;
import cn.edn.yan.util.PageParameters;

public class FriendshipConnDAOImpl extends HibernateDaoSupport implements FriendshipConnDAO {

	public List<FriendshipConn> listFriendshipConn() {
		return getHibernateTemplate().loadAll(FriendshipConn.class);
	}

	public int qryCounts() {
		Long l = (Long)this.getHibernateTemplate().find("select count(*) from FriendshipConn f").get(0) ; 
		return l.intValue();
	}

	public Collection<FriendshipConn> queryAll(int currentPage) {
		final int start = (currentPage-1)*PageParameters.ITEMS_EACH_PAGE;
		final int cnt = PageParameters.ITEMS_EACH_PAGE;
		final String hql="from  FriendshipConn";
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query qry = session.createQuery(hql);
				qry.setFirstResult(start);
				qry.setMaxResults(cnt);
				return qry.list();
			}
		});
	}

	public void addFriendshipConn(FriendshipConn friendshipConn) {
		getHibernateTemplate().save(friendshipConn);
	}

	public FriendshipConn findById(int id) {
		return (FriendshipConn) getHibernateTemplate().get(FriendshipConn.class, id);
	}

	public void updateFriendshipConn(FriendshipConn friendshipConn) {
		getHibernateTemplate().update(friendshipConn);
	}

	public void deleteFriendshipConn(int id) {
		getHibernateTemplate().delete(findById(id));
	}
}
