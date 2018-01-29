package cn.edn.yan.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edn.yan.dao.RightDAO;
import cn.edn.yan.domain.Right;

public class RightDAOImpl  extends HibernateDaoSupport  implements RightDAO {

	public Right findById(int id) {
		
		return (Right) getHibernateTemplate().get(Right.class, id);
	}

	public List<Right> listRight() {
		return getHibernateTemplate().loadAll(Right.class);
	}

}
